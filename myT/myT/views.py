from django.shortcuts import render
from django.contrib.auth import logout
from django.shortcuts import redirect
from django.contrib.auth import login
from django.contrib.auth import authenticate
from django.conf import settings
from django.shortcuts import render
from django.http import JsonResponse
from django.contrib.auth.forms import UserCreationForm
from django.shortcuts import render, redirect

from django.db.models import Count
from django.db.utils import IntegrityError
from myT.models import *
from myT.forms import SignupForm

from datetime import datetime, timedelta
import requests
import os

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


# 회원가입
def signup(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        first_name = request.POST['first_name']
        last_name = request.POST['last_name']
        email = request.POST['email']
        profile_image = request.FILES.get('profile_image')

        # 중복 검사
        if User.objects.filter(username=username).exists():
            return render(request, 'signup.html', {
                'error': '이미 존재하는 사용자 이름입니다. 다른 이름을 선택하세요.'
            })

        try:
            # 사용자 생성
            user = User.objects.create_user(
                username=username,
                password=password,
                email=email,
                first_name=first_name,
                last_name=last_name
            )

            # 프로필 생성 및 이미지 저장
            if profile_image:
                # user_profile_image_path 규칙에 따라 파일명 설정
                Profile(user=user, profile_image=profile_image)
            else:
                Profile(user=user)

            # 로그인
            user = authenticate(username=username, password=password)
            login(request, user)

            return redirect('index')
        
        except IntegrityError:
            return render(request, 'signup.html', {
                'error': '회원가입 중 문제가 발생했습니다. 다시 시도하세요.'
            })

    return render(request, 'signup.html')


# 시간설정
def calculate_base_time(now):
    # 기상청에서 데이터가 제공되는 기준 시간
    valid_times = [2, 5, 8, 11, 14, 17, 20, 23]  # 시간 기준
    hour = now.hour
    
    for valid_time in reversed(valid_times):  # 최신 시간부터 검색
        if hour >= valid_time:
            return now.strftime("%Y%m%d"), f"{valid_time:02d}00"
    
    # 현재 시간이 유효한 기준 시간보다 이른 경우 전날 23시로 설정
    previous_day = now - timedelta(days=1)
    return previous_day.strftime("%Y%m%d"), "2300"

# 날씨 정보 가져오기
def get_weather(request):
    now = datetime.now()
    base_date, base_time = calculate_base_time(now)

    params = {
        "serviceKey": settings.WEATHER_API_KEY,
        "dataType": "JSON",
        "numOfRows": 10,
        "pageNo": 1,
        "base_date": base_date,
        "base_time": base_time,
        "nx": 60,
        "ny": 127,
    }

    endpoint = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst"
    response = requests.get(endpoint, params=params)
    data = response.json()
    
    data = response.json()

    items = data.get("response", {}).get("body", {}).get("items", {}).get("item", [])
    temperature = None
    sky_state = None

    for item in items:
        if item["category"] == "TMP":
            temperature = item["fcstValue"]
        elif item["category"] == "SKY":
            sky_state = item["fcstValue"]

    sky_mapping = {
        "1": "맑음",
        "3": "구름 많음",
        "4": "흐림"
    }
    sky_description = sky_mapping.get(sky_state, "알 수 없음")

    return JsonResponse({
        "temperature": temperature,
        "sky_state": sky_description,
    })

def p(request):
    return render(request, 'myT/p.html')


# 베스트 탑 10 게시물
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
        images = []
        # 디렉토리가 존재하면 이미지 파일을 모두 가져오기
        if os.path.exists(post_directory):
            for filename in os.listdir(post_directory):
                # 확장자 추출
                file_name, file_extension = os.path.splitext(filename)
                
                # 확장자에 따라 파일 처리
                if file_extension.lower() in ['.jpg', '.png', '.jpeg']:  # 이미지 파일만 필터링
                    image = os.path.join(settings.MEDIA_URL, 'post', str(post.id), filename)
                    image = image.replace("\\", "/")  # 역슬래시를 슬래시로 변경
                    images.append(image)

        # 이미지가 하나도 없을 경우 디폴트 이미지 추가
        if not images:
            images.append(f"{settings.MEDIA_URL}default_image.png")

        # 유저 프로필 가져오기
        user_profile_base = f"{post.user.id}"
        user_profile_directory = os.path.join(settings.MEDIA_ROOT, 'profile')
        profile = f"{settings.MEDIA_URL}default_profile.jpeg"

        for filename in os.listdir(user_profile_directory):
            if filename.startswith(user_profile_base):
                file_extension = os.path.splitext(filename)[1]  # 확장자 추출
                profile = os.path.join(settings.MEDIA_URL, 'profile', user_profile_base + file_extension)
                profile = profile.replace("\\", "/")  # 역슬래시를 슬래시로 변경
                break
        
        # 하트, 스크립트 개수 가져오기
        hart = Heart.objects.filter(post=post).count()
        script = Scrap.objects.filter(post=post).count()
        comment = Comment.objects.filter(post=post).count()

        top.append({
            'position': index + 1,
            'country': post.plan.country,
            'image_url': image_url,
            'plan_name': f"{post.plan.plan_name[:20]}..." if len(post.plan.plan_name) > 20 else post.plan.plan_name,
            'hashtag1': hashtag1 if hashtag1 else None,
            'hashtag2': hashtag2 if hashtag2 else None,
            'user_name': post.user.username,
            'profile': profile,
            'images': images,
            'content': post.content,
            'hashtags': post.hashtags,
            'hart': hart,
            'script': script,
            'comment': comment,
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