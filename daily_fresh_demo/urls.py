from django.conf import settings
from django.contrib import admin
from django.urls import path
from django.conf.urls import url, include
from django.views.static import serve  # 上传文件处理函数

from df_user.admin import custom_admin_site
from .settings import MEDIA_ROOT


urlpatterns = [
    path('admin/', admin.site.urls),
    path('custom-admin/', custom_admin_site.urls),
    path('', include('df_goods.urls', namespace='df_goods')),
    path('user/', include('df_user.urls', namespace='df_user')),
    path('cart/', include('df_cart.urls', namespace='df_cart')),
    path('order/', include('df_order.urls', namespace='df_order')),
    path('tinymce/', include('tinymce.urls')),
    path('media/<path:path>/', serve, {'document_root': settings.MEDIA_ROOT}),
    path('chat/', include('chat.urls')),
]
