#!/user/bin/env python
# -*- coding: utf-8 -*-
from django.conf.urls import url
from django.urls import path

from . import views
from .views import *

app_name = 'df_user'

urlpatterns = [
    path('register/', views.register, name="register"),
    path('register_handle/', views.register_handle, name="register_handle"),
    path('register_exist/', views.register_exist, name="register_exist"),
    path('login/', views.login, name="login"),
    path('login_handle/', views.login_handle, name="login_handle"),
    path('info/', views.info, name="info"),
    path('order/<int:index>/', views.order, name="order"),
    path('site/', views.site, name="site"),
    # path('place_order/', views.place_order),  # 这里看是否有place_order视图
    path('logout/', views.logout, name="logout"),
]