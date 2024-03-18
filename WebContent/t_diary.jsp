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
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/tdiary.css"/>
	<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.2.4.js"></script>
	<script src="javascript/tdiary.js"></script>
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
	<div class="bgpic">
		<img src="img/tripledots.png" class="bgdots"/>
	</div>
	<section>
		<div class="prfpicmom">
			<img src="img/dprofile.png" id="prfpic"/>
			<img src="img/plus_button.png" id="prfplus"/>
			<div class="prfcont">상태메시지</div>
		</div>
		<div class="infbx">
			<div class="namebx">
				<p class="upperline">역행자</p>
				<p><%= user_id %></p>
			</div>
			<div class="postbx">
				<a href="myt_post.html"><p class="upperln">19</p></a>
				<a href="myt_post.html"><p class="beneathln">게시글</p></a>
			</div>
			<div class="followerbx">
				<p class="upperln">68</p>
				<p class="beneathln">팔로워</p>
			</div>
			<div class="followingbx">
				<p class="upperln">23</p>
				<p class="beneathln">팔로잉</p>
			</div>
			<div class="friendbx">
				<p class="upperln">7</p>
				<p class="beneathln">친한친구</p>
			</div>
		</div>
		<div class="artcbtn">내 정보 수정</div>
		<div>
			<div class="artcbtn" id="btnclk">게시글</div>
			<div class="artcbtn">T플래너</div>
			<div class="artcbtn">일 &nbsp 기</div>
		</div>

		<article>
		<div class="artc">
			<div>
				<img class="artcpic" src="img/hotelpic.jfif"/>
				<img class="artcpic" src="img/hotelpic.jfif"/>
				<img class="artcpic" src="img/hotelpic.jfif"/>
				<img class="artcpic" src="img/hotelpic.jfif"/>
			</div>
		</div>
	</article>
	</section>

	<div class="changeimg">
		<div class="title">
			<p>사진을 선택해 주세요.</p>
			<img src="img/close.png"/>
		</div>	
		<div class="mdfimg">
			<img src="img/pizza.jpg"/>
			<img src="#" id="circleimg" />
		</div>
		<input type="file" value="files">
		<div class="carryimg">
			<img src="img/pizza.jpg"/>
			<img src="img/Doong.jpg"/>
			<img src="img/china.jpg"/>
			<img src="img/chinac.jpg"/>
			<img src="img/cheese.jpg"/>
		</div>
	</div>


	<footer>
  	<jsp:include page="footer.jsp" />
	</footer>

</body>
</html>