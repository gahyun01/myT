<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>  
<%@ page import="java.util.*"%>
<%@ page import="myT.PostGetSet"%>
<%@ page import="myT.PostDB"%>
<%
  //	로그인한 user_id를 hidden_id에 셋팅하기 위한 작업
  String user_id = "";

  String login = (String)session.getAttribute("LOGIN");

  //  session이 null이면 로그아웃 또는 로그인 전인 상태임
  if( login != null ){
    //  로그인 상태인지 확인, x:로그인 실패, 1:로그인 성공
    if(login.equals("1")){
      //  배너에 아이디 셋팅 및 로그인 버튼을 로그아웃 버튼으로 변경
      user_id = (String)session.getAttribute("ID");
    }
  }
%>
<html>
<head>
   <meta charset="utf-8"/>
   <meta name="viewport" content="width=device-width, initial-scale=1"/>
   <link rel="stylesheet" href="css/banner.css" />
   <link rel="stylesheet" href="css/postwrite.css" />
 
   <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.2.4.js"></script>
   <script src="javascript/tdhome.js"></script> <!--file upload-->

   <!-- 기본 글씨체 -->
   <link rel="preconnect" href="https://fonts.googleapis.com"/>
   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
   <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet"/>
   
  <!-- 날씨 -->
  <link rel="preconnect" href="https://fonts.googleapis.com"/>
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
  <link href="https://fonts.googleapis.com/css2?family=Anta&display=swap" rel="stylesheet"/>

   <title></title>
</head>
<body>
	<header>
	</header>
 <jsp:include page="banner.jsp" />
	<section>
		<div class="cardpage">
		<div class="titlemom">
			<div class="posttitle">
				후기 게시판
			</div>
			<div>
				<a href="postlist.jsp">
					게시판으로
				</a>
			</div>
		</div>
			<!-- 게시물 -->
			<div class="card">
				<form action="postGetSetinput.jsp" method="get">
					<input type="text" name="fest_title" class="fest_title" placeholder="제목을 입력하세요"/>	
					<div class="infomom">
					</div>
					<textarea name="fest_rcont" class="fest_rcont" placeholder="내용을 입력하세요"></textarea>
					<input type="hidden" class=user_id name="user_id" value=<%=user_id %> />
					
					<input type="submit" class="submit" value="등록"/>
				</form>	
			</div>
		</div>
	</section>
<footer>
  <jsp:include page="footer.jsp" />
</footer>
</body>
</html>
