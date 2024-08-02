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
	   <link rel="stylesheet" href="css/postlist.css" />
	 
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
		<div class="imgmom">
			<img src="img/mysteryland.jpg" />
		</div>
		<div class="cardpage">
			<div class="titlemom" >
				<div class="cardtitle">
					<div>축제 후기 게시판</div>
					<div>행복하고 다양한 추억, 소소한 이야기를 나누세요.</div>
				</div>
				<form action="postsearch.jsp" class="searchbox">
					<select name="searchselect" class="searchselect">
						<option value="fest_rtitle">제목</option>
						<option value="user_id">작성자</option>
						<option value="fest_rtime">작성일시</option>
					</select>
					<input type="text" name="searchcont" class="search"/>
					<input type="submit" name="submit" value="찾기" class="submit" />
				</form>
			</div>
		<!-- 게시물 -->
			<div class="card">
				<%
				PostDB p = new PostDB();
				ArrayList<PostGetSet> a = p.PostDBselect(); // arrayList만들어서 리턴값 받아오기.
				PostGetSet pgs = null;
				// out.print(pgs.getFest_rtime());
				
				out.println("<table border='0'><tr><td class='td'><div class='rvNo'>글번호</div></td>");
				out.println("<td class='td'><div class='htitle'>제목</div></td>");
				out.println("<td class='td'><div class='huserId'>작성자</div></td>");
				out.println("<td class='td'><div class='hfestrTime'>작성일시</div></td></tr>");
//				out.println("<td class='td'><div class='festCnt'>조회수</div></td>");
//				out.println("<td class='td'><div class='festRstars'>별점</div></td></tr>");

//				out.println(pgs.getFest_rtime());
//				String rtime = pgs.getFest_rtime();
//				String rrtime = rtime.substring(0, 10);
				
				for(int i=0 ; i < a.size() ; i++){
					pgs=a.get(i);
				%>
					<tr><td class='td'><div class='rvNo'><%= pgs.getRv_no()%></div></td>
					<td class='td'><a href ="postshow.jsp?rv_no=<%= pgs.getRv_no()%>"><div><%= pgs.getFest_title()%></div></a></td>
					<td class='td'><div class='userId'><%= pgs.getUser_id() %></div></td>
					<td class='td'><div class='festTime'><%=pgs.getFest_rtime().substring(0,10)%></div></td></tr>
				<%
				}
				%>				
				</table>
			</div>
			<div class="writemom">
				<div class="write">
					<a href="postwrite.jsp" onclick=function()>
					글쓰기
					</a>
				</div>
			</div>
		</div>
	</section>
	<footer>
		<jsp:include page="footer.jsp" />
	</footer>
</body>
</html>