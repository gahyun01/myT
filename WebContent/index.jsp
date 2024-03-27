<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>

<html>

<head>
  <meta charset="utf-8">
  <title>myT</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link href="css/default.css" rel="stylesheet" type="text/css">

<body>
 <!--  상단배너 -->
 <jsp:include page="banner.jsp" />

  <section>
  <div id="bg">
    <div class="idx">
      <div class="idx_top">
        <div class="idx1">
          <div id="idx1_1">내가 만들어가는<br>나만의 여행 플래너</div>
          <div id="idx1_2">나만의 여행친구, 친구와의 여행을 기록하고 스케쥴링 해봐요.</div>
          <div id="idx1_3"><input type="button" id="myt_btn" value="마이티 시작하기" onclick="location.href='t_planner.jsp'"/></div>
        </div>
        <div class="idx2"></div>
      </div><!-- idx_top-->
      <div class="idx_bttm"><div id="idx_info">
        <div id="idx_info1">myT 여행자들이 만든 일정 수</div><div id="idx_info_cnt">5,324</div>
        <div id="idx_info1">여행지 수</div><div id="idx_info_cnt">96</div></div>
      </div>
    </div>
    
  <!-- img src="img/main2.png" width="1300px" />
  <img src="img/main3.png" width="1300px" />
  <img src="img/main4.png" width="1300px" />
  <img src="img/main5.png" width="1300px" /-->
  </div>
  </section>

<footer>
  <jsp:include page="footer.jsp" />
</footer>
</body>

</html>