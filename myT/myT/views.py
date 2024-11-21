from django.shortcuts import render
from django.contrib.auth import logout
from django.shortcuts import redirect
from django.contrib.auth import login
from django.contrib.auth import authenticate
from django.conf import settings
from django.shortcuts import render

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


# 날씨 정보 가져오기



# 좋아요 수가 많은 10개의 개시물
def Planner(request):
    # 좋아요 순으로 상위 10개의 Post 가져오기
    posts = Post.objects.annotate(like_count=Count('hearts')).order_by('-like_count')[:10]

    if not posts:
        print("No posts found.")

    # 각 Post에 첫 번째 이미지를 연결
    top = []
    for index, post in enumerate(posts):
        """ 카드 """
        image_filename_base = f"{post.id}_1"
        post_directory = os.path.join(settings.MEDIA_ROOT, 'post', str(post.id))
        image_url = f"{settings.MEDIA_URL}default_image.png" # 기본 이미지로 설정

        # 디렉토리 내에서 파일을 찾고 확장자를 가져오기
        if os.path.exists(post_directory):
            for filename in os.listdir(post_directory):
                if filename.startswith(image_filename_base):
                    file_extension = os.path.splitext(filename)[1]  # 확장자 추출
                    image_url = os.path.join(settings.MEDIA_URL, 'post', str(post.id), image_filename_base + file_extension)
                    break

        hashtags_list = post.hashtags.split()  # 공백 기준으로 문자열을 리스트로 변환
        hashtag1 = hashtags_list[0] if len(hashtags_list) > 0 else None  # 첫 번째 해시태그
        hashtag2 = hashtags_list[1] if len(hashtags_list) > 1 else None  # 두 번째 해시태그


        """ 게시물 """
        # 게시물 이미지 전체 가져오기
        image_urls = []
        # 디렉토리가 존재하면 이미지 파일을 모두 가져오기
        if os.path.exists(post_directory):
            for filename in os.listdir(post_directory):
                file_extension = os.path.splitext(filename)[1]  # 확장자 추출
                image_url = os.path.join(settings.MEDIA_URL, 'post', str(post.id), image_filename_base + file_extension)
                image_url = image_url.replace("\\", "/")  # 역슬래시를 슬래시로 변경
                image_urls.append(image_url)

        # 이미지가 하나도 없을 경우 디폴트 이미지 추가
        if not image_urls:
            image_urls.append(f"{settings.MEDIA_URL}default_image.png")

        # 유저 프로필 이미지 가져오기
        user_profile_base = f"{post.user.id}"
        user_profile_directory = os.path.join(settings.MEDIA_ROOT, 'profile', str(post.user.id))
        user_profile_url = f"{settings.MEDIA_URL}default_profile.png"

        if os.path.exists(user_profile_directory):
            for filename in os.listdir(user_profile_directory):
                if filename.startswith(user_profile_base):
                    file_extension = os.path.splitext(filename)[1]  # 확장자 추출
                    user_profile_url = os.path.join(settings.MEDIA_URL, 'profile', str(post.user.id), user_profile_base + file_extension)
                    user_profile_url = user_profile_url.replace("\\", "/")  # 역슬래시를 슬래시로 변경
                    break

        top.append({
            'position': index + 1,
            'country': post.plan.country,
            'image_url': image_url,
            'plan_name': f"{post.plan.plan_name[:20]}..." if len(post.plan.plan_name) > 20 else post.plan.plan_name,
            'hashtag1': hashtag1 if hashtag1 else None,
            'hashtag2': hashtag2 if hashtag2 else None,
            # 'user_name': post.user.first_name + post.user.last_name,
            # 'user_profile': user_profile_url,
            # 'images': image_urls,
            # 'content': post.content,
            # 'hashtags': post.hashtags,
        })

    # 데이터가 비어있는지 확인
    if not top:
        print("No posts found with images.")


    """ 모든 게시물 가져오기 """
    post = Post.objects.all()

    if not post:
        print("No posts found.")

    all = []
    for i in post:
        # 유저 프로필 가져오기
        user_profile_base = f"{i.user.id}"
        user_profile_directory = os.path.join(settings.MEDIA_ROOT, 'profile')
        profile = f"{settings.MEDIA_URL}default_profile.jpeg"

        for filename in os.listdir(user_profile_directory):
            if filename.startswith(user_profile_base):
                file_extension = os.path.splitext(filename)[1]  # 확장자 추출
                profile = os.path.join(settings.MEDIA_URL, 'profile', user_profile_base + file_extension)
                profile = profile.replace("\\", "/")  # 역슬래시를 슬래시로 변경
                break

        # 게시물 이미지 가져오기
        image_filename_base = f"{i.id}_1"
        post_directory = os.path.join(settings.MEDIA_ROOT, 'post', str(i.id))
        image = f"{settings.MEDIA_URL}default_image.png" # 기본 이미지로 설정

        # 디렉토리 내에서 파일을 찾고 확장자를 가져오기
        if os.path.exists(post_directory):
            for filename in os.listdir(post_directory):
                if filename.startswith(image_filename_base):
                    file_extension = os.path.splitext(filename)[1]  # 확장자 추출
                    image = os.path.join(settings.MEDIA_URL, 'post', str(i.id), image_filename_base + file_extension)
                    break

        # 하트, 스크립트 개수 가져오기
        hart = Heart.objects.filter(post=i).count()
        script = Scrap.objects.filter(post=i).count()
        all.append({
            'profile': profile,
            'user': i.user.username,
            'plan_name': i.plan.plan_name,
            'image': image,
            'content': i.content,
            'hashtags': i.hashtags,
            'hart': hart,
            'script': script,
        })

    context = {
        'top': top,
        'all': all,
    }
    return render(request, 'myT/planner.html', context)