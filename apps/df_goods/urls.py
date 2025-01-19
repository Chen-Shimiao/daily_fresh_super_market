from django.conf.urls import url
from django.urls import path

from . import views

app_name = 'df_goods'

urlpatterns = [
    path('', views.index, name="index"),  # ^$ 匹配根路径
    path('list<int:tid>_<int:pindex>_<int:sort>/', views.good_list, name="good_list"),
    # ^list(\d+)_(\d+)_(\d+)/$ 替换为<...> 捕获多个参数
    path('<int:id>/', views.detail, name="detail"),  # ^(\d+)/$ 捕获单个数字id
    path('search/', views.ordinary_search, name="ordinary_search"),  # ^search/ 保持不变
]
