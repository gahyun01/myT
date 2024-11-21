from django.contrib import admin
from .models import *
from django.contrib.auth.models import User
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin

class ProfileInline(admin.StackedInline):
    model = Profile
    can_delete = False
    verbose_name_plural = "Profile"
    fields = ("profile_image",)

class UserAdmin(BaseUserAdmin):
    inlines = (ProfileInline,)

    # 사용자 저장 시 프로필이 없으면 생성
    def save_model(self, request, obj, form, change):
        super().save_model(request, obj, form, change)
        if not hasattr(obj, 'profile'):
            Profile.objects.create(user=obj)

# 기존 UserAdmin을 대체
admin.site.unregister(User)
admin.site.register(User, UserAdmin)

class PlanDetailInline(admin.TabularInline):
    model = PlanDetail
    extra = 1  # 기본적으로 표시할 빈 PlanDetail 개수
    fields = ('day', 'date', 'time', 'location', 'latitude', 'longitude')  # 표시할 필드
    readonly_fields = ('latitude', 'longitude')  # 위도, 경도는 읽기 전용
    show_change_link = True  # 각 PlanDetail로 이동 가능한 링크 표시

@admin.register(Plan)
class PlanAdmin(admin.ModelAdmin):
    list_display = ('plan_name', 'user')  # 목록에서 Plan 이름과 작성자 표시
    inlines = [PlanDetailInline]  # PlanDetail을 Plan과 함께 관리


class PostImageInline(admin.TabularInline):
    model = PostImage
    extra = 1
    fields = ('image', 'number')
    readonly_fields = ('number',)

@admin.register(Post)
class PostAdmin(admin.ModelAdmin):
    list_display = ('plan', 'user', 'created_at', 'updated_at', 'display_hashtags')  # 해시태그는 표시만
    search_fields = ('content', 'user__username', 'plan__plan_name')  # 검색에만 활용
    inlines = [PostImageInline]  # PostImage 관련 Inline 추가
    
    # save 시 해시태그 자동 추출
    def save_model(self, request, obj, form, change):
        super().save_model(request, obj, form, change)
        obj.extract_hashtags()

    # 해시태그를 목록에만 보여주기 (읽기 전용)
    def display_hashtags(self, obj):
        # 공백으로 해시태그 분리
        hashtags = obj.hashtags.split() if obj.hashtags else []
        return ', '.join(hashtags)  # 콤마로 해시태그를 연결해서 표시
    display_hashtags.short_description = '해시태그'

admin.site.register(Heart)
admin.site.register(Scrap)
admin.site.register(Comment)