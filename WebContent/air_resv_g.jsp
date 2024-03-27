<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>

<html>

<head>
  <meta charset="utf-8">
  <title>항공권예매</title>

</head>

<!-- 구s글폰트 다운 받아서 적용함 
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Nanum+Gothic&display=swap" rel="stylesheet">
-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="javascript/air_resv.js"></script>
<link href="css/default.css" rel="stylesheet" type="text/css">
<link href="css/air_resv.css" rel="stylesheet" type="text/css">


<body>
 <!--  상단배너 -->
 <jsp:include page="banner_g.jsp" />
  <form>
    <section>
    <!--  기본 바탕 하늘 이미지 안 항공권 검색창
          도시 선택 메뉴나 날짜 선택 달력 등도 여기에 포함됨 -->
    <div id="bgtop"> <!-- choice / search -->
      <!-- choice : 서비스 선택 탭 -->
      <div id="choice">
        <div class="choice0">항공권 예매</div>
        <div class="choice0 choice2 choice_not"><a class="air_menu" href="air_resv_list.jsp">예약조회</a></div>
        <div class="choice0 choice2 choice_not"><a class="air_menu" href="air_meal.jsp">기내식 신청</a></div>
        <div class="choice0 choice2 choice_not"><a class="air_menu" href="air_service.jsp">기타 서비스 신청</a></div>
        <div class="choice0 choice2 choice2_duty"><a class="air_menu" href="duty_free.jsp">기내면세품</a></div>
      </div>

      <!-- search : 탭 아래 검색창 search1 / search2 / sel_city -->
      <div id="search">
        <div class="search1">
          <button type="button" class="btn_trip0 btn_trip1" value="2">왕복</button><button type="button" class="btn_trip0 btn_trip2" value="1">편도</button> 
        </div>
        <div class="search2">
          <div class="search2_title">출발지</div><div class="search2_title" style="margin-left: 115px">도착지</div>
          <div class="search2_title" style="margin-left: 113px">출발일</div><div class="search2_title" style="margin-left: 255px">탑승객</div>
        </div>
        <div class="search3"> 
          <div class="air_0 air_city" id="city_dept"><ul><li id="city_dept2">서울/인천</li><li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="img/city.png" class="img_size"></li></ul></div>
          <div class="air_0 air_city" id="city_arrv"><ul><li id="city_arrv2">도착지</li><li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="img/city.png" class="img_size"></li></ul></div>
          <div id="date_wrap">
          <div id="date_wrap2">
            <div class="air_date">
              <input type="text" class="datepicker" id="dept_d" maxlength="10" style="margin-left: 10px;" value="가는 날" /></div>
            <div class="gap gap1" id="gap0">~</div>
            <div class="air_date">
              <input type="text" class="datepicker"  id="rtn_d"  maxlength="10" value="오는 날" /></div>
            <div class="gap gap2" style="margin-left: 5px;" ><img src="img/date.png" class="img_size"></div>
          </div>
        </div>
          <div class="air_0 air_person">
            <ul style="padding-inline-start: 30px;"><li>인원&nbsp;&nbsp;성인&nbsp;</li><li id="num_a" value="1" >1</li>
              <li>&nbsp유아&nbsp</li><li id="num_c" value="0" >0</li>
              <li>&nbsp;&nbsp;<img src="img/person.png" class="img_size"></li></ul></div>
          <button  type="button" class="btn btn_search" id="search_air">항공편 검색</button> 
        </div> 
      
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

        <!-- sel_person : 검색창(search)에서 인원수를 선택하면 나타나는 data 선택창 -->
        <div class="sel_person">
          <div class="city_head">
            <div class="person_title">인원수 선택</div>
          </div>

          <div class="person_cont">
            <table  class="tbl_person"  border="0" cellpadding="9"align="center">
              <tr><td><label style="margin-left: 22px;">성인</label></td></tr>   
              <tr><td style="text-align: center;"><button type="button" id="btn_minus_a">-</button><input type="number" class="person" id="adult" maxlength="1" value="1" readonly="true" />
                      <button type="button" id="btn_plus_a">+</button></td></tr>   
              <tr><td><label style="margin-left: 22px;">소아</label></td> </tr>     
              <tr><td style="text-align: center;"><button type="button" id="btn_minus_c">-</button><input type="number" class="person" id="child" maxlength="1" value="0" readonly="true" />
                      <button type="button" id="btn_plus_c">+</button></td></tr>
              <tr><td style="text-align: center;"><button type="button" class="btn" id="btn_person">확인</button></td></tr>   
             </table>
          </div>
        </div>

      </div> <!-- search -->
    </div> <!-- bg_top -->

    <!-- 검색창 아래 검색된 항공편 리스트 : 가는 편-->
    <div class="bg_air">
     <div id="text2_resv"><label id="lbl_dept">ICN 서울/인천</label> >>>>>>>> <label id="lbl_arrv">KIX 오사카/간사이</label></div>
      <div>
        <table border="0" cellspacing="0" id="tbl_pick_dept">
          <tr>
            <td class="pick_date">
              <div class="tbl_sch">06(화)</div>
              <div class="tbl_sch">361,000</div>
            </td>
            <td class="pick_date">
              <div class="tbl_sch" value="2">07(수)</div>
              <div class="tbl_sch" value="2">362,000</div>
            </td>
            <td class="pick_date">
              <div class="tbl_sch">08(목)</div>
              <div class="tbl_sch">363,000</div>
            </td>
            <td class="pick_date">
              <div class="tbl_sch">09(금)</div>
              <div class="tbl_sch">364,000</div>
            </td>
            <td class="pick_date">
              <div class="tbl_sch">10(토)</div>
              <div class="tbl_sch">365,000</div>
            </td>
            <td class="pick_date">
              <div class="tbl_sch">11(일)</div>
              <div class="tbl_sch">366,000</div>
            </td>
            <td class="pick_date">
              <div class="tbl_sch">12(월)</div>
              <div class="tbl_sch">367,000</div>
            </td>
          </tr>
        </table>
      </div>
      <div style="margin-top:25px">
        <table class="air_list" id="tbl_dept" border="0" cellspacing="0">
          <tr>
            <td class="title_air" style="border-top-left-radius: 10px">항공기번호</td>
            <td class="title_air">비행기편명</td>
            <td class="title_air" colspan="3">출발지/도착지</td>
            <td class="title_air">비행일자</td>
            <td class="title_air" colspan="3">출발/도착시간</td>
            <td class="title_air">소요시간</td>
            <td class="title_air">금액</td>
            <td class="title_air" style="border-top-right-radius: 10px">선택</td>
          </tr>
          <tr>
            <td class="cont_resv">202401150</td>
            <td class="cont_resv">KE725</td>
            <td class="cont_resv">서울</td>
            <td class="cont_resv1">-></td>
            <td class="cont_resv">오사카</td>
            <td class="cont_resv">02월07일(수)</td>
            <td class="cont_resv">09:00</td>
            <td class="cont_resv1">-></td>
            <td class="cont_resv">10:45</td>
            <td class="cont_resv"><label class="money">360,000</label>원</td>
            <td class="cont_resv">01월15일</td>
            <td class="cont_resv"><input type="checkbox" class="chk_choice"></td>
          </tr>
          <tr>
            <td class="cont_resv">202401150</td>
            <td class="cont_resv">KE725</td>
            <td class="cont_resv">서울</td>
            <td class="cont_resv1">-></td>
            <td class="cont_resv">오사카</td>
            <td class="cont_resv">02월07일(수)</td>
            <td class="cont_resv">09:00</td>
            <td class="cont_resv1">-></td>
            <td class="cont_resv">10:45</td>
            <td class="cont_resv"><label class="money">374,000</label>원</td>
            <td class="cont_resv">01월15일</td>
            <td class="cont_resv"><input type="checkbox" class="chk_choice"></td>
          </tr>
        </table>
      </div>

      <!-- 다음 페이지로 넘어가는 버튼-->
      <div class="div_btn">
        <button type="button" class="btn btn_air_list" id="btn_next" disabled>다음여정 선택</button>
        <div class="div_amount"><div class="div_amount1">예상 결제금액</div><div class="div_amount2" id="amount_arrv"></div><div class="div_amount3">원</div></div>
      </div>
      <div class="line"></div>
    </div><!-- bg_air -->

  <!-- 검색창 아래 검색된 항공편 리스트 : 오는 편-->
    <div class="bg_air" id="rtn_list">
     <div id="text2_resv"><label id="lbl_dept">KIX 오사카/간사이</label> >>>>>>>> <label id="lbl_arrv">ICN 서울/인천</label></div>
      <div>
        <table border="0" cellspacing="0">
          <tr>
            <td class="pick_date">
              <div class="tbl_sch" >06(화)</div>
              <div class="tbl_sch">360,000</div>
            </td>
            <td class="pick_date">
              <div class="tbl_sch">07(수)</div>
              <div class="tbl_sch">360,000</div>
            </td>
            <td class="pick_date">
              <div class="tbl_sch">08(목)</div>
              <div class="tbl_sch">360,000</div>
            </td>
            <td class="pick_date">
              <div class="tbl_sch">09(금)</div>
              <div class="tbl_sch">360,000</div>
            </td>
            <td class="pick_date">
              <div class="tbl_sch">10(토)</div>
              <div class="tbl_sch">360,000</div>
            </td>
            <td class="pick_date">
              <div class="tbl_sch">11(일)</div>
              <div class="tbl_sch">360,000</div>
            </td>
            <td class="pick_date">
              <div class="tbl_sch">12(월)</div>
              <div class="tbl_sch">360,000</div>
            </td>
          </tr>
        </table>
      </div>
      <div style="margin-top:25px">
        <table class="air_list"  id="tbl_arrv" border="0" cellspacing="0">
          <tr>
            <td class="title_air" style="border-top-left-radius: 10px">항공기번호</td>
            <td class="title_air">비행기편명</td>
            <td class="title_air" colspan="3">출발지/도착지</td>
            <td class="title_air">비행일자</td>
            <td class="title_air" colspan="3">출발/도착시간</td>
            <td class="title_air">소요시간</td>
            <td class="title_air">금액</td>
            <td class="title_air" style="border-top-right-radius: 10px">선택</td>
          </tr>
          <tr>
            <td class="cont_resv">202401150</td>
            <td class="cont_resv">KE725</td>
            <td class="cont_resv">오사카</td>
            <td class="cont_resv1">-></td>
            <td class="cont_resv">서울</td>
            <td class="cont_resv">02월09일(금)</td>
            <td class="cont_resv">09:00</td>
            <td class="cont_resv1">-></td>
            <td class="cont_resv">10:45</td>
            <td class="cont_resv"><label class="money">380,000</label>원</td>
            <td class="cont_resv">01월15일</td>
            <td class="cont_resv"><input type="checkbox" class="chk_choice2"></td>
          </tr>
          <tr>
            <td class="cont_resv">202401150</td>
            <td class="cont_resv">KE725</td>
            <td class="cont_resv">오사카</td>
            <td class="cont_resv1">-></td>
            <td class="cont_resv">서울</td>
            <td class="cont_resv">02월09일(금)</td>
            <td class="cont_resv">12:00</td>
            <td class="cont_resv1">-></td>
            <td class="cont_resv">13:45</td>
            <td class="cont_resv"><label class="money">370,000</label>원</td>
            <td class="cont_resv">01월15일</td>
            <td class="cont_resv"><input type="checkbox" class="chk_choice2"></td>
          </tr>
        </table>
      </div>

      <!-- 다음 페이지로 넘어가는 버튼-->
      <div class="div_btn"><button type="button" class="btn btn_air_list" id="per_info">탑승객 정보 입력</button></div>
      <div class="line"></div>
    </div><!-- bg_air2 -->

    <div class="bg_air" id="per_list"><!-- 탑승객 정보 입력창-->
      <div class="person_head">탑승객 정보</div>
      <div class="person_body" id="per_info1"><!-- 탑승객 1명 입력창-->
        <div class="person_wrap0">
          <div class="person_wrap0_title" style="width: 60px; margin-left: 25px;" >탑승객<label>1</label></div>
          <div class="person_wrap0_title" style="margin-left: 60px;" >성(영문)</div><div class="person_wrap0_title" style="margin-left: 15px;">이름(영문)</div>
          <div class="person_wrap0_title" style="margin-left: 130px">성별</div><div class="person_wrap0_title" style="margin-left: 230px">생년월일 (YYYYMMDD)</div>
        </div>
          <!-- person2에는 영문만 들어가고 대문자로만 보이게 되어있으나 실제값은 소문자도 있으므로 서버에서 무조건 대문자로 재변환해서 저장해야 함 -->
          <div class="person_wrap1"><input type="text" class="person2" /><input type="text"  class="person2" /></div>
          <div class="person_wrap2"><button type="button" class="btn_gender" id="male">남성</button><button type="button" class="btn_gender" id="female">여성</button></div>
          <div class="person_wrap3"><input type="text" class="birth" maxlength="8" style="text-align: center;" /></div>
      </div><!-- person_body 탑승객 1명 입력창-->

      <div class="person_body" id="per_info2">
        <div class="person_wrap0">
          <div class="person_wrap0_title" style="width: 60px; margin-left: 25px;" >탑승객<label>2</label></div>
          <div class="person_wrap0_title" style="margin-left: 60px;" >성(영문)</div><div class="person_wrap0_title" style="margin-left: 15px;">이름(영문)</div>
          <div class="person_wrap0_title" style="margin-left: 130px">성별</div><div class="person_wrap0_title" style="margin-left: 230px">생년월일 (YYYYMMDD)</div>
        </div>
          <div class="person_wrap1"><input type="text" class="person2" /><input type="text"  class="person2" /></div>
          <div class="person_wrap2"><button type="button" class="btn_gender" id="male">남성</button><button type="button" class="btn_gender" id="female">여성</button></div>
          <div class="person_wrap3"><input type="text" class="birth" maxlength="8" style="text-align: center;" /></div>
      

      </div><!-- person_body 탑승객 1명 입력창-->
      <!-- 영문 성/이름, 셩별, 생년월일(19991010)은 각각 받고
        연락처,  이메일은 1명만 받음 -->

    <div class="person_head" style="margin-top: 30px;" >탑승객 연락처</div>
    <div class="person_body2" id="per_etc"><!-- 탑승객 1명 입력창-->
        <div class="person_wrap0">
          <!-- 이메일 주소는 기존의 정보를 끌어올 수도 있음 -->
          <div class="person_wrap0_title" style="margin-left: 145px;" >이메일 주소</div>
          <div class="person_wrap0_title" style="margin-left: 305px">휴대폰 번호</div>
        </div>
          <div class="person_wrap1"><input type="text" class="email" /><input type="text"  class="email" /></div>
          <div class="person_wrap3"><input type="text" class="birth" maxlength="11" style="text-align: center;" /></div>
    </div>
      <!-- 다음 페이지로 넘어가는 버튼-->
      <div class="div_btn"><button type="button" class="btn btn_air_list" id="check_price">항공운임 확인</button></div>
      <div class="line"></div>

    </div><!-- bg_air 탑승객 정보 입력창-->
    <!-- 예상 금액/최종결제 금액-->

    <div id="caution"> <!-- 알아두세요 전용 div-->
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