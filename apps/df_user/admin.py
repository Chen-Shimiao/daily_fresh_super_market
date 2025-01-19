from django.contrib import admin
from django.urls import path

from df_cart.models import CartInfo
from df_goods.models import GoodsInfo, TypeInfo
from df_order.models import OrderInfo, OrderDetailInfo, Logistics
from .models import UserInfo, GoodsBrowser
from django.contrib import admin
from django.urls import path
from django.db.models import Sum, Count
from django.db.models.functions import TruncDay, TruncMonth
from django.shortcuts import render

class UserInfoAdmin(admin.ModelAdmin):
    list_display = ["uname", "uemail", "ushou", "uaddress", "uyoubian", "uphone"]
    list_per_page = 5
    list_filter = ["uname", "uyoubian"]
    search_fields = ["uname", "uyoubian"]
    readonly_fields = ["uname"]


class GoodsBrowserAdmin(admin.ModelAdmin):
    list_display = ["user", "good"]
    list_per_page = 50
    list_filter = ["user__uname", "good__gtitle"]
    search_fields = ["user__uname", "good__gtitle"]
    readonly_fields = ["user", "good"]
    refresh_times = [3, 5]


admin.site.site_header = '天天生鲜后台管理系统'
admin.site.site_title = '天天生鲜后台管理系统'

admin.site.register(UserInfo, UserInfoAdmin)
admin.site.register(GoodsBrowser, GoodsBrowserAdmin)

class CustomAdminSite(admin.AdminSite):
    site_header = "天天生鲜后台管理系统"
    site_title = "天天生鲜后台管理系统"
    index_title = "欢迎进入后台"

    def index(self, request, extra_context=None):
        if extra_context is None:
            extra_context = {}

        # 获取原有的 app_list
        original_context = super().index(request, extra_context).context_data
        original_app_list = original_context.get('app_list', [])

        # 添加自定义伪应用的链接
        custom_app = {
            'name': '统计工具',
            'app_label': 'statistics',
            'models': [
                {
                    'name': '统计信息',
                    'object_name': 'Statistics',
                    'admin_url': '/custom-admin/statistics/',
                    'add_url': None,
                }
            ],
        }

        # 将自定义应用加入到原有的 app_list
        extra_context['app_list'] = original_app_list + [custom_app]

        # 返回修改后的上下文
        return super().index(request, extra_context=extra_context)

    def get_urls(self):
        urls = super().get_urls()
        custom_urls = [
            path('statistics/', self.statistics_view, name='statistics'),
        ]
        return custom_urls + urls

    def statistics_view(self, request):
        # 统计逻辑
        daily_sales = (
            OrderInfo.objects.filter(oIsPay=True)
            .annotate(day=TruncDay('odate'))
            .values('day')
            .annotate(total_sales=Sum('ototal'))
            .order_by('day')
        )
        daily_sales = [{'day': item['day'].strftime('%m-%d'), 'total_sales': float(item['total_sales'] or 0)} for
                      item in daily_sales]
        hot_products = (
            OrderDetailInfo.objects.filter(order__oIsPay=True)
            .values('goods__gtitle')
            .annotate(total_count=Sum('count'))
            .order_by('-total_count')[:10]
        )

        hot_categories = (
            OrderDetailInfo.objects.filter(order__oIsPay=True)
            .values('goods__gtype__ttitle')
            .annotate(
                total_sales=Sum('price'),
                total_count=Sum('count'),
            )
            .order_by('-total_sales')
        )
        hot_categories = [{'goods__gtype__ttitle':item['goods__gtype__ttitle'],'total_sales': float(item['total_sales'] or 0)} for
                       item in hot_categories]
        context = {
            'daily_sales': list(daily_sales),
            'hot_products': list(hot_products),
            'hot_categories': list(hot_categories),
        }
        return render(request, 'admin/statistics.html', context)


# 注册自定义 Admin
custom_admin_site = CustomAdminSite(name='custom_admin')
custom_admin_site.register(OrderInfo)
custom_admin_site.register(OrderDetailInfo)
custom_admin_site.register(GoodsInfo)
custom_admin_site.register(UserInfo)
custom_admin_site.register(GoodsBrowser)
custom_admin_site.register(CartInfo)
custom_admin_site.register(TypeInfo)
custom_admin_site.register(Logistics)

# http://127.0.0.1:8400/custom-admin/statistics/