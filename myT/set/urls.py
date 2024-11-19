from django.contrib import admin
from django.urls import path, include
from django.views.generic import RedirectView
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),
    path('myT/', include('myT.urls')),  # 'myT' 앱의 URL을 포함
    path('', RedirectView.as_view(url='/myT/', permanent=True)),  # 기본 페이지는 myT로 리디렉션
] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)

# 장고 사이트 인증 URL 추가 (login, logout, password management)
urlpatterns += [
    path('accounts/', include('django.contrib.auth.urls')),
]
