<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
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

  String gbn = request.getParameter("gbn");
  
  if(gbn == null)
	  gbn = "";
  
  //	null이면 처음 방문, 1이면 저장 성공, 0이면 실패
  if(gbn.equals("1")){
%>
<script>
	alert("저장되었습니다");
</script>
<%
  }else if(gbn.equals("0")){
%>
<script>
	alert("저장실패");
</script>
<%
  }
%>

<html>

<head>
  <meta charset="utf-8">
  <title>공항픽업 후기</title>
</head>

<!-- 구s글폰트 다운 받아서 적용함 
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Nanum+Gothic&display=swap" rel="stylesheet">
-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="javascript/car_review.js"></script>
<link href="css/default.css" rel="stylesheet" type="text/css">
<link href="css/car_review.css" rel="stylesheet" type="text/css">


<body>
 <!--  상단배너 -->
 <jsp:include page="banner.jsp" />
 <section>
   <!--  기본 바탕 하늘 이미지 안 항공권 검색창
       도시 선택 메뉴나 날짜 선택 달력 등도 여기에 포함됨 -->
   <div id="bgtop_car"> <!-- choice / search -->
      <!-- choice : 서비스 선택 탭 -->
      <div id="choice">
       	<div class="choice0 choice_not"><a class="air_menu" href="car_pickup.jsp">공항픽업 신청</a></div>
        <div class="choice0 choice2 ">공항픽업 후기</div>
      </div>
      <div id="search_review">
        <div class="search">
           <div class="search2_title">도시 선택</div><div class="search2_title" style="margin-left: 90px">차량 종류</div>
          <div class="search2_title" style="margin-left: 95px">작성자</div><div class="search2_title" style="margin-left: 75px">검색어</div>
           <input type='hidden' class='hidden' name='hidden_city' id='hidden_city' value='서울/인천'> 
           <input type='hidden' class='hidden' name='hidden_id' id='hidden_id' value='<%= user_id %>' > 
        </div>
        <div class="search3">
          <div class="air_0 air_city" id="city_dept"><ul><li id="city_dept2">서울/인천</li><li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="img/city.png" class="img_size"></li></ul></div>
          <select name='car_gbn' class='car_gbn'>
          	<option value='0' >선택</option><option value='5' >5인승</option>
			<option value='8' >8인승</option><option value='12' >12인승</option>
          </select>
          <input type='text' class='search_input' name='search_id' maxlength='15' >
             <input type='text' class='search_input' name='search_cont' maxlength='20' >
          <input  type="button" class="btn btn_search" id="btn_search" onclick="search_review()" value="검색">
        </div> 

        <!-- sel_city : 검색창(search)에서 도시를 선택하면 나타나는 data 선택창 -->
        <div class="sel_city" value="1">
          <div class="city_head">
            <div class="city_title">도시</div>
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
                <dd>제주도</dd>
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
     
     </div><!--  search_review -->
    </div> <!-- bgtop_car -->
    

  <div id="bg_car">
    <div id="car">
<%@ page import="java.util.*" %>
<%@ page import="myT.CarReview" %>

<jsp:useBean id="cardb" class="myT.CarReviewDB" />

 <%
	//	UserDB의 함수를 사용하기 위해서는 객체를 생성해야 하므로 useBean을 해야 하지만
	//	User class는 객체를 만들 필요는 없으므로 import만 해도 됨
	 ArrayList<CarReview> rvArray = cardb.selectAll();
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
	 	
	 	//	로그인한 아이디와 작성자가 같을 경우만 삭제 버튼을 보여준다
	 	if(user_id.equals(review.getUserId()))
	 		out.println("<input type='button' class='btn_del' value='삭제' onclick=\"deleterow(" + review.getRvNo() + ", \'" + review.getUserId() + " \' )\" >");

	 	out.println("</div></div>");
	 }

%>
    <div class='bg3' ><button  type="button" class="btn_insert" id="btn_insert" >글쓰기</button></div>
    
    </div>
    <!--div>
        <div id="tour">추천관광지 리스트
        </div>
    </div-->
  </div><!-- bg -->

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