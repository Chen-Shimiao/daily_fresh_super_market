from django.contrib.auth.models import User
from django.db import models

from df_goods.models import GoodsInfo
from df_user.models import UserInfo

class OrderInfo(models.Model):  # 大订单
    oid = models.CharField(max_length=20, primary_key=True, verbose_name="大订单号")
    user = models.ForeignKey(UserInfo, on_delete=models.CASCADE, verbose_name="订单用户")
    odate = models.DateTimeField(auto_now=True, verbose_name="时间")
    oIsPay = models.BooleanField(default=False, verbose_name="是否支付")
    ototal = models.DecimalField(max_digits=8, decimal_places=2, verbose_name="总价")
    oaddress = models.CharField(max_length=150, verbose_name="订单地址")
    # 虽然订单总价可以由多个商品的单价以及数量求得，但是由于用户订单的总价的大量使用，忽略total的冗余度

    class Meta:
        verbose_name = "订单"
        verbose_name_plural = verbose_name

    def __str__(self):
        # return self.user.uname + "在" + str(self.odate) + "的订单"
        return "{0}在的订单{1}".format(self.user.uname, self.odate)


class OrderDetailInfo(models.Model):  # 大订单中的具体某一商品订单

    goods = models.ForeignKey(GoodsInfo, on_delete=models.CASCADE, verbose_name="商品")  # 关联商品信息
    order = models.ForeignKey(OrderInfo, on_delete=models.CASCADE, verbose_name="订单")
    price = models.DecimalField(max_digits=6, decimal_places=2, verbose_name="商品价格")
    count = models.IntegerField(verbose_name="商品数")
    comment = models.TextField(verbose_name="用户评价", null=True, blank=True)  # 评价内容
    rating = models.PositiveSmallIntegerField(verbose_name="评分", null=True, blank=True)  # 评分（1-5）

    class Meta:
        verbose_name = "订单详情"
        verbose_name_plural = verbose_name

    def __str__(self):
        # return self.goods.gtitle + "(数量为" + str(self.count)  + ")"
        return "{0}(数量为{1})".format(self.goods.gtitle, self.count)

class Logistics(models.Model):
    order = models.OneToOneField(OrderInfo, on_delete=models.CASCADE, related_name='logistics',verbose_name="订单号")
    tracking_number = models.CharField(max_length=100, unique=True,verbose_name="快递单号")
    current_status = models.CharField(max_length=100,verbose_name="物流状态")
    last_updated = models.DateTimeField(auto_now=True,verbose_name="上次更新时间")
    estimated_delivery_date = models.DateField(verbose_name="预计送达时间")
    class Meta:
        verbose_name = "物流详情"
        verbose_name_plural = verbose_name

class AfterSaleRequest(models.Model):
    STATUS_CHOICES = [
        ('pending', '待处理'),
        ('processing', '处理中'),
        ('completed', '已完成'),
        ('rejected', '已拒绝'),
    ]

    REQUEST_TYPE_CHOICES = [
        ('return', '退货'),
        ('exchange', '换货'),
        ('Refund', '仅退款'),
    ]

    user = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name="用户")
    order = models.ForeignKey('OrderInfo', on_delete=models.CASCADE, verbose_name="订单")
    order_item = models.ForeignKey('OrderDetailInfo', on_delete=models.CASCADE, verbose_name="订单商品")
    request_type = models.CharField(max_length=20, choices=REQUEST_TYPE_CHOICES, verbose_name="售后类型")
    description = models.TextField(verbose_name="问题描述")
    images = models.ImageField(upload_to='after_sale/images/', null=True, blank=True, verbose_name="问题图片")
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='pending', verbose_name="处理状态")
    created_at = models.DateTimeField(auto_now_add=True, verbose_name="申请时间")
    updated_at = models.DateTimeField(auto_now=True, verbose_name="更新时间")

    class Meta:
        verbose_name = "售后申请"
        verbose_name_plural = "售后申请"

    def __str__(self):
        return f"{self.order.id} - {self.get_request_type_display()}"