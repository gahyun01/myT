from django.shortcuts import render
from django.contrib.auth import logout
from django.shortcuts import redirect
from django.contrib.auth import login
from django.contrib.auth import authenticate
from django.contrib import messages

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

def planner(request):
    return render(request, 'myT/planner.html')