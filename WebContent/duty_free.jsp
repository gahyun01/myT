<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <title>기내면세품</title>
  <style>
 
    #best {
      width: 1300px;
      height: 200px;
      margin-top: 30px;
      border: solid 1px gray;
    }

    #duty_menu {
      width: 1300px;
      height: 105px;
      margin: 0 auto;

    }

    .duty_menu0 {
      float: left;
      width: 150px;
      height: 27px;
      margin-top: 295px;
      padding-top: 8px;
      text-align: center;
      font-weight: bold;
      border-top-left-radius: 10px;
      border-top-right-radius: 10px;

    }

    /* 가장 첫번째 탭*/
    .duty_menu1 {
      background-color: #263e50;
      color: white;
    }

    /* 가장 첫번째 이외의 탭*/
    .duty_menu2 {
      margin-left: 1px;
      background-color: #263e50;
      color: white;

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
  <div id="bgtop_duty">
        <div id="duty_menu">
          <div class="duty_menu0 duty_menu1"><a href="duty_free_list.jsp" class="air_menu">화장품</a></div>
          <div class="duty_menu0 duty_menu2">향수</div>
          <div class="duty_menu0 duty_menu2">패션잡화</div>
          <div class="duty_menu0 duty_menu2">건강식품</div>
          <div class="duty_menu0 duty_menu2">주류</div>
        </div>
  </div>

  <div id="bg2">
    <div id="best">베스트상품
    </div>
    <div>
        <div id="tour">고객님을 위한 추천상품
        </div>
    </div>
  </div>
</form>

  <footer>
   <jsp:include page="footer.jsp" />
  </footer>

</body>

</html>