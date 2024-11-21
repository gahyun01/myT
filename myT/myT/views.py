from django.shortcuts import render
from django.contrib.auth import logout
from django.shortcuts import redirect
from django.contrib.auth import login
from django.contrib.auth import authenticate
from django.conf import settings
from django.db.models import Count
from myT.models import *

def index(request):
    return render(request, 'index.html')

def login_view(request):
    if request.method == 'POST':
        username = request.POST['user_id']
        password = request.POST['pwd']
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect('index')  # 로그인 후 이동할 페이지
        else:
            return redirect('login')
    return render(request, 'login.html')


def logout_view(request):
    logout(request)  # 현재 사용자 세션 종료
    return redirect('/')


# 좋아요 수가 많은 10개의 개시물
def TopPosts(request):
    # 좋아요 순으로 상위 10개의 Post 가져오기
    posts = Post.objects.annotate(like_count=Count('hearts')).order_by('-like_count')[:10]

    if not posts:
        print("No posts found.")

    # 각 Post에 첫 번째 이미지를 연결
    top = []
    for index, post in enumerate(posts):
        image_filename_base = f"{post.id}_1"
        post_directory = os.path.join(settings.MEDIA_ROOT, 'post', str(post.id))
        image_url = f"{settings.MEDIA_URL}default_image.png" # 기본 이미지로 설정

        # 디렉토리 내에서 파일을 찾고 확장자를 가져오기
        if os.path.exists(post_directory):
            for filename in os.listdir(post_directory):
                if filename.startswith(image_filename_base):
                    # 파일 확장자 추출
                    file_extension = os.path.splitext(filename)[1]  # 확장자 추출
                    image_url = os.path.join(settings.MEDIA_URL, 'post', str(post.id), image_filename_base + file_extension)
                    break

        hashtags_list = post.hashtags.split()  # 공백 기준으로 문자열을 리스트로 변환
        hashtag1 = hashtags_list[0] if len(hashtags_list) > 0 else None  # 첫 번째 해시태그
        hashtag2 = hashtags_list[1] if len(hashtags_list) > 1 else None  # 두 번째 해시태그

        top.append({
            'position': index + 1,
            'country': post.plan.country,
            'image_url': image_url,
            'plan_name': f"{post.plan.plan_name[:20]}..." if len(post.plan.plan_name) > 20 else post.plan.plan_name,
            'hashtag1': hashtag1 if hashtag1 else None,
            'hashtag2': hashtag2 if hashtag2 else None,
        })

    # 데이터가 비어있는지 확인
    if not top:
        print("No posts found with images.")

    context = {
        'top': top,
    }
    return render(request, 'myT/planner.html', context)
