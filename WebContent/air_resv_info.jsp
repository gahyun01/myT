<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>

<html>

<head>
  <meta charset="utf-8">
  <title>탑승자 정보입력</title>

</head>

<!-- 구s글폰트 다운 받아서 적용함 
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Nanum+Gothic&display=swap" rel="stylesheet">
-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="javascript/air_resv_info.js"></script>
<link href="css/default.css" rel="stylesheet" type="text/css">
<link href="css/air_resv_info.css" rel="stylesheet" type="text/css">

<%@ page import="green.myT.dto.Member" %>
<%@ page import="green.myT.dto.Airplane" %>
<jsp:useBean id="memberdb" class="myT.MemberDB" />
<jsp:useBean id="planedb" class="myT.AirplaneDB" />

<%
	//	로그인한 회원인지 확인
	String user_id = "";
	String login = (String)session.getAttribute("LOGIN");

	//  로그인 상태가 아닐 경우 로그인 화면으로 이동
	if( (login == null) || !login.equals("1") ){
%>
<script>
		alert("로그인 상태가 아닙니다. 로그인을 먼저 하세요.");
		location.href = "login.jsp";
</script>
<%
	}else{
	    //  배너에 아이디 셋팅 및 로그인 버튼을 로그아웃 버튼으로 변경
	    user_id = (String)session.getAttribute("ID");
	}

//	adult=2&child=1&trip=2&dept_no=7&arrv_no=10&dept_date=20240401&arrv_date=20240406
	int adult = Integer.parseInt(request.getParameter("adult"));
	int child = Integer.parseInt(request.getParameter("child"));
	String dept_no = request.getParameter("dept_no");
	String arrv_no = request.getParameter("arrv_no");
	String trip = request.getParameter("trip");
	
%>
<body>
 <!--  상단배너 -->
 <jsp:include page="banner.jsp" />
  <form method='post'>
    <section>
    
    
    <!-- 탑승자 입력 -->
	<input type='hidden' class='hidden' name='hidden_id' id='hidden_id' value='<%= user_id %>' > 
	<input type='hidden' class='hidden' name='hidden_dept_date' id='hidden_dept_date' value='<%= request.getParameter("dept_date") %>' > 
	<input type='hidden' class='hidden' name='hidden_arrv_date' id='hidden_arrv_date' value='<%= request.getParameter("arrv_date") %>' > 
	<input type='hidden' class='hidden' name='hidden_cnt' id='hidden_cnt' value='<%= adult + child %>' > 
	
    <div class="bg_air" id="per_list" style='margin-top: 80px;'><!-- 탑승객 정보 입력창-->
      <div class="person_head">탑승객 정보</div>
      
      
 <%

 	//	탑승자 정보를 로그인 회원 정보로 셋팅
 	String e_lastnm = "";
	String e_firstnm = "";
	String gender = "0";
	String birth = "";
	String email = "";
	String email2 = "";
	String phone = "";

	Member user = memberdb.selectRow(user_id);

	if(user != null){
		e_lastnm = user.getE_lastnm();
		e_firstnm = user.getE_firstnm();
		gender =user.getGender();
		birth = user.getBirth();
		email = user.getEmail();
		email2 = user.getEmail2();
		phone = user.getPhone();
	}
	 
	for(int i=1; i <= adult + child; i++){
 %>     
      <div class="person_body"><!-- 탑승객 1명 입력창-->
        <div class="person_wrap0">
          <div class="person_wrap0_title" style="width: 60px; margin-left: 25px;" >탑승객<label> <%= i %></label></div>
          <div class="person_wrap0_title" style="margin-left: 60px;" >성(영문)</div><div class="person_wrap0_title" style="margin-left: 15px;">이름(영문)</div>
          <div class="person_wrap0_title" style="margin-left: 130px">성별</div><div class="person_wrap0_title" style="margin-left: 238px">생년월일 (YYYYMMDD)</div>
        </div>
 <%
		if(i == 1){

 %>
          <!-- person2에는 영문만 들어가고 대문자로만 보이게 되어있으나 실제값은 소문자도 있으므로 서버에서 무조건 대문자로 재변환해서 저장해야 함 -->
          <div class="person_wrap1"><input type="text" class="person2" name='last_nm_<%= i %>' id='last_nm_<%= i %>' value='<%= e_lastnm %>'>
          <input type="text"  class="person2" name='first_nm_<%= i %>' id='first_nm_<%= i %>' value='<%= e_firstnm %>'></div>
          <div class="person_wrap2"><button type="button" class="btn_gender" id="m_<%= i %>">남성</button><button type="button" class="btn_gender" id="w_<%= i %>">여성</button></div>
		  <input type='hidden' class='hidden' name='gender_<%= i %>' id='hidden_gender_<%= i %>' value='0' >
          <div class="person_wrap3"><input type="text" class="birth" maxlength="8" style="text-align: center;" name='birth_<%= i %>'  value='<%= birth %>' id='birth_<%= i %>'></div>
      </div><!-- person_body 탑승객 1명 입력창-->
<%
 		} else{
%>
          <!-- person2에는 영문만 들어가고 대문자로만 보이게 되어있으나 실제값은 소문자도 있으므로 서버에서 무조건 대문자로 재변환해서 저장해야 함 -->
          <div class="person_wrap1"><input type="text" class="person2" name='last_nm_<%= i %>' id='last_nm_<%= i %>'>
          <input type="text"  class="person2" name='first_nm_<%= i %>' id='first_nm_<%= i %>'></div>
          <div class="person_wrap2"><button type="button" class="btn_gender" id="m_<%= i %>">남성</button><button type="button" class="btn_gender" id="w_<%= i %>">여성</button></div>
		  <input type='hidden' class='hidden' name='gender_<%= i %>' id='hidden_gender_<%= i %>' value='0' > 
          <div class="person_wrap3"><input type="text" class="birth" maxlength="8" style="text-align: center;" name='birth_<%= i %>' id='birth_<%= i %>'></div>
      </div><!-- person_body 탑승객 1명 입력창-->

<%
 		}
 	}
