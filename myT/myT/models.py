from django.db import models
from django.contrib.auth.models import User
from django.core.files.storage import default_storage
import os
import re

# 유저 프로필 이미지
def user_profile_image_path(instance, filename):
    """유저의 ID를 파일명으로 하고 확장자를 유지"""
    ext = os.path.splitext(filename)[1]  # 확장자 추출
    return f"profile/{instance.user.id}{ext}"

class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name="profile")
    profile_image = models.ImageField(upload_to=user_profile_image_path, blank=True, null=True)

    def __str__(self):
        return f"Profile of {self.user.username}"
    

# 여행 계획
class Plan(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='plans')
    plan_name = models.CharField(max_length=30)
    country = models.CharField(max_length=30, default='대한민국')
    
    def __str__(self):
        return self.plan_name


# 여행 세부 계획 ( Plan과 1:N 관계 )
class PlanDetail(models.Model):
    plan = models.ForeignKey(Plan, on_delete=models.CASCADE, related_name='details')
    day = models.PositiveIntegerField(default=1)  # 여행 일차
    date = models.DateField()
    time = models.TimeField()
    location = models.CharField(max_length=255, blank=True, null=True)  # 주소 정보
    latitude = models.FloatField(blank=True, null=True)  # 위도
    longitude = models.FloatField(blank=True, null=True)  # 경도

    def __str__(self):
        return f"{self.plan.plan_name} - {self.date} {self.time}"


# 여행에 대한 게시물
class Post(models.Model):
    plan = models.OneToOneField(Plan, on_delete=models.CASCADE, related_name='post')
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='posts')
    content = models.TextField()
    hashtags = models.TextField(blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    
    def __str__(self):
        return f"Post for {self.plan.plan_name} by {self.user.username}"

    def save(self, *args, **kwargs):
        if '#' in self.content:  # content에 해시태그가 있을 경우
            super().save(*args, **kwargs)  # 우선 저장
            self.extract_hashtags()  # 해시태그 추출
            super().save(*args, **kwargs)  # 해시태그가 연결된 후에 다시 저장
        else:  # content에 해시태그가 없을 경우
            self.hashtags = self.hashtags  # 기존의 hashtags 값 유지
            super().save(*args, **kwargs)  # content만 저장

    def extract_hashtags(self):
        # 콘텐츠에서 해시태그 추출
        tags_in_content = re.findall(r'#\w+', self.content)
        self.hashtags = ' '.join(tags_in_content)
        
        # content에서 # 이후 모든 글자를 잘라서 제거
        if tags_in_content:
            first_hashtag_index = self.content.find(tags_in_content[0])
            self.content = self.content[:first_hashtag_index]  # #뒤의 내용은 잘라낸 후 저장
            
# 게시물 사진 ( Post와 1:N 관계 )
class PostImage(models.Model):
    post = models.ForeignKey(Post, on_delete=models.CASCADE, related_name='images')
    image = models.ImageField(upload_to='')
    number = models.PositiveIntegerField(default=1)

    def __str__(self):
        return f"Image {self.number} for {self.post}"

    def save(self, *args, **kwargs):
        # Post가 저장되어 있지 않으면 저장
        if self.post.id is None:
            self.post.save()

        last_number = self.post.images.aggregate(models.Max('number'))['number__max'] or 0

        if not last_number:
            self.number = 1
        else:
            self.number = last_number + 1

        # 기존 이미지 삭제 (변경된 이미지가 있으면)
        if self.pk:  # 기존 객체가 존재하는 경우 (이미 저장된 객체)
            old_image = PostImage.objects.get(pk=self.pk).image
            if old_image and old_image != self.image:
                old_image_path = old_image.path
                if default_storage.exists(old_image_path):
                    default_storage.delete(old_image_path)

        # 파일 경로 및 이름 지정
        self.image.name = self.get_image_path()

        super().save(*args, **kwargs)

    def get_image_path(self):
        ext = os.path.splitext(self.image.name)[1]
        filename = f"{self.post.id}_{self.number}{ext}"
        return os.path.join('post', str(self.post.id), filename)

    

# 하트 데이터
class Heart(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='hearts')
    post = models.ForeignKey(Post, on_delete=models.CASCADE, related_name='hearts')
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        unique_together = ('user', 'post')

    def __str__(self):
        return f"Heart: {self.user.username} -> {self.post.plan.plan_name}"


# 스크랩 데이터
class Scrap(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='scraps')
    post = models.ForeignKey(Post, on_delete=models.CASCADE, related_name='scraps')
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        unique_together = ('user', 'post')

    def __str__(self):
        return f"Scrap: {self.user.username} -> {self.post.plan.plan_name}"


# 댓글
class Comment(models.Model):
    post = models.ForeignKey(Post, on_delete=models.CASCADE, related_name='comments')
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='comments')
    is_reply = models.BooleanField(default=False) # True == 대댓글, False == 댓글
    content = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"Comment by {self.user.username} on {self.post.plan.plan_name}"
