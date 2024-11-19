from django.urls import path
from . import views
from myT.views import logout_view

urlpatterns = [
    path('', views.index, name='index'),  # 기본 경로로 views.index 뷰를 처리
]

urlpatterns += [
    path('accounts/login/', views.login_view, name='login'),
    path('accounts/logout/', logout_view, name='logout'),
]

urlpatterns += [
    path('planner/', views.planner, name='planner'),
]