%>

      <!-- 영문 성/이름, 셩별, 생년월일(19991010)은 각각 받고  연락처,  이메일은 1명만 받음 -->
    <div class="person_head" style="margin-top: 30px;" >탑승객 연락처</div>
    <div class="person_body2" id="per_etc"><!-- 탑승객 1명 입력창-->
        <div class="person_wrap0">
          <!-- 이메일 주소는 기존의 정보를 끌어올 수도 있음 -->
          <div class="person_wrap0_title" style="margin-left: 145px;" >이메일 주소</div>
          <div class="person_wrap0_title" style="margin-left: 305px">휴대폰 번호 (숫자만)</div>
        </div>
          <div class="person_wrap1"><input type="text" class="email" name="email" id="email" value='<%= email %>'><input type="text"  class="email2" name="email2" id="email2" value='<%= email2 %>'></div>
          <div class="person_wrap3"><input type="text" class="birth" maxlength="11" style="text-align: center;" name="phone" id="phone"  value='<%= phone %>'></div>
    </div>
      <!-- 다음 페이지로 넘어가는 버튼-->
      <div class="div_btn"><button type="button" class="btn btn_air_list" id="check_price">항공운임 확인</button></div>

    </div><!-- bg_air 탑승객 정보 입력창-->
    <!-- 예상 금액/최종결제 금액-->
   <!-- 선택한 일정 조회 -->
    <div class="bg_air" id="sch_list" style='margin-top: 20px; display: none;'>
