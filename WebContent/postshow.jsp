<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="myT.PostDB"%>
<jsp:useBean id="pgs" class="myT.PostGetSet"></jsp:useBean>
<jsp:useBean id="pdb" class="myT.PostDB"></jsp:useBean> 
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
  String action = request.getParameter("action");
  if(action != null && action.equals("logout")) {
      // 세션을 비워주고 로그인 페이지로 이동
      session.invalidate(); // 세션 무효화
      response.sendRedirect("login.jsp"); // 로그인 페이지로 리다이렉트
  }
%>
<html>
<head>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="css/banner.css" />
   <link rel="stylesheet" href="css/postshow.css" />
 
   <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.2.4.js"></script>
   <script src="javascript/tdhome.js"></script> <!--file upload-->

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
<%
	String rv_no = request.getParameter("rv_no");
%>
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
		</div>
		<!-- 게시물 -->
			<div class="card">
				<div class="cardbody">				
				<%
				PostDB p = new PostDB();
				
				pgs = p.PostDBselectwhere(rv_no);
//				ArrayList<PostGetSet> a = p.PostDBselect();
//				pgs = a.get(pgs.getRv_no()); ///////////rv_no를 가져오는 거 했다! 이제 리스트에서 잘 넘어오면 된다!

				out.println("<div class='title'>제목: "+pgs.getFest_title()+"</div>");
				out.println("<div class='infomom'><div><div class='userId'>아이디 : "+ pgs.getUser_id() +"</div>");
				out.println("<div class='festTime'>작성시간 : </div></div></div>");
				out.println("<div class='cont'>"+pgs.getFest_rcont()+"</div>");
				
				String writer_id = pgs.getUser_id();
				%>
				</div>	
			</div>
			<div>
				<a href= "postlist.jsp">
					게시판으로
				</a>
			</div>
			<div>
				<a id="delbtn" href="#">
				게시물 삭제
				</a>
			</div>
			
		</div>
	</section>
<script>
$(document).ready(function(){
	$('#delbtn').click(function(){
		var user_id = '<%= user_id%>';
		var writer_id = '<%= pgs.getUser_id()%>';
		if (user_id == writer_id){
			window.location.href = 'postdelete.jsp?rv_no=<%=rv_no%>&user_id=<%=user_id%>';
		} else {
			alert("로그인 아이디와 작성자 아이디가 다릅니다.");
		}
	});
});
</script>
<footer>
  <jsp:include page="footer.jsp" />
</footer>
</body>
</html>
