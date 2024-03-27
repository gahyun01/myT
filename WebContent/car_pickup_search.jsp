<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ page import="java.util.*" %>
<%@ page import="myT.CarInfo" %>

<jsp:useBean id="carInfodb" class="myT.CarInfoDB" />

<%
	String city = request.getParameter("city");
//	out.println("city : " + city );


	ArrayList<CarInfo> rvArray = carInfodb.selectRow(city);
	CarInfo info = null;
	
	//	조회된 내역이 없을 때
	if(rvArray.size() == 0){
	 	out.println("<div class='div_blank'>검색된 내용이 없습니다</div>");
	}
	
	for (int i=0; i< rvArray.size(); i++){
		info = rvArray.get(i);
		int capacity = info.getCapacity();
	
		int amount = info.getPrice() * 2;
	
		if(capacity == 12)
			out.println("<div class='car_info' >");
		else
			out.println("<div class='car_info' style='margin-right: 23px;'>");
		
		out.println("<div class='car_title'>" + capacity + "인승 차량</div>");
		out.println("<div class='car_picture'><img src='img/car_" + capacity + ".jpg' class='img_size_" + capacity + "'></div>");
		out.println("<div class='car_detail'>");
		out.println("<table border='0' cellspacing='0' class='tbl_car'>");
		out.println("<tr><td class='td_1'><label>픽업 금액</label></td><td class='td_2'><input type='text' value=" + String.format("%,d",info.getPrice()) + " class='car_input' readonly='true' disabled>원</td></tr>");
		out.println("<tr><td class='td_1'><label>인원수</label></td> ");   
		out.println("<td class='td_2'><button type='button' class='btn_minus_p' id='btn_minus_p_'" + capacity + "'>-</button>");
		out.println("<input type='number' class='person' id='per_num_" + capacity + "' maxlength='1' value='1' readonly='true' />");   
		out.println("<button type='button' class='btn_plus_p' id='btn_plus_p_'" + capacity + "' onclick='limit_person(" + capacity + ")\' >+</button></td></tr>");
		out.println("<tr><td class='td_1'><label>도착 주소</label></td> ");
		out.println("<td class='td_2'><input type='text' name='addr' placeholder='호텔 주소를 입력하세요' style='width: 250px' maxlength=50></td></tr>");
		out.println("<tr><td  colspan='2'><input type='submit' class='btn btn_pickup' value='픽업 신청'></td></tr> ");
		out.println("</table>  ");  
		out.println("</div>  ");  
		out.println("</div>  ");  
	 }    

%>
