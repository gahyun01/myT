<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <title>항공권 좌석지정</title>
  <style>

    .cont {
      height: 35px;
      text-align: center;
      padding-left: 22px;
      padding-right: 22px;
      background-color: #e7f4ff;
    }

    .cont1 {
      padding-left: 1px;
      padding-right: 1px;
    }


    #seat {
      width: 1300px;
      height: 200px;
      margin-top: 30px;
      border: solid 1px gray;
    }
  </style>

</head>

<!-- 구s글폰트 다운 받아서 적용함 
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Nanum+Gothic&display=swap" rel="stylesheet">
-->
<link href="css/default.css" rel="stylesheet" type="text/css">

<body>
 <!--  상단배너 -->
 <jsp:include page="banner.jsp" />
  <form>

    <!-- 기본 바탕 하늘 이미지 -->
    <div id="bgtop">
      <div id="choice">
        <div class="choice0 choice_not"><a class="air_menu" href="air_resv.jsp">항공권 예매</a></div>
        <div class="choice0 choice2 choice_not"><a class="air_menu" href="air_resv_list.jsp">예약조회</a></div>
        <div class="choice0 choice2">좌석 지정</div>
        <div class="choice0 choice2 choice_not"><a class="air_menu" href="air_meal.jsp">기내식 신청</a></div>
        <div class="choice0 choice2 choice_not"><a class="air_menu" href="air_service.jsp">기타 서비스 신청</a></div>
        <div class="choice0 choice2 choice2_duty"><a class="air_menu" href="duty_free.jsp">기내면세품</a></div>
      </div>
      <div id="search">
      </div>
    </div>

    <div id="bg2">
      <div>
        <table border="0" cellspacing="0">
          <tr>
            <td class="title" style="border-top-left-radius: 10px">예약번호</td>
            <td class="title">비행기편명</td>
            <td class="title" colspan="3">출발지/도착지</td>
            <td class="title">비행일자</td>
            <td class="title" colspan="3">출발/도착시간</td>
            <td class="title">소요시간</td>
            <td class="title">탑승자명</td>
            <td class="title">금액</td>
            <td class="title">결제일자</td>
            <td class="title" style="border-top-right-radius: 10px">좌석지정</td>
          </tr>
          <tr>
            <td class="cont">2024011500000000000</td>
            <td class="cont">KE725</td>
            <td class="cont">서울</td>
            <td class="cont cont1">-></td>
            <td class="cont">오사카</td>
            <td class="cont">02월07일(수)</td>
            <td class="cont">09:00</td>
            <td class="cont cont1">-></td>
            <td class="cont">10:45</td>
            <td class="cont">1시간45</td>
            <td class="cont">홍길동</td>
            <td class="cont">288,000</td>
            <td class="cont">01월15일</td>
            <td class="cont"><input type="checkbox" name=“cancel” value="1"></td>
          </tr>
        </table>
      </div>
      <div id="seat"> 좌석지정 그림 보여줌
      </div>
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
  </form>
  <footer>
  <jsp:include page="footer.jsp" />
</footer>
</body>

</html>