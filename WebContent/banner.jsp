<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%
  String user_id = "";
  String btn_log = "로그인";

  String login = (String)session.getAttribute("LOGIN");

  //  session이 null이면 로그아웃 또는 로그인 전인 상태임
  if( login != null ){
    //  로그인 상태인지 확인, x:로그인 실패, 1:로그인 성공
    if(login.equals("1")){
      //  배너에 아이디 셋팅 및 로그인 버튼을 로그아웃 버튼으로 변경
      user_id = (String)session.getAttribute("ID") + "님";
      btn_log = "로그아웃";
    }
  }

%>

<head>
  <meta charset="utf-8">
  <link rel="stylesheet" href="css/banner.css" />
  <link href="css/ring_bell.css" rel="stylesheet" type="text/css">
  
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

 
  <!-- 달력추가 : body에서 쓰는 달력을 banner.jsp에 넣지 않으면 예상치 않는 오류 발생으로 정상실행이 안됨-->
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
  <script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>

</head>

  <form>
  <!-- 상단 -->
  <div class="top">
    <header>
      <!-- 로고 -->
      <a class="logo" href="index.jsp">
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
          <a href="t_planner.jsp">T플래너</a>
          <ul class="sub">
            <a href="t_planner.jsp">
              <li>
                <img src="img/diary.png" width="20px" height="20px">
                <p >myT플래너</p>
              </li>
            </a>
            <a href="t_planner.jsp">
              <li>
                <img src="img/list.png" width="20px" height="20px">
                <p>T플래너</p>
              </li>
            </a>
            
          </ul>
        </li>
      <!-- T다이어리 -->
        <li class="btop">
          <a href="t_diary.diary?user_id=<%=(String)session.getAttribute("ID")%>">T다이어리</a>
          <ul class="sub">
            <a href="t_diary.diary?user_id=<%=(String)session.getAttribute("ID")%>">
              <li>
                <img src="img/diary.png" width="20px" height="20px">
                <p>myT다이어리</p>
              </li>
            </a>
            <a  href="t_d_home.jsp">
              <li>
                <img src="img/list.png" width="20px" height="20px">
                <p>T다이어리</p>
              </li>
            </a>
          </ul>
        </li> 
      <!-- 여행정보 -->
        <li class="btop">
          <a href="festvlist.myt?menu=festv&gbn=1&no=0">여행정보</a>
          <ul class="sub">
            <a href="postlist.jsp">
              <li>
                <img src="img/mountain.png" width="20px" height="20px">
                <p>관광지</p>
              </li>
            </a>
            <a  href="festvlist.myt?menu=festv&gbn=1&no=0">
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
          <a href="air_resv.jsp">예약</a>
          <ul class="sub">
            <a href="hotel_resv.html">
              <li>
                <img src="img/hotel.png" width="20px" height="20px">
                <p>호텔</p>
              </li>
            </a>
            <a href="air_resv.jsp">
              <li>
                <img src="img/airplane.png" width="20px" height="20px">
                <p>항공권</p>
              </li>
            </a>
            <a  href="car_pickup.jsp">
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
        <!--img src="img/weather_sunny.svg" width="30px" height="30px"-->
        <img src="img/car_ring.png" width="33px" height="33px" id='ring_img' >
        <p style="font-size: 15px" id='login_id' ><%= user_id %></p>
      </div>
      <!-- 로그인 -->
      <a href="login.jsp">
        <p class="login"><%= btn_log %></p>
      </a>
    </header>
  </div>
  <div class="bnav">/</div>

  <!--  mhwon 추가 -->
  <!-- div_ring : ring-bell 이미지 클릭하면 뜨는 픽업 신청 리스트 화면 -->
  <div id="div_ring" >
  <!-- 공항픽업 신청 내역 리스트 조회됨 -->
  </div> <!-- div_ring  end : 검색창(search)에서 도시를 선택하면 나타나는 data 선택창 -->
  
  </form>
