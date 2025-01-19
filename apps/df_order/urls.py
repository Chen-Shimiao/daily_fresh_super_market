#!/user/bin/env python
# -*- coding: utf-8 -*-
from django.urls import path

from . import views

app_name = 'df_order'

urlpatterns = [
    path('', views.order, name="order"),
    path('push/', views.order_handle, name="push"),
    path('logistics/<int:order_id>/', views.view_logistics, name='view_logistics'),
    path('after_sale_create/<int:order_item_id>/', views.after_sale_create, name='after_sale_create'),
    path('after_sale_list/', views.after_sale_list, name='after_sale_list'),
    path('after_sale_detail/<int:request_id>/', views.after_sale_detail, name='after_sale_detail'),
    path('add_comment/<int:order_detail_id>/', views.add_comment, name='add_comment'),  # 提交评价
]