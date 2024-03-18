<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <title>차량 예약</title>
  <style>
  
   .title_car {
      height: 35px;
      color: white;
      text-align: center;
      padding-left: 18px;
      padding-right: 18px;
      background-color: #dc8b35;
      font-weight: bold;
    }

    .cont {
      height: 35px;
      text-align: center;
      padding-left: 21px;
      padding-right: 21px;
      background-color: #FFECCC;
    }

    .cont1 {
      padding-left: 1px;
      padding-right: 0px;
    }


   #car {
      width: 1300px;
      height: 200px;
      margin-top: 30px;
      border: solid 1px gray;
    }
 
  </style>

</head>

<!-- 구s글폰트 다운 받아서 적용함 
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Nanum+Gothic&display=swap" rel="stylesheet">
-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link href="css/default.css" rel="stylesheet" type="text/css">

<body>
 <!--  상단배너 -->
 <jsp:include page="banner.jsp" />
 
 <form>
  <!-- 기본 바탕 하늘 이미지 -->
  <div id="bgtop_car">
    <div id="choice">
      <div class="choice0">차량 예약</div>

    </div>
    <div id="search">
    </div>
  </div>

  <div id="bg2">
    <div>
      <table border="0" cellspacing="0">
          <tr>
            <td class="title_car" style="border-top-left-radius: 10px">차량 예약번호</td>
            <td class="title_car">차량종류</td>
            <td class="title_car">운행도시</td>
            <td class="title_car">상세주소</td>
            <td class="title_car">예약일자</td>
            <td class="title_car">출발시간</td>
            <td class="title_car">종료시간</td>
            <td class="title_car">사용시간</td>
            <td class="title_car">예약자명</td>
            <td class="title_car">금액</td>
            <td class="title_car">결제일자</td>
            <td class="title_car" style="border-top-right-radius: 10px">취소</td>
          </tr>
          <tr>
            <td class="cont">2024011500000000000</td>
            <td class="cont">4인승</td>
            <td class="cont">서울</td>
            <td class="cont">남산 힐튼호텔</td>
            <td class="cont">02월07일(수)</td>
            <td class="cont">09:00</td>
            <td class="cont">12:00</td>
            <td class="cont">3시간</td>
            <td class="cont">홍길동</td>
            <td class="cont">8,000</td>
            <td class="cont">01월15일</td>
            <td class="cont"><input type="checkbox" name=“cancel” value="1"></td>
          </tr>
      </table><br><br>
    </div>
    <div id="car">차량 예약(선택)부분
    </div>
    <div>
        <div id="tour">추천관광지 리스트
        </div>
    </div>
  </div>
</form>

  <footer>
   <jsp:include page="footer.jsp" />
  </footer>

</body>

</html>