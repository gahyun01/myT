<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="green.myT.dto.AirResvList" %>
<jsp:useBean id="airdb" class="myT.AirResvListDB" />

<%
  //	로그인한 user_id를 hidden_id에 셋팅하기 위한 작업
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
  <title>공항픽업 신청</title>
</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="javascript/car_pickup.js"></script>
<link href="css/default.css" rel="stylesheet" type="text/css">
<link href="css/car_pickup.css" rel="stylesheet" type="text/css">


<body>
 <!--  상단배너 -->
 <jsp:include page="banner.jsp" />
 <section>
    <!--  기본 바탕 하늘 이미지 안 항공권 검색창
          도시 선택 메뉴나 날짜 선택 달력 등도 여기에 포함됨 -->
    <div id="bgtop_car"> <!-- choice / search -->
      <!-- choice : 서비스 선택 탭 -->
      <div id="choice">
        <div class="choice0">공항픽업 신청</div>
       	<div class="choice0 choice2 choice_not"><a class="air_menu" href="car_review.jsp">공항픽업 후기</a></div>
      </div>
      <div id="search_review">
        <div class="search">
           <div class="search2_title" style='width: 400px;' >항공기 예약내역 선택 </div><div class="search2_title" style="margin-left: 190px">픽업공항</div>
          <div class="search2_title" style="margin-left: 80px">픽업일자</div><div class="search2_title" style="margin-left: 80px">픽업시간</div>
        </div>
        <div class="search3">
		  <select name='pick_air' class='car_gbn2' id='pick_air' >

<% 
	//	항공편 예약 내역을 조회해서 select로 뿌려줌
	List<AirResvList> list = airdb.selectForCar( user_id );
	//out.println("user_id: " + user_id + " size: " + list.size());
	
	String hidden_city = "서울/인천";
	String hidden_date = "";
	String hidden_time = "";
	String hidden_resv = "0";

	String car_city = "서울/인천";
	String car_date = "";
	String car_time = "";

	//	검색된 내역이 없을 경우
	if( (list == null) || (list.size() == 0) ){
%>

			<option value = '0' >예약된 항공권 내역이 없습니다.</option>		
<%
	}
	//	검색된 내역이 있을 경우
	else{
		String opt = "";
		
		for(int i = 0; i < list.size(); i++){
			AirResvList data = list.get(i);
			
			//	가장 먼저 보이는 select의 도착 도시를 hidden_city로 셋팅함
			if(i == 0){
				hidden_city = data.getArrv_city();
				hidden_date = data.getFlight_date();
				hidden_time = data.getArrv_time();
				hidden_resv =  Integer.toString(data.getResv_no());

				car_city = data.getArrv_city();
				car_date = data.getFlight_date();
				car_time = data.getArrv_time();
}

			String date = data.getFlight_date().substring(4, 6) + "월 " + data.getFlight_date().substring(6, 8) + "일";

			//opt = "KE" + data.getPlane_no() + "\t" + data.getDept_city()  + " >> " + data.getArrv_city() + "\t" + data.getFlight_date() + "\t" + data.getDept_time() + " >> " + data.getArrv_time();
			opt = String.format("%07d", data.getResv_no()) + "\t" + "KE" + data.getPlane_no() + "\t" + data.getDept_city()  + " >> " + data.getArrv_city() + "\t" + data.getFlight_date() + "\t" + data.getDept_time() + " >> " + data.getArrv_time();
%> 
          	<option value=<%= data.getPlane_seq() %> ><%= opt %></option><!-- getPlane_seq()값은 실제로는 resv_info_no 값이 들어가 있음  -->
 
<%
		}
	}
