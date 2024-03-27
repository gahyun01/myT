<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="myT.PostGetSet"%>
<%@ page import="myT.PostDB"%>

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
<html>
<head>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="css/banner.css" />
   <link rel="stylesheet" href="css/tdpost.css" />
 
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

<body>
	<header>
	</header>
	<!--  상단배너 -->
 <jsp:include page="banner.jsp" />
	 <section>
		<div class="cardpage">
			<div class='cardtitle'>후기 게시판</div>
		<!-- 게시물 -->
			<div class="card">
				<%
				PostDB p = new PostDB();
				ArrayList<PostGetSet> a = p.PostDBselect(); // arrayList만들어서 리턴값 받아오기.
				PostGetSet pgs = null;
				
				out.println("<table border='0'><tr><td class='td'><div class='rvNo'>글번호</div></td>");
				out.println("<td class='td'><div class='htitle'>제목</div></td>");
				out.println("<td class='td'><div class='huserId'>작성자</div></td>");
				out.println("<td class='td'><div class='hfestTime'>작성일시</div></td></tr>");
//				out.println("<td class='td'><div class='festCnt'>조회수</div></td>");
//				out.println("<td class='td'><div class='festRstars'>별점</div></td></tr>");
				
				for(int i=0 ; i < a.size() ; i++){
					pgs = a.get(i); // 만든 arrayList에서 값 뽑아오기. dao클래스의 객체기 때문에 그럴 능력이 있음.
					
					//String festRtimeLong = pgs.getFest_rtime();
					//String festRtime = festRtimeLong.substring(0, 10);
				%>
					<tr><td class='td'><div class='rvNo'><%= pgs.getRv_no()%></div></td>
					<td class='td'><a href ="postshow.jsp?rv_no=<%= pgs.getRv_no() %>"><div class='title'><%=pgs.getFest_title()%></div></a></td>
					<td class='td'><div class='userId'><%=pgs.getUser_id() %></div></td>
					<td class='td'><div class='festTime'><%= pgs.getFest_rtime().substring(0,10) %></div></td>
					<!-- td class='td'><div class='festCnt'>count</div></td>
					<td class='td'><div class='festRstars'>stars</div></td --></tr>	
				<%}%>				
				</table>
			</div>
			<div class="write">
				<a href="postwrite.jsp">
					글쓰기
				</a>
			</div>
		</div>
	</section>
<footer>
  <jsp:include page="footer.jsp" />
</footer>
</body>
</html>