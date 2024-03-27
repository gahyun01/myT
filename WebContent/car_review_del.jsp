<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ page import="java.util.*" %>
<%@ page import="myT.CarReview" %>

<jsp:useBean id="cardb" class="myT.CarReviewDB" />

 <%
	String reNo = request.getParameter("reno");
 
	//	차량 리뷰 삭제
	
 
	//	UserDB의 함수를 사용하기 위해서는 객체를 생성해야 하므로 useBean을 해야 하지만
	//	User class는 객체를 만들 필요는 없으므로 import만 해도 됨
		int cnt = cardb.deleteRow(reNo);
	 	out.println(cnt);

    //   이전 페이지로 돌아감
    //String referer = request.getHeader("Referer");
    //response.sendRedirect(referer);

%>
