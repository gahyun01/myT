from django.db import models
from django.contrib.auth.models import User
import os
import re


# 여행 계획
class Plan(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='plans')
    plan_name = models.CharField(max_length=30)
    
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
    plan = models.OneToOneField(Plan, on_delete=models.CASCADE, related_name='post')  # Plan과 1:1 관계
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='posts')
    content = models.TextField()  # 게시물 내용
    created_at = models.DateTimeField(auto_now_add=True)  # 작성 시간
    updated_at = models.DateTimeField(auto_now=True)  # 수정 시간
    hashtags = models.ManyToManyField('Hashtag', related_name='posts', blank=True)  # 해시태그 추가

    def __str__(self):
        return f"Post for {self.plan.plan_name} by {self.user.username}"

    def save(self, *args, **kwargs):
        super().save(*args, **kwargs)
        self.extract_hashtags()

    def extract_hashtags(self):
        # 콘텐츠에서 해시태그 추출
        tags_in_content = re.findall(r'#\w+', self.content)
        for tag_name in tags_in_content:
            hashtag, created = Hashtag.objects.get_or_create(name=tag_name)
            self.hashtags.add(hashtag)

# 해시태그
class Hashtag(models.Model):
    name = models.CharField(max_length=100, unique=True)  # 해시태그 이름

    def __str__(self):
        return self.name

def post_image_upload_to(instance, filename):
    # 이전 마이그레이션을 위해 빈 함수로 남겨둠
    pass

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

        # number가 지정되어 있지 않으면 자동 부여
        if not self.number:
            last_number = self.post.images.aggregate(models.Max('number'))['number__max'] or 0
            self.number = last_number + 1

        # 파일 경로 및 이름 지정
        self.image.name = self.get_image_path()

        super().save(*args, **kwargs)

    def get_image_path(self):
        ext = os.path.splitext(self.image.name)[1]
        filename = f"{self.post.id}_{self.number}{ext}"
        return os.path.join('post_images', str(self.post.id), filename)
    

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
