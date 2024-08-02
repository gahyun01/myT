<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<link href="css/default.css" rel="stylesheet" type="text/css">
<link href="css/car_pickup.css" rel="stylesheet" type="text/css">

<%@ page import="java.util.*" %>
<%@ page import="myT.CarInfo" %>

<jsp:useBean id="carInfodb" class="myT.CarInfoDB" />

<%
	String city = request.getParameter("city");
	//out.println("city : " + city );
	
	if(city == null)
		out.println("<div class='div_blank'>검색할 도시명을 선택해주세요.</div>");
	
	else{
	
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
				out.println("<div class='car_info' id='car_info_" + capacity + "'>");	//	car_info start
			else
				out.println("<div class='car_info' style='margin-right: 23px;' id='car_info_" + capacity + "'>");	//	car_info start
%>			
			<div class='car_title'><%= city %>&nbsp<%= capacity %>인승</div>		
			<div class='car_picture'><img src='img/car_<%= capacity %>.jpg' class='img_size_<%= capacity %>'></div>	
			<div class='car_detail'>	
			<table border='0' cellspacing='0' class='tbl_car'>
				<tr><td class='td_1'><label>픽업 금액</label></td>
				<td class='td_2'><input type='text' value='<%= String.format("%,d", info.getPrice()) %>' class='car_input' readonly='true' disabled>원</td></tr>
				<tr><td class='td_1'><label>인원수</label></td>    
				<td class='td_2'><button type='button' class='btn_minus_p' id='btn_minus_p_<%= capacity %>'>-</button>
				<input type='number' class='person' id='per_num_<%= capacity %>' maxlength='1' value='1' readonly='true' />   
				<button type='button' class='btn_plus_p' id='btn_plus_p_<%= capacity %>' onclick="limit_person( <%= capacity %> )" >+</button></td></tr>
				<tr><td class='td_1'><label>도착 주소</label></td> 
				<td class='td_2'><input type='text' name='addr' id='addr_<%= capacity %>' placeholder='호텔 주소를 입력하세요' style='width: 250px' maxlength=50>
				<input type='hidden' name='car_no' id='car_no_<%= capacity %>' value='<%= info.getCarNo() %>' ></td></tr>
				 
				<tr><td  colspan='2'><input type='button' class='btn btn_pickup' id='btn_pickup_<%= capacity %>' value='픽업 신청'></td></tr> 
			</table>    
			</div>    	
			</div>  	
<%			
		 }    
	}
%>
