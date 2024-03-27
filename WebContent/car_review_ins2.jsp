<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ page import="java.util.*" %>
<%@ page import="myT.CarReview" %>

<jsp:useBean id="cardb" class="myT.CarReviewDB" />

 <%
	String city_knm = request.getParameter("hidden_city2");
//	String user_id = request.getParameter("hidden_id");
	String car_gbn = request.getParameter("car_gbn2");
	String title = request.getParameter("cont_title");
	String cont = request.getParameter("cont_text");
	
	String user_id = request.getParameter("hidden_id");

	
	out.println("city:" + city_knm);
	out.println("user_id:" + user_id);
	out.println("car_gbn:" + car_gbn);
	out.println("title:" + title);
	out.println("cont:" + cont);

	//	city:서울 user_id:whistl76 car_gbn:5인승 title: text:
	CarReview review = new CarReview();
	
	review.setCityKnm(city_knm);
	
//	int index = car_gbn.indexOf("인승");
//	int capacity = Integer.parseInt(car_gbn.substring(0, index));
	int capacity = Integer.parseInt(car_gbn);
	
	review.setCapacity(capacity);
	review.setTitle(title);
	review.setCont(cont);
	review.setUserId(user_id);
 
	int cnt = cardb.insertRow(review);

    //   차량 후기 페이지로 돌아감
//    response.sendRedirect("car_review_ins.jsp?gbn=" + cnt);
    response.sendRedirect("car_review.jsp?gbn=" + cnt);
%>
