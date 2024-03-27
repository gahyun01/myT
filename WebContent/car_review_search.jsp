<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<link href="css/car_review.css" rel="stylesheet" type="text/css">

<%@ page import="java.util.*" %>
<%@ page import="myT.CarReview" %>

<jsp:useBean id="cardb" class="myT.CarReviewDB" />

 <%
	 String city = request.getParameter("city");
	 String tmp = request.getParameter("capacity");
	 String id = request.getParameter("id");
	 String text = request.getParameter("text");
	
	 int capacity = Integer.parseInt(tmp);
 
	 //	차량 리뷰 삭제
	
 
	 //	UserDB의 함수를 사용하기 위해서는 객체를 생성해야 하므로 useBean을 해야 하지만
	 //	User class는 객체를 만들 필요는 없으므로 import만 해도 됨
	 ArrayList<CarReview> rvArray = cardb.selectRow(city, capacity, id, text);
	 CarReview review = null;
	//	한번에 25줄만 보여줌
	int list_cnt = 25;
	if(rvArray.size() < list_cnt)
		list_cnt = rvArray.size();
		 
	 out.println("<table border='0' cellspacing='0'>");
	 out.println("<tr><td class='title_air' style='border-top-left-radius: 10px'>번호</td>");
	 out.println("<td class='title_air'>도시</td>");
	 out.println("<td class='title_air'>차량종류</td>");
	 out.println("<td class='title_air' style='width: 663px;'>제목</td>");
	 out.println("<td class='title_air'>작성자</td>");
	 out.println("<td class='title_air'  style='border-top-right-radius: 10px'>작성일</td></tr>");
	 
	//		검색된 내용이 1건도 없을 때
	if(list_cnt == 0){
	 	out.println("<tr><td colspan='6' class='cont_resv' style='padding-left: 140px;'>검색된 내용이 없습니다</td></tr>");
	 }
	
	 out.println("</table>");
//	 out.println(rvArray.size());

//	 for (int i=0; i< rvArray.size(); i++){
	 for (int i=0; i< list_cnt; i++){
	 	review = rvArray.get(i);
	 	out.println("<table class='review_list' border='0' cellspacing='0' id='tbl_" + review.getRvNo() + "\'>");
	 	out.println("<tr><td class='cont_resv'>" + review.getRvNo() + "</td>");
	 	out.println("<td class='cont_resv'>" + review.getCityKnm() + "</td>");
	 	out.println("<td class='cont_resv'>" + review.getCapacity() + "인승</td>");
	 	out.println("<td class='cont_resv' style='width: 685px;'>" + review.getTitle() + "</td>");
	 	out.println("<td class='cont_resv'>" + review.getUserId() + "</td>");
	 	out.println("<td class='cont_resv'>" + review.getRegDate() + "</td></tr>");
	 	out.println("</table>");

	 	out.println("<div class='review' id='review_" + review.getRvNo() + "'>");
	 	out.println("<div class='review_cont' name='review_cont' >" + review.getCont() + "</div>");
	 	out.println("<div class='review_btn' >");
	 	out.println("<input type='button' class='btn_del' value='삭제' onclick=\"deleterow(" + review.getRvNo() + ", \'" + review.getUserId() + " \' )\" >");

		out.println("</div></div>");
	 }
	 
	 //	로그인 상태인지 확인 후 로그인 상태일 경우 글쓰기 버튼 보여줌
	  String user_id = "";
	  String login = (String)session.getAttribute("LOGIN");

	  //  session이 null이면 로그아웃 또는 로그인 전인 상태임
	  if( login != null ){
	    //  로그인 상태인지 확인, x:로그인 실패, 1:로그인 성공
	    if(login.equals("1")){
	      //  배너에 아이디 셋팅 및 로그인 버튼을 로그아웃 버튼으로 변경
	   	 out.println("<div class='bg3' ><button  type='button' class='btn_insert' id='btn_insert' >글쓰기</button></div>");

	    }
	  }
    //   이전 페이지로 돌아감
    //String referer = request.getHeader("Referer");
    //response.sendRedirect(referer);

%>
