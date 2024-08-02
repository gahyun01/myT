<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>

<html>

<head>
  <meta charset="utf-8">
  <title>항공권예매</title>
</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<%
	String trip = request.getParameter("trip");	//	편도: 1, 왕복: 2
	String resv_no = request.getParameter("resv_no");
	String resv_no2 = "";

	if(trip.equals("2"))
		resv_no2= request.getParameter("resv_no2");
%>

<body>
	<input type='hidden' id='hidden_trip' value='<%= trip %>' > 
	<input type='hidden' id='hidden_resv_no' value='<%= resv_no %>' > 
	<input type='hidden' id='hidden_resv_no2' value='<%= resv_no2 %>' > 

</body>
<script>
	//	항공권 예약내역 입력 완료 후 예약한 내역 조회로 감	
	location.href = "air_resv_final.myt?menu=air&gbn=1&trip=" + $('#hidden_trip').val() + "&resv_no=" + $('#hidden_resv_no').val() + "&resv_no2=" + $('#hidden_resv_no2').val();
</script>

</html>