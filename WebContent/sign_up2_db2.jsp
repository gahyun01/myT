<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link href="css/default.css" rel="stylesheet" type="text/css">

<style>
.idx_sign_up{
  width: 1300px;
  height: 596px;
  margin-top: 150px;
}
</style>

<html>
<head></head>
<body>
 <!--  상단배너 -->
 <jsp:include page="banner.jsp" />

 <!-- 확인 버튼 누르면 jsp 화면으로 넘어가는 법 -->
 <!--form action="sign_up2_result.jsp" onsubmit="return checkAll()"-->    
 <!-- 확인 버튼 누르면 servlet 화면으로 넘어가는 법 -->
 <!--form action="sign_up2" onsubmit="return checkAll()"-->    
 <form action="sign_up2_db.jsp" onsubmit="return checkAll()">    
  <section>
  <div id="bg">
    <div class="idx_sign_up">
      <div class="idx_top" style="text-align:center; font-size: 20px;">
		<%
			String id = request.getParameter("id");
		  	out.println(id + "님, 회원 가입되셨습니다.<p>");
		%>
  		<br><a href="login.jsp" style="font-weight:bold; color: blue; font-size: 25px; " >로그인 화면으로</a>
      </div><!-- idx_top-->
    </div>
  </div>
  </section>
  

<footer>
  <jsp:include page="footer.jsp" />
</footer>
</body>

</html>

