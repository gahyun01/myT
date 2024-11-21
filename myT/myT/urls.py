from django.urls import path
from . import views
from myT.views import logout_view
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('', views.index, name='index'),  # 기본 경로로 views.index 뷰를 처리
]

# 로그인 및 로그아웃 URL
urlpatterns += [
    path('accounts/login/', views.login_view, name='login'),
    path('accounts/logout/', logout_view, name='logout'),
]

# post
urlpatterns += [
    path('planner/', views.TopPosts, name='planner'),
]
