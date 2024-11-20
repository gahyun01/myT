from django.contrib import admin
from .models import Plan, PlanDetail, Post, PostImage, Heart, Scrap, Comment

# Register your models here.
admin.site.register(Plan)

class PlanDetailAdmin(admin.ModelAdmin):
    list_display = ('plan', 'date', 'time', 'location')
    readonly_fields = ('latitude', 'longitude')  # 좌표는 직접 수정하지 않도록 설정

    class Media:
        js = (
            'https://dapi.kakao.com/v2/maps/sdk.js?appkey=YOUR_KAKAO_API_KEY&libraries=services',
            'javascript/kakao_map_admin.js',  # 추가할 JavaScript 파일
        )

admin.site.register(PlanDetail, PlanDetailAdmin)

admin.site.register(Post)
admin.site.register(PostImage)
admin.site.register(Heart)
admin.site.register(Scrap)
admin.site.register(Comment)