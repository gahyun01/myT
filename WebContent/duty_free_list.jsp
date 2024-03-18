<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <title>기내면세품</title>
  <style>
    .bg1 {
      width: 1300px;
      margin: 0 auto;
    }

    .duty_list {
      height: 30px;
      margin-top: 15px;
      border:solid 1px grey;
    }

    .list_menu0 {
      float: left;
      width: 150px;
      height: 27px;
      padding-top: 8px;
      text-align: center;
      font-weight: bold;
      border-top-left-radius: 10px;
      border-top-right-radius: 10px;

    }

    /* 가장 첫번째 탭*/
    .list_menu1 {
      background-color: #263e50;
      color: white;
    }

    /* 가장 첫번째 이외의 탭*/
    .list_menu2 {
      margin-left: 1px;
      background-color: #263e50;
      color: white;

    }

    .list_info{
      float: right;
      width: 250px;
      margin-bottom: 10px;
      border:solid 1px red;
   
    }

    #guest {
      width: 990px;
      margin-top: 20px;
    }

    #guest_info {
      width: 990px;
      height: 200px;
      border: solid 1px lightgrey;
    }

    #fixed_pay {
      position: fixed;
      width: 300px;
      height: 410px;
      top: 335px;
      left: 1300px;
      border: solid 1px lightgrey;
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
    <div id="bg">
      <div class="duty_list">
          <div class="list_menu0 list_menu1"><a href="duty_free_list.jsp" class="air_menu">화장품</a></div>
          <div class="list_menu0 list_menu2">향수</div>
          <div class="list_menu0 list_menu2">패션잡화</div>
          <div class="list_menu0 list_menu2">건강식품</div>
          <div class="list_menu0 list_menu2">주류</div>
          <div class="list_info"><span>환율 : \1,325원</span>
              <span style="margin-left: 15px;">
              <!-- iconhunt 사이트에서 아이콘 가져옴 
              <button style="background-color: #ffffff; border: none; cursor: pointer;"><svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 24 24"><g fill="none"><path stroke="#000000" stroke-linecap="round" stroke-width="2" d="M4 4h1.626c.567 0 .85 0 1.076.124a1 1 0 0 1 .25.195c.175.189.244.464.381 1.014l.182.727c.101.404.152.606.23.776a2 2 0 0 0 1.446 1.13C9.375 8 9.583 8 10 8v0"></path><path stroke="#000000" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18 17H7.55c-.145 0-.218 0-.274-.006a1 1 0 0 1-.867-1.203a3.07 3.07 0 0 1 .081-.262v0c.052-.154.077-.231.106-.3a2 2 0 0 1 1.698-1.224C8.368 14 8.45 14 8.611 14H14"></path><path stroke="#000000" stroke-linecap="round" stroke-width="2" d="M14.528 14h-3.554c-1.216 0-1.824 0-2.293-.275a1.999 1.999 0 0 1-.521-.442c-.35-.418-.45-1.018-.649-2.217c-.203-1.215-.304-1.823-.063-2.273a1.5 1.5 0 0 1 .408-.482C8.26 8 8.876 8 10.108 8h6.656c1.45 0 2.175 0 2.469.474c.293.475-.032 1.123-.68 2.42l-.447.895c-.538 1.076-.807 1.614-1.29 1.912c-.484.299-1.085.299-2.288.299Z"></path><circle cx="17" cy="20" r="1" fill="#000000"></circle><circle cx="9" cy="20" r="1" fill="#000000"></circle></g></svg></button>
              -->
              <a href="duty_free_list.html"><img src="img/basket.png" height="27px" style="border: solid 1px red;">장바구니</a></span>
            </div>
         
      </div>

      <div class="bg1">
        <div id="guest">
          <div id="guest_info">승객 정보입력
          </div>

          <div id="guest_info" style="margin-top: 10px">승객 기타정보입력(연락처..)
          </div>
        </div>
      </div>

      <div id="fixed_pay">결제정보</div>

    </div>
  </form>
  <footer>
   <jsp:include page="footer.jsp" />
  </footer>
  
</body>

</html>