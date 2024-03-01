<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>

<head>
  <meta charset="utf-8">
  <title>myT</title>
  <link rel="stylesheet" href="css/banner.css">
  <link rel="stylesheet" href="css/login.css">
  <link rel="stylesheet" href="css/footer.css">

  <!-- 기본 -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
  
  <!-- 날씨 -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Anta&display=swap" rel="stylesheet">


  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
  <script src="javascript/banner.js"></script>
  <script src="javascript/login.js"></script>

  <style>
    .login {
      text-align: center;

    }
  </style>
</head>

<body>
  <form action="logcookie.jsp" onsubmit="return AllCheck()" method="get">
    <!-- 상단 -->
    <div class="top">
      <header>
        <!-- 로고 -->
        <a class="logo" href="index.html">
          <img src="img/logo.png" alt="myT" height="35px">
        </a>
        <!-- 검색창 -->
        <div class="search-container">
          <button class="search-button"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
              viewBox="0 0 1664 1664">
              <path fill="#000000"
                d="M1152 704q0-185-131.5-316.5T704 256T387.5 387.5T256 704t131.5 316.5T704 1152t316.5-131.5T1152 704m512 832q0 52-38 90t-90 38q-54 0-90-38l-343-342q-179 124-399 124q-143 0-273.5-55.5t-225-150t-150-225T0 704t55.5-273.5t150-225t225-150T704 0t273.5 55.5t225 150t150 225T1408 704q0 220-124 399l343 343q37 37 37 90">
              </path>
            </svg>
          </button>
          <input type="text" class="search-box">
        </div>
        <!-- banner -->
        <ul class="banner">
          <!-- T플래너 -->
          <li class="btop">
            <a href="t_planner.html">T플래너</a>
            <ul class="sub">
              <a href="t_planner.html">
                <li>
                  <img src="img/diary.png" width="20px" height="20px">
                  <p >myT플래너</p>
                </li>
              </a>
              <a href="t_planner.html">
                <li>
                  <img src="img/list.png" width="20px" height="20px">
                  <p>T플래너</p>
                </li>
              </a>
              
            </ul>
          </li>
        <!-- T다이어리 -->
          <li class="btop">
            <a href="t_diary.html">T다이어리</a>
            <ul class="sub">
              <a href="t_diary.html">
                <li>
                  <img src="img/diary.png" width="20px" height="20px">
                  <p>myT다이어리</p>
                </li>
              </a>
              <a  href="t_d_home.html">
                <li>
                  <img src="img/list.png" width="20px" height="20px">
                  <p>T다이어리</p>
                </li>
              </a>
            </ul>
          </li> 
        <!-- 여행정보 -->
          <li class="btop">
            <a href="t_info.html">여행정보</a>
            <ul class="sub">
              <a href="t_info.html">
                <li>
                  <img src="img/mountain.png" width="20px" height="20px">
                  <p>관광지</p>
                </li>
              </a>
              <a  href="festv.html">
                <li>
                  <img src="img/festival.png" width="20px" height="20px">
                  <p>축제</p>
                </li>
              </a>
              <a href="rest.html">
                <li>
                  <img src="img/restaurant.png" width="20px" height="20px">
                  <p>레스토랑</p>
                </li>
              </a>
              <a  href="hotel.html">
                <li>
                  <img src="img/hotel.png" width="20px" height="20px">
                  <p>호텔</p>
                </li>
              </a>
            </ul>
          </li>
        <!-- 예약 -->
          <li class="btop">
            <a href="air_resv.html">예약</a>
            <ul class="sub">
              <a href="hotel_resv.html">
                <li>
                  <img src="img/hotel.png" width="20px" height="20px">
                  <p>호텔</p>
                </li>
              </a>
              <a href="air_resv.html">
                <li>
                  <img src="img/airplane.png" width="20px" height="20px">
                  <p>항공권</p>
                </li>
              </a>
              <a  href="car_resv.html">
                <li>
                  <img src="img/car.png" width="20px" height="20px">
                  <p>차량</p>
                </li>
              </a>
            </ul>
          </li>
        </ul> 
        <!-- 날씨 -->
        <div class="weather">
          <img src="img/weather_sunny.svg" width="30px" height="30px">
          <p>24℃</p>
        </div>
        <!-- 로그인 -->
        <a href="login.html">
          <p class="login">로그인</p>
        </a>
      </header>
    </div>
    <div class="bnav">/</div>

    <div class="lpage">
      <!-- 로그인, 회원가입 버튼 -->
      <div class="title">
        <a href="login.html" class="login">
          <p>
            로그인
          </p>
        </a>
        <a href="sign_up2.html" class="sign">
          <p>
            회원가입
          </p>
        </a>
      </div>
      <div class="main">
        <div class="position">
          <!-- 아이디, 비밀번호 -->
          <div class="id">
            <img src="img/lperson.png" width="30px" height="30px" />
            <input type="text" name="user_id" placeholder="아이디" />
          </div>
          <div class="pwd">
            <img src="img/loglock.png" width="30px" height="30px" />
            <input type="password" name="pwd" placeholder="비밀번호" />
          </div>
          <!-- 아이디 저장하기, 로그인 상태 유지 -->
          <div class="check">
            <div class="idcheck" name="idcheck">
              <img src="img/logcheck.png" width="18px" height="18px"/>
              <p>아이디 저장하기</p>
            </div><div class="logcheck">
              <img src="img/logcheck.png" width="18px" height="18px"/>
              <p>로그인 상태 유지</p>
            </div>
          </div>
          <p class="error">아이디 또는 비밀번호를 잘못 입력했습니다.</p>
          <input type="submit" value="로그인" class="loginbtn"/>
        </div>
      </div>
      <!-- 아이디/비밀번호 찾기 -->
      <p class="find">아이디/비밀번호 찾기</p>
    </div>
  </form>

  <footer>
    <div class="footer">
    <div class="footer_box1">
      <p>주식회사 마이티 | 대표 정가현</p>
      <p>사업자등록번호 649-88-37824</p>
      <p>서울특별시 강남구 강남대로 428 10F</p>
    </div>
    <div class="footer_box1">
      <p>대표번호 | 1588 - 1111</p>
      <p>contact@myt.co.kr</p>
      <p class="support"> 이용약관 | 개인정보처리방침 | 고객지원 | 1:1문의</p></div>
    <div class="footer_box2">
    <div><ul><li><img src="img/banner-appstore.png"  width="100px"></li><li><img src="img/banner-googleplay.png" width="100px"></li></ul></div>
    <div><img src="img/banner2.png"  height="30px"></div>
    </div>
    </div>
  </footer>
</body>
</html>