# Generated by Django 2.0.7 on 2025-01-15 19:24

import datetime
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('df_goods', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='GoodsBrowser',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('browser_time', models.DateTimeField(default=datetime.datetime.now, verbose_name='浏览时间')),
                ('good', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='df_goods.GoodsInfo', verbose_name='商品ID')),
            ],
            options={
                'verbose_name': '用户浏览记录',
                'verbose_name_plural': '用户浏览记录',
            },
        ),
        migrations.CreateModel(
            name='UserInfo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('uname', models.CharField(max_length=20, unique=True, verbose_name='用户名')),
                ('upwd', models.CharField(max_length=40, verbose_name='用户密码')),
                ('uemail', models.EmailField(max_length=254, unique=True, verbose_name='邮箱')),
                ('ushou', models.CharField(default='', max_length=20, verbose_name='收货地址')),
                ('uaddress', models.CharField(default='', max_length=100, verbose_name='地址')),
                ('uyoubian', models.CharField(default='', max_length=6, verbose_name='邮编')),
                ('uphone', models.CharField(default='', max_length=11, verbose_name='手机号')),
            ],
            options={
                'verbose_name': '用户信息',
                'verbose_name_plural': '用户信息',
            },
        ),
        migrations.AddField(
            model_name='goodsbrowser',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='df_user.UserInfo', verbose_name='用户ID'),
        ),
    ]
