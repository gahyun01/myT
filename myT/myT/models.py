from django.db import models
from django.contrib.auth.models import User
import os


# 여행 계획
class Plan(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='plans')
    plan_name = models.CharField(max_length=30)
    
    def __str__(self):
        return self.plan_name


# 여행 세부 계획 ( Plan과 1:N 관계 )
class PlanDetail(models.Model):
    plan = models.ForeignKey(Plan, on_delete=models.CASCADE, related_name='details')
    date = models.DateField()
    time = models.TimeField()
    location = models.CharField(max_length=255, blank=True, null=True)  # 지도 위치 정보 (예: 주소, 좌표 등)

    def __str__(self):
        return f"{self.plan.plan_name} - {self.date} {self.time}"


# 여행에 대한 게시물
class Post(models.Model):
    plan = models.OneToOneField(Plan, on_delete=models.CASCADE, related_name='post')  # Plan과 1:1 관계
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='posts')
    content = models.TextField()  # 게시물 내용
    created_at = models.DateTimeField(auto_now_add=True)  # 작성 시간
    updated_at = models.DateTimeField(auto_now=True)  # 수정 시간

    def __str__(self):
        return f"Post for {self.plan.plan_name} by {self.user.username}"



# 이미지 저장 경로 및 파일명 지정 함수
def post_image_upload_to(instance, filename):
    # 파일 확장자 추출
    ext = os.path.splitext(filename)[1]

    # 게시물 번호 (Post 모델의 ID)
    post_id = instance.post.id if instance.post else 'unknown'
    
    # 해당 게시물의 현재 이미지 갯수
    count = instance.post.images.count() + 1  # 기존 이미지 수 + 1
    
    # 새 파일 이름
    new_filename = f"{post_id}_{count}{ext}"

    # 저장 경로 (post_images 폴더 안에 저장)
    return f"post_images/{new_filename}"

# 게시물 사진 ( Post와 1:N 관계 )
class PostImage(models.Model):
    post = models.ForeignKey(Post, on_delete=models.CASCADE, related_name='images')
    image = models.ImageField(upload_to=post_image_upload_to)

    def __str__(self):
        return f"Image for {self.post}"
    

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
