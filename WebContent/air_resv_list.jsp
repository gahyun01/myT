<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.util.*" %>
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
  <title>항공권 예약조회</title>

</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="javascript/air_resv_list.js"></script>
<link href="css/default.css" rel="stylesheet" type="text/css">
<link href="css/air_resv_list.css" rel="stylesheet" type="text/css">

<body>
 <!--  상단배너 -->
 <jsp:include page="banner.jsp" />
  <form>
    <section>
    <!--  기본 바탕 하늘 이미지 안 항공권 검색창
          도시 선택 메뉴나 날짜 선택 달력 등도 여기에 포함됨 -->
    <div id="bgtop"> <!-- choice / search -->
      <!-- choice : 서비스 선택 탭 -->
      <div id="choice">
      <div class="choice0 choice_not"><a class="air_menu" href="air_resv.jsp">항공권 예매</a></div>
      <div class="choice0 choice2">예약조회</div>
        <!--div class="choice0 choice2 choice_not"><a class="air_menu" href="air_meal.jsp">기내식 신청</a></div-->
        <!--div class="choice0 choice2 choice_not"><a class="air_menu" href="air_service.jsp">기타 서비스 신청</a></div-->
        <div class="choice0 choice2 choice2_duty"><a class="air_menu" href="duty_free.jsp">기내면세품</a></div>
        <div class="choice0 choice2 choice2_pickup"><a class="air_menu" href="car_pickup.jsp">공항픽업 신청</a></div>
      </div>
    
    <div id="search">
        <div class="search1">
          <div class="search11"><input type=radio name='rad_search' class='rad_search' id='rad_1' checked /><label class='rad_label' >예약 내역 선택</label></div>
          <div id="search12">
 		    <select name='pick_air' class='car_gbn2' id='pick_air' >

<% 
			//	항공편 예약 내역을 조회해서 select로 뿌려줌
			List<AirResvList> sel_list = airdb.selectList( user_id );
			//out.println("user_id: " + user_id + " size: " + sel_list.size());
			
			//	검색된 내역이 없을 경우
			if( (sel_list == null) || (sel_list.size() == 0) ){
%>

				<option value = '0' >예약된 항공권 내역이 없습니다.</option>		
<%
			}
			//	검색된 내역이 있을 경우
			else{
				String opt = "";
%>
				<option value='ALL' > 전 체</option>
<%				
				for(int i = 0; i < sel_list.size(); i++){
					AirResvList data = sel_list.get(i);

					String date = data.getFlight_date().substring(4, 6) + "월 " + data.getFlight_date().substring(6, 8) + "일";
		
					opt = String.format("%07d", data.getResv_no()) + "\t" + "KE" + data.getPlane_no() + "\t" + data.getDept_city()  + " >> " + data.getArrv_city() + "\t" + data.getFlight_date() + "\t" + data.getDept_time() + " >> " + data.getArrv_time();
%> 
          		<option value=<%= data.getResv_no() %> ><%= opt %></option>
 
<%
				}
			}
%>
		     </select>
           </div>
        </div><!--  search1 end -->
        <div class="line" ></div>
        <div class="search20"><!-- 예약검색조건 -->
          <div class="search21"><input type=radio name='rad_search' class='rad_search'  id='rad_2' /><label class='rad_label' >예약 조건 검색</label></div>
        
          <div id="search22"><!-- 예약검색조건 입력 div -->
            <div class="search2">
              <div class="search2_title">출발지</div><div class="search2_title" style="margin-left: 115px">도착지</div><div class="search2_title" style="margin-left: 113px">출발일</div>
            </div>
            <div class="search3"> 
              <div class="air_0 air_city" id="city_dept"><label class='in_city' id="city_dept2" >전체</label><img src="img/city.png" class="img_size" ></div>
              <div class="air_0 air_city" id="city_arrv"><label class='in_city' id="city_arrv2" >전체</label><img src="img/city.png" class="img_size"></div>
              <div id="date_wrap">
                <div id="date_wrap2">
                  <div class="air_date"><input type="text" class="datepicker" id="dept_d" maxlength="10" style="margin-left: 10px;" value="가는 날" /></div>
                  <div class="gap gap1" id="gap0">~</div>
                  <div class="air_date"><input type="text" class="datepicker"  id="rtn_d"  maxlength="10" value="오는 날" /></div>
                  <div class="gap gap2" style="margin-left: 5px;" ><img src="img/date.png" class="img_size"></div>
                </div>
               </div>
 
                <button  type="button" class="btn btn_search" id="search_air">예약 내역 검색</button> 
                <input type='text' class='hidden' name='hidden_id' id='hidden_id' value='<%= user_id %>' > 
            </div> 
          </div><!-- search22 예약검색조건 입력 div end-->
        </div><!-- search20 예약검색조건 div end-->
      
        <!-- sel_city : 검색창(search)에서 도시를 선택하면 나타나는 data 선택창 -->
        <div class="sel_city" value="1">
          <div class="city_head">
            <div class="city_title">출발도시/공항</div>
            <div class="close_box" id="close_city"><img src="img/close.png"></div>
          </div>

          <!-- city_cont : 도시 리스트 div -->
          <div class="city_cont">
            <div class="city_cont2">
              <!-- div/dl/dt/dd -->
              <dl class="city_data1" value="1">
                <dt>국내</dt>
                <dd>서울/인천</dd>
                <dd>서울/김포</dd>
                <dd>부산</dd>
                <dd>제주</dd>
                <dd>대구</dd>
                <dd>광주</dd>
              </dl>
              <dl class="city_data2" value="2">
                <dt>동남아</dt>
                <dd>홍콩</dd>
                <dd>마카오</dd>
                <dd>방콕</dd>
                <dd>푸켓</dd>
                <dd>싱가포르</dd>
                <dd>타이페이</dd>
                <dd>세부</dd>
                <dd>호치민</dd>
              </dl>
              <dl class="city_data3" value="3">
                <dt>일본</dt>
                <dd>도쿄</dd>
                <dd>오사카</dd>
                <dd>후쿠오카</dd>
                <dd>삿포로</dd>
                <dd>오키나와</dd>
              </dl>
              <dl class="city_data4" value="4">
                <dt>유럽</dt>
                <dd>파리</dd>
                <dd>런던</dd>
                <dd>로마</dd>
                <dd>뮌헨</dd>
                <dd>취리히</dd>
              </dl>
              <dl class="city_data5" value="5">
                <dt>미주</dt>
                <dd>로스앤젤레스</dd>
                <dd>뉴욕</dd>
                <dd>샌프란시스코</dd>
                <dd>시애틀</dd>
                <dd>시카고</dd>
                <dd>하와이</dd>
                <dd>토론토</dd>
                <dd>벤쿠버</dd>
              </dl>
              <dl class="city_data6" value="6">
                <dt>중국</dt>
                <dd>상하이</dd>
                <dd>북경</dd>
                <dd>청도</dd>
                <dd>광저우</dd>
              </dl>
            </div> <!--city_cont2-->
          </div> <!--city_cont-->
        </div> <!-- sel_city  end : 검색창(search)에서 도시를 선택하면 나타나는 data 선택창 -->
    </div>
  </div><!--  bgtop end -->

  <div id="bg2">
    <div id='air_list'  style="margin-top: 80px">
     <!--  ajax로 검색된 항공권 예약 내역 리스트  -->
 	</div>   
 	 
    <div>
      <div class="caution1"  style='margin-top: 105px;'> 알아두세요!</div>
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