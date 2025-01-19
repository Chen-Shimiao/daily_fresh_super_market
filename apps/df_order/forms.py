from django import forms
from .models import AfterSaleRequest
from .models import OrderDetailInfo

class AfterSaleRequestForm(forms.ModelForm):
    class Meta:
        model = AfterSaleRequest
        fields = ['request_type', 'description', 'images']
        widgets = {
            'description': forms.Textarea(attrs={'rows': 4, 'cols': 50}),
        }
        labels = {
            'request_type': '售后类型',
            'description': '问题描述',
            'images': '问题图片',
        }


class OrderDetailCommentForm(forms.ModelForm):
    class Meta:
        model = OrderDetailInfo
        fields = ['comment', 'rating']
        labels = {
            'comment': '评价内容',
            'rating': '评分（1-5）',
        }
        widgets = {
            'comment': forms.Textarea(attrs={'class': 'form-control', 'rows': 3}),
            'rating': forms.NumberInput(attrs={'class': 'form-control', 'min': 1, 'max': 5}),
        }
