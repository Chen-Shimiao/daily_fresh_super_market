from django.contrib.auth.decorators import login_required
from django.db import transaction
from django.http import JsonResponse, HttpResponseForbidden
from django.shortcuts import render, HttpResponse, get_object_or_404, redirect

from datetime import datetime
from decimal import Decimal

from .forms import AfterSaleRequestForm, OrderDetailCommentForm
from .models import OrderInfo, OrderDetailInfo, AfterSaleRequest
from df_cart.models import CartInfo
from df_user.models import UserInfo
from df_user import user_decorator


@user_decorator.login
def order(request):
    uid = request.session['user_id']
    user = UserInfo.objects.get(id=uid)
    cart_ids = request.GET.getlist('cart_id')
    carts = []
    total_price = 0
    for goods_id in cart_ids:
        cart = CartInfo.objects.get(id=goods_id)
        carts.append(cart)
        total_price = total_price + float(cart.count) * float(cart.goods.gprice)

    total_price = float('%0.2f' % total_price)
    trans_cost = 10  # 运费
    total_trans_price = trans_cost + total_price
    context = {
        'title': '提交订单',
        'page_name': 1,
        'user': user,
        'carts': carts,
        'total_price': float('%0.2f' % total_price),
        'trans_cost': trans_cost,
        'total_trans_price': total_trans_price,
        # 'value':value
    }
    return render(request, 'df_order/place_order.html', context)

'''
事务提交：
这些步骤中，任何一环节一旦出错则全部退回1
1. 创建订单对象
2. 判断商品库存是否充足
3. 创建 订单 详情 ，多个
4，修改商品库存
5. 删除购物车
'''


@user_decorator.login
@transaction.atomic()  # 事务
def order_handle(request):
    tran_id = transaction.savepoint()  # 保存事务发生点
    cart_ids = request.POST.get('cart_ids')  # 用户提交的订单购物车，此时cart_ids为字符串，例如'1,2,3,'
    user_id = request.session['user_id']  # 获取当前用户的id
    data = {}
    try:
        order_info = OrderInfo()  # 创建一个订单对象
        now = datetime.now()
        order_info.oid = '%s%d' % (now.strftime('%Y%m%d%H%M%S'), user_id)  # 订单号为订单提交时间和用户id的拼接
        order_info.odate = now  # 订单时间
        order_info.user_id = int(user_id)  # 订单的用户id
        order_info.ototal = Decimal(request.POST.get('total'))  # 从前端获取的订单总价
        order_info.oIsPay=1
        order_info.save()  # 保存订单

        for cart_id in cart_ids.split(','):  # 逐个对用户提交订单中的每类商品即每一个小购物车
            cart = CartInfo.objects.get(pk=cart_id)  # 从CartInfo表中获取小购物车对象
            order_detail = OrderDetailInfo()  # 大订单中的每一个小商品订单
            order_detail.order = order_info  # 外键关联，小订单与大订单绑定
            goods = cart.goods  # 具体商品
            if cart.count <= goods.gkucun:  # 判断库存是否满足订单，如果满足，修改数据库
                goods.gkucun = goods.gkucun - cart.count
                goods.save()
                order_detail.goods = goods
                order_detail.price = goods.gprice
                order_detail.count = cart.count
                order_detail.save()
                cart.delete()  # 并删除当前购物车
            else:  # 否则，则事务回滚，订单取消
                transaction.savepoint_rollback(tran_id)
                return HttpResponse('库存不足')
        data['ok'] = 1
        transaction.savepoint_commit(tran_id)
    except Exception as e:
        print("%s" % e)
        print('未完成订单提交')
        transaction.savepoint_rollback(tran_id)  # 事务任何一个环节出错，则事务全部取消
    return JsonResponse(data)


@user_decorator.login
def pay(request):
    pass

def view_logistics(request, order_id):
    user_id = request.session['user_id']
    order = get_object_or_404(OrderInfo, oid=order_id, user=user_id)
    logistics = getattr(order, 'logistics', None)  # 获取物流信息
    return render(request, 'df_order/view_logistics.html', {'order': order, 'logistics': logistics})


def after_sale_detail(request, request_id):
    after_sale_request = get_object_or_404(AfterSaleRequest, id=request_id)
    return render(request, 'df_order/after_sale_detail.html', {'after_sale_request': after_sale_request})


def after_sale_list(request):
    after_sale_requests = AfterSaleRequest.objects.filter(user=request.user)
    return render(request, 'df_order/after_sale_list.html', {'after_sale_requests': after_sale_requests})

def after_sale_create(request, order_item_id):
    order_item = get_object_or_404(OrderDetailInfo, id=order_item_id)

    if request.method == "POST":
        form = AfterSaleRequestForm(request.POST, request.FILES)
        if form.is_valid():
            after_sale_request = form.save(commit=False)
            after_sale_request.user = request.user
            after_sale_request.order = order_item.order
            after_sale_request.order_item = order_item
            after_sale_request.save()
            return redirect('after_sale_list')
    else:
        form = AfterSaleRequestForm()

    return render(request, 'df_order/after_sale_create.html', {'form': form, 'order_item': order_item})

def add_comment(request, order_detail_id):
    """提交评价视图"""
    order_detail = get_object_or_404(OrderDetailInfo, id=order_detail_id)
    print(request.session['user_id'],request.user,order_detail.order.user)
    # # 确保用户只能评价自己的订单
    # if request.user != order_detail.order.user:
    #     return HttpResponseForbidden("您无权评价此商品！")

    if request.method == 'POST':
        form = OrderDetailCommentForm(request.POST, instance=order_detail)
        if form.is_valid():
            form.save()
            return redirect('df_user:order', index=request.session['user_id'])
    else:
        form = OrderDetailCommentForm(instance=order_detail)

    return render(request, 'df_order/add_comment.html', {'form': form, 'order_detail': order_detail})
