#!/user/bin/env python
# -*- coding: utf-8 -*-
from django.conf.urls import url
from django.urls import path

from . import views

app_name = 'df_cart'

urlpatterns = [
    path('', views.user_cart, name="cart"),  # ^$ 匹配根路径
    path('add<int:product_id>_<int:quantity>/', views.add, name="add"),  # ^add(\d+)_(\d+)/$ 捕获 product_id 和 quantity
    path('edit<int:cart_id>_<int:count>/', views.edit, name="edit"),
    # ^edit(\d+)_(\d+)/$ 捕获 product_id 和 quantity
    path('delete<int:cart_id>/', views.delete, name="delete"),  # ^delete(\d+)/$ 捕获 product_id
]
