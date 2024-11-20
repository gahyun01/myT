from django import forms
from .models import Post, Comment

class PostForm(forms.ModelForm):
    class Meta:
        model = Post
        fields = ['content']

class CommentForm(forms.ModelForm):
    class Meta:
        model = Comment
        fields = ['content']

# class MultipleImageUploadForm(forms.ModelForm):
#     images = forms.FileField(widget=forms.ClearableFileInput(attrs={'multiple': True}), required=False)

#     class Meta:
#         model = Post
#         fields = ['plan', 'user', 'content']  # Post 모델에 맞게 필드 설정
