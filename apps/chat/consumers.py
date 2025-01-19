# chat/consumers.py
import json
from channels.generic.websocket import AsyncWebsocketConsumer

class ChatConsumer(AsyncWebsocketConsumer):
    async def connect(self):
        # 获取房间名称（根据 URL 来获取聊天房间）
        self.room_name = "chat_room"
        self.room_group_name = f'chat_{self.room_name}'

        # 加入房间组
        await self.channel_layer.group_add(
            self.room_group_name,
            self.channel_name
        )

        # 接受连接
        await self.accept()

    async def disconnect(self, close_code):
        # 离开房间组
        await self.channel_layer.group_discard(
            self.room_group_name,
            self.channel_name
        )

    # 接收 WebSocket 消息
    async def receive(self, text_data):
        text_data_json = json.loads(text_data)
        message = text_data_json['message']

        # 发送消息到房间组
        await self.channel_layer.group_send(
            self.room_group_name,
            {
                'type': 'chat_message',
                'message': message
            }
        )

    # 从房间组接收消息
    async def chat_message(self, event):
        message = event['message']

        # 发送消息到 WebSocket
        await self.send(text_data=json.dumps({
            'message': message
        }))
