<%@page import="green.myT.mybatis.SqlMapConfig"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="green.myT.dto.Festival"%>
<!-- 로그인 없이도 볼 수 있는 페이지 -->
<%
  //	로그인한 user_id를 hidden_id에 셋팅
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
<% request.setCharacterEncoding("utf-8"); %>
<html>
	<head>
	   <meta charset="utf-8">
	   <meta name="viewport" content="width=device-width, initial-scale=1">
	   <link rel="stylesheet" href="css/banner.css" />
	   <link rel="stylesheet" href="css/festvlist.css" />
	 
	   <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.2.4.js"></script>
	   <script src="javascript/festvlist.js"></script> <!--file upload-->
	
	   <!-- 기본 글씨체 -->
	   <link rel="preconnect" href="https://fonts.googleapis.com">
	   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	   <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
	   
	  <!-- 날씨 -->
	  <link rel="preconnect" href="https://fonts.googleapis.com">
	  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	  <link href="https://fonts.googleapis.com/css2?family=Anta&display=swap" rel="stylesheet">
	
	   <title></title>
	</head>
<body>
   
	<header>
	</header>
	<!--  상단배너 -->
	<jsp:include page="banner.jsp" />
	<section>
		<div class="cardpage">
			<div class="cardtitle">
				<div>myT Festival List</div>
				<div>마이티에서 제공하는 세계 각국, 국내 곳곳의 화려한 페스티벌!</div>
				<div>축제 둘러보기, 계획 짜기, 티켓팅까지 마이티에서 한 번에 해결하세요<img id="wink" src="img/wink.png"/></div>
			</div>
			<!-- action에 직접 붙인 파라미터 뒤에 select나 다른 input들은 연결해서 붙는 것이다. 지워지는 게 아니라. 그리고 반드시 post로 보내야 한다. -->
			<form action="festvlist.myt?menu=festv&gbn=1" class="searchbox" method="post">
				<select name="no" class="searchselect">
					<option value="1">축제명</option>
					<option value="2">축제장소</option>
					<option value="3">시작일시</option>
					<option value="4">종료일시</option>
				</select>
				<input type="text" name="searchcont" class="search"/>
				<input type="submit" name="submit" value="검색" class="submit" />
			</form>
		<!-- 게시물 -->
			<div class="card">
				<%
				List<Festival> list = (List<Festival>) request.getAttribute("result");
					
				for(int i=0 ; i < list.size() ; i++){
					Festival festv = list.get(i);
				%>
					<a  href="festvdetail.myt?menu=festv&gbn=2&no=<%=i+1%>">
						<div class="festvcard">
							<img src="<%=festv.getFestv_title()%>" class= "title" />
							<div class="ename"><%=festv.getFestv_ename()%></div>
							<div class="name"><%=festv.getFestv_name()%></div>
							<div class="detail"><%=festv.getFestv_detail() %></div>
						</div>
					</a>
				<%
				}
				%>
			</div>
		</div>
	</section>
	<footer>
		<jsp:include page="footer.jsp" />
	</footer>
</body>

</html>