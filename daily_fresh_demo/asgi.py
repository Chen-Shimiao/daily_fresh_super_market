# asgi.py
import os
from django.core.asgi import get_asgi_application
from channels.routing import ProtocolTypeRouter, URLRouter
from channels.auth import AuthMiddlewareStack
from django.urls import path
from chat import consumers  # 引入你将要创建的 WebSocket 消费者

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "daily_fresh_demo.settings")

application = ProtocolTypeRouter({
    "http": get_asgi_application(),
    "websocket": AuthMiddlewareStack(
        URLRouter([
            path('ws/chat/', consumers.ChatConsumer.as_asgi()),  # 配置 WebSocket 路由
        ])
    ),
})
