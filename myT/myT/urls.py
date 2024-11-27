from django.urls import path
from . import views
from myT.views import logout_view
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth import views as auth_views

urlpatterns = [
    path('', views.index, name='index'),  # 기본 경로로 views.index 뷰를 처리
]

# 로그인 및 로그아웃 URL
urlpatterns += [
    path('accounts/login/', auth_views.LoginView.as_view(), name='login'),
    path('accounts/logout/', logout_view, name='logout'),
]

# banner
urlpatterns = [
    path("/banner/", views.get_weather, name="get_weather"),
    path("", views.index, name="index"),
]

# post
urlpatterns += [
    path('planner/', views.Planner, name='planner'),
]

# test
urlpatterns += [
    path('test/', views.test, name='test'),
]

# sign up
urlpatterns += [
    path('signup/', views.signup, name='signup'),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)