<%
	//	가는 여정, 오는 여정과 금액  보여줌
	Airplane data = planedb.selectRow(dept_no);
	int total = 0;

	if(data != null){
		
%>
      <div class="person_head">가는 일정</div>
      <div style="margin-top: 10px">
        <table border="0" cellspacing="0">
<%
			String tmp = request.getParameter("dept_date");
			String date = tmp.substring(4, 6) + "월 " + tmp.substring(6, 8) + "일";
			int sum = (int)(adult * data.getPrice() + child * data.getPrice() * 0.6);
			total = sum;
			String amount = String.format("%,d", sum);
%>
          <tr>
            <td class="cont_resv">KE<%= data.getPlane_no() %></td>
            <td class="cont_resv2"><%= data.getDept_city() %></td>
            <td class="cont_resv1">-></td>
            <td class="cont_resv2"><%= data.getArrv_city() %></td>
            <td class="cont_resv2"><%= date %></td>
            <td class="cont_resv2"><%= data.getDept_time() %></td>
            <td class="cont_resv1">-></td>
            <td class="cont_resv2"><%= data.getArrv_time() %></td>
            <td class="cont_resv"><%= data.getHour() %></td>
            <td class="cont_resv2"><%= data.getLevel() %></td>
            <td class="cont_resv"><label class="money"><%= String.format("%,d", data.getPrice()) %></label> 원</td>
            <td class="cont_resv">성인 <%= adult %> / 소아 <%= child %></td>
            <td class="cont_resv"><label class="money"><%= amount %></label> 원</td>
            <td class="cont_resv"  style='display: none;' ><%= dept_no %></td>
            <td class="cont_resv"  style='display: none;' >1</td> <!-- 가는 편:1 -->
          </tr>
        </table>
        </div>
<%		
	}

	if(trip.equals("2")){	//	왕복일 경우 오는 여정도 셋팅
		data = planedb.selectRow(arrv_no);
		if(data != null){
%>
<%
			String tmp = request.getParameter("arrv_date");
			String date = tmp.substring(4, 6) + "월 " + tmp.substring(6, 8) + "일";
			int sum = (int)(adult * data.getPrice() + child * data.getPrice() * 0.6);
			total += sum;
			String amount = String.format("%,d", sum);
%>
       <div class="person_head"  style="margin-top: 20px">오는 일정</div>
       <div style="margin-top: 10px">
        <table border="0" cellspacing="0">
          <tr>
            <td class="cont_resv">KE<%= data.getPlane_no() %></td>
            <td class="cont_resv2"><%= data.getDept_city() %></td>
            <td class="cont_resv1">-></td>
            <td class="cont_resv2"><%= data.getArrv_city() %></td>
            <td class="cont_resv2"><%= date %></td>
            <td class="cont_resv2"><%= data.getDept_time() %></td>
            <td class="cont_resv1">-></td>
            <td class="cont_resv2"><%= data.getArrv_time() %></td>
            <td class="cont_resv"><%= data.getHour() %></td>
            <td class="cont_resv2"><%= data.getLevel() %></td>
            <td class="cont_resv"><label class="money"><%= String.format("%,d", data.getPrice()) %></label> 원</td>
            <td class="cont_resv">성인 <%= adult %> / 소아 <%= child %></td>
            <td class="cont_resv"><label class="money"><%= amount %></label> 원</td>
            <td class="cont_resv"  style='display: none;' ><%= dept_no %></td>
            <td class="cont_resv"  style='display: none;' >2</td> <!-- 오는 편:1 -->
          </tr>
        </table>
  	  </div>  
<%	
		}
	}

%>      
    <!--div class="line" style='margin-top: 20px'></div-->
      <div class="div_btn" style='margin-top: 20px'>
        <button type="button" class="btn btn_air_list"  style='background-color: blue; border: none' id="btn_resv">최종 결제 확정</button>
        <div class="div_amount"><div class="div_amount1">최종 결제금액</div>
        <div class="div_amount2" id="amount_total"><%= String.format("%,d", total) %></div><div class="div_amount3">원</div></div>
      </div>
    </div><!-- bg_air -->

    <div id="caution" style='margin-top: 70px;'> <!-- 알아두세요 전용 div-->
      <div>
        <div class="caution1">
          알아두세요!
        </div>
        <div class="caution2">
          <ul>
            <li>각 운임에 따라 기본 위탁 수하물 허용량이 제공되며, 수하물 추가 구매 시에는 별도 요금이 부과됩니다.</li>
            <li>"항공운임 등 총액"은 유류할증료와 세금을 포함한 총 운임으로 구매 시점과 환율에 따라 변동될 수 있습니다.</li>
            <li>출발/도착 시간은 현지 시간 기준이며, 항공기 스케줄은 정부인가 조건으로 예고 없이 변경될 수 있습니다.</li>
            <li>공동운항편의 탑승 및 기내서비스는 운항사의 규정을 따릅니다.</li>
            <li>할인 운임을 구매하고 싶으신 경우 예약 취소 후 재구매하여 주시기 바랍니다.</li>
          </ul>
        </div>
      </div>
    </div>
  </section>
  </form>
<footer>
  <jsp:include page="footer.jsp" />
</footer>
</body>

</html>