%>
		  </select>
          
 		<div class="car_0"><label class="car_1" id="car_city" ><%= car_city %></label></div>
 		<div class="car_0"><label class="car_1" id="car_date"><%= car_date %></label></div>
 		<div class="car_0"><label class="car_1" id="car_time"><%= car_time %></label></div>
        <!--input  type="button" class="btn btn_search" id="btn_search2" value="검색"-->

        <input type='hidden' class='hidden' name='hidden_id' id='hidden_id' value='<%= user_id %>' > 
 		<input type='hidden' name='hidden_city' id='hidden_city' value='<%= hidden_city %>' > 
 		<input type='hidden' name='hidden_date' id='hidden_date' value='<%= hidden_date %>' > 
 		<input type='hidden' name='hidden_time' id='hidden_time' value='<%= hidden_time %>' > 
 		<input type='hidden' name='hidden_resv' id='hidden_resv' value='<%= hidden_resv %>' > 

        </div> 

     </div><!--  search_review -->
    </div> <!-- bgtop_car -->

  <div id="bg3">
  <div id='car_list'>
<%@ page import="java.util.*" %>
<%@ page import="myT.CarInfo" %>

<jsp:useBean id="carInfodb" class="myT.CarInfoDB" />

<%
	String city = request.getParameter("city");
	//out.println("city : " + city );
	
	if( hidden_city.equals("") )
		city = "서울/인천";
	else
		city = hidden_city;
	
//	if(city == null)
//		city = "서울/인천";
	
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
		
		out.println("<div class='car_title'>" + city + " " + capacity + "인승</div>");		//	car_title start-end
		out.println("<div class='car_picture'><img src='img/car_" + capacity + ".jpg' class='img_size_" + capacity + "'></div>");	//	car_picture start-end
		out.println("<div class='car_detail'>");	//	car_detail start
		out.println("<table border='0' cellspacing='0' class='tbl_car'>");
		out.println("<tr><td class='td_1'><label>픽업 금액</label></td><td class='td_2'><input type='text' value=" + String.format("%,d",info.getPrice()) + " class='car_input' readonly='true' disabled>원</td></tr>");
		out.println("<tr><td class='td_1'><label>인원수</label></td> ");   
		out.println("<td class='td_2'><button type='button' class='btn_minus_p' id='btn_minus_p_" + capacity + "'>-</button>");
		out.println("<input type='number' class='person' id='per_num_" + capacity + "' maxlength='1' value='1' readonly='true' />");   
		out.println("<button type='button' class='btn_plus_p' id='btn_plus_p_" + capacity + "' onclick='limit_person(" + capacity + ")\' >+</button></td></tr>");
		out.println("<tr><td class='td_1'><label>도착 주소</label></td> ");
		out.println("<td class='td_2'><input type='text' name='addr' id='addr_" + capacity + "' placeholder='호텔 주소를 입력하세요' style='width: 250px' maxlength=50>");
		out.println("<input type='hidden' name='car_no' id='car_no_" + capacity + "' value='" + info.getCarNo() + "' ></td></tr>");
		 
		out.println("<tr><td  colspan='2'><input type='button' class='btn btn_pickup' id='btn_pickup_" + capacity + "' value='픽업 신청'></td></tr> ");
		out.println("</table>  ");  
		out.println("</div>  ");  	//	car_detail end
		out.println("</div>  ");	//	car_info end
	 }    
%>
   </div><!-- car_list -->
  </div><!-- bg3 -->


    <div id="caution"> <!-- 알아두세요 전용 div-->
      <div>
        <div class="caution1">
          알아두세요!
        </div>
        <div class="caution2">
          <ul>
            <li>각 차량에 따라 탑승 인원이 한정되며, 탑승 인원 초과 시 탑승이 거부될 수도 있습니다.</li>
            <li>차량 운임은 시기에 따라 변동될 수 있습니다.</li>
            <li>출발/도착 시간은 현지 시간 기준이며, 차량 스케줄은 부득이한 경우 변경될 수 있습니다.</li>
            <li>차량 예약 및 운행은 당사의 규정을 따릅니다.</li>
            <li>할인 차량을 예약하고 싶으신 경우 예약 취소 후 재예약해 주시기 바랍니다.</li>
          </ul>
        </div>
      </div>
    </div>
  </section>
<footer>
  <jsp:include page="footer.jsp" />
</footer>
</body>

</html>