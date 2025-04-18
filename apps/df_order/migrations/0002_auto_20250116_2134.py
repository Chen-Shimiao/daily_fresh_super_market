# Generated by Django 3.2.25 on 2025-01-16 21:34

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('df_order', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='logistics',
            options={'verbose_name': '物流详情', 'verbose_name_plural': '物流详情'},
        ),
        migrations.AlterField(
            model_name='logistics',
            name='current_status',
            field=models.CharField(max_length=100, verbose_name='物流状态'),
        ),
        migrations.AlterField(
            model_name='logistics',
            name='estimated_delivery_date',
            field=models.DateField(verbose_name='预计送达时间'),
        ),
        migrations.AlterField(
            model_name='logistics',
            name='last_updated',
            field=models.DateTimeField(auto_now=True, verbose_name='上次更新时间'),
        ),
        migrations.AlterField(
            model_name='logistics',
            name='order',
            field=models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='logistics', to='df_order.orderinfo', verbose_name='订单号'),
        ),
        migrations.AlterField(
            model_name='logistics',
            name='tracking_number',
            field=models.CharField(max_length=100, unique=True, verbose_name='快递单号'),
        ),
        migrations.CreateModel(
            name='AfterSaleRequest',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('request_type', models.CharField(choices=[('return', '退货'), ('exchange', '换货'), ('repair', '维修')], max_length=20, verbose_name='售后类型')),
                ('description', models.TextField(verbose_name='问题描述')),
                ('images', models.ImageField(blank=True, null=True, upload_to='after_sale/images/', verbose_name='问题图片')),
                ('status', models.CharField(choices=[('pending', '待处理'), ('processing', '处理中'), ('completed', '已完成'), ('rejected', '已拒绝')], default='pending', max_length=20, verbose_name='处理状态')),
                ('created_at', models.DateTimeField(auto_now_add=True, verbose_name='申请时间')),
                ('updated_at', models.DateTimeField(auto_now=True, verbose_name='更新时间')),
                ('order', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='df_order.orderinfo', verbose_name='订单')),
                ('order_item', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='df_order.orderdetailinfo', verbose_name='订单商品')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='用户')),
            ],
            options={
                'verbose_name': '售后申请',
                'verbose_name_plural': '售后申请',
            },
        ),
    ]
