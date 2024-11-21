from django.contrib import admin
from .models import *
from django.contrib.auth.models import User
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from django.core.files.storage import default_storage

class ProfileInline(admin.StackedInline):
    model = Profile
    can_delete = True
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
    can_delete = True

@admin.register(Post)
class PostAdmin(admin.ModelAdmin):
    list_display = ('plan', 'user', 'created_at', 'updated_at', 'display_hashtags')
    search_fields = ('content', 'user__username', 'plan__plan_name')
    inlines = [PostImageInline]  # PostImage 관련 Inline 추가

    def save_model(self, request, obj, form, change):
        super().save_model(request, obj, form, change)
        obj.extract_hashtags()

        # 이미지 변경 시 기존 이미지 파일 삭제
        post_images = obj.images.all()  # 이미지 필드를 통해 관련된 모든 이미지 객체 가져오기
        for post_image in post_images:
            if post_image.image:
                old_image = post_image.image.path
                if change and old_image and old_image != post_image.image.path:
                    # 기존 이미지 파일 삭제
                    if default_storage.exists(old_image):
                        default_storage.delete(old_image)

    def display_hashtags(self, obj):
        hashtags = obj.hashtags.split() if obj.hashtags else []
        return ', '.join(hashtags)  # 콤마로 해시태그를 연결해서 표시
    display_hashtags.short_description = '해시태그'

admin.site.register(Heart)
admin.site.register(Scrap)
admin.site.register(Comment)