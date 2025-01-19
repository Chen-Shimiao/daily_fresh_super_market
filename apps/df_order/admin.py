from django.contrib import admin

from .models import OrderDetailInfo, OrderInfo, Logistics, AfterSaleRequest


@admin.register(OrderInfo)
class OrderInfoAdmin(admin.ModelAdmin):

    list_display = ["oid", "user", "odate", "ototal", "oaddress"]
    list_per_page = 5
    list_filter = ["user", "odate", "oaddress"]
    search_fields = ["user__uname"]
    ordering = ["-odate"]

@admin.register(Logistics)
class LogisticsAdmin(admin.ModelAdmin):
    list_display = ('tracking_number', 'order', 'current_status', 'last_updated', 'estimated_delivery_date')

@admin.register(AfterSaleRequest)
class AfterSaleRequestAdmin(admin.ModelAdmin):
    list_display = ['id', 'user', 'order', 'order_item', 'request_type', 'status', 'created_at']
    list_filter = ['request_type', 'status', 'created_at']
    search_fields = ['order__id', 'user__username']
    ordering = ['-created_at']
# @admin.register(OrderDetailInfo)
# class OrderDetailInfoAdmin(admin.ModelAdmin):
#
#     list_display = ["goods", "order", "price", "count"]
#     list_per_page = 5
#     list_filter = ["goods"]
