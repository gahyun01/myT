<%@page import="green.myT.mybatis.SqlMapConfig"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="green.myT.dto.Festival"%>
<%@ page import="green.myT.dto.Diary" %>
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
	   <link rel="stylesheet" href="css/tdiary.css" />
	 
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
		<div class="banner">
			<a href="index.jsp">
				<img src = "img/REAL_myT_logo_transparant.jpg" class="logo"/>
			</a>
			<a href="t_d_home.jsp">
				<img src="img/post.png" class="posticon"/>
			</a>
		</div>
	</header>
<%
	List<Diary> list = (List<Diary>) request.getAttribute("result");
	
	for(int i=0 ; i<list.size() ; i++){
		Diary diary = list.get(i);
%>
	<section>
		<div class="cardpage">
			<div class="cardtitle" style= "background-image: url('<%=diary.getPf_bg() %>');" ></div>
		<!-- 게시물 -->
			<div class="uppercard">
				<div class="prfpicmom">
					<img src="<%=diary.getPf_pic()%>" id="prfpic"/>
					<img src="img/plus_button.png" id="prfplus"/>
					<div class="prfcont"><%=diary.getPf_intr() %></div>
				</div>
				<div class="infobox">
					<div class="namebox">
						<p class="upperln"><%=diary.getUser_id() %></p>
						<p class="beneathln"><%=diary.getPf_nicknm()%></p>
					</div>
<%
	}
%>
					<div class="gapbox1">
					</div>
					<div class="postbox">
						<a href="myt_post.html"><p class="upperln">19</p></a>
						<a href="myt_post.html"><p class="beneathln">게시글</p></a>
					</div>
					<div class="followerbox">
						<p class="upperln">68</p>
						<p class="beneathln">팔로워</p>
					</div>
					<div class="followingbox">
						<p class="upperln">23</p>
						<p class="beneathln">팔로잉</p>
					</div>
					<div class="friendbox">
						<p class="upperln">7</p>
						<p class="beneathln">친한친구</p>
					</div>
				</div>
				<div class="btnmom">
					<a>게시글</a>
					<a>T플래너</a>
					<a>일 &nbsp 기</a>
					<a>내 정보 수정</a>				
				</div>
			</div><!-- uppercard ends -->
			<div class="undercard">
				<%
				// List<Festival> list = (List<Festival>) request.getAttribute("result");
					
				// for(int i=0 ; i < list.size() ; i++){
				//	Festival festv = list.get(i);
//					<a  href="festvdetail.myt?menu=festv&gbn=2&no=i+1">
				%>
						<div class="festvcard">
							<img src="#" class= "title" />
							<div class="ename">db내용</div>
							<div class="name">db내용</div>
							<div class="detail">db내용</div>
						</div>
				<%
	//				</a>
				// }
				%>
			</div>
		</div>
	</section>
	<footer>
		<jsp:include page="footer.jsp" />
	</footer>
</body>

</html>