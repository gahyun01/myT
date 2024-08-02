<%@page import="green.myT.dto.Festival_photo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="green.myT.dto.Festival"%>
<%@ page import="myT.PostDB"%>
<%@ page import="myT.PostGetSet"%>
<%@ page import="myT.TicketDB"%>
<%@ page import="myT.TicketGetSet"%>
<!-- 로그인 없이도 볼 수 있는 페이지 -->
<%
	//	로그인한 user_id를 hidden_id에 셋팅
	String user_id = "";

	String login = (String) session.getAttribute("LOGIN");

	//  session이 null이면 로그아웃 또는 로그인 전인 상태임
	if (login != null) {
		//  로그인 상태인지 확인, x:로그인 실패, 1:로그인 성공
		if (login.equals("1")) {
			//  배너에 아이디 셋팅 및 로그인 버튼을 로그아웃 버튼으로 변경
			user_id = (String) session.getAttribute("ID");
		}
	}
%>
<%
	request.setCharacterEncoding("utf-8");
%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/banner.css" />
<link rel="stylesheet" href="css/festvdetail.css" />

<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.2.4.js"></script>
<script src="javascript/festvdetail.js"></script>
<!--file upload-->

<!-- 기본 글씨체 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">

<!-- 날씨 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Anta&display=swap"
	rel="stylesheet">
<title></title>
</head>
<body>
	<header> </header>
	<!--  상단배너 -->
	<jsp:include page="banner.jsp" />
	<section>
		<div class="cardpage">
			<div class="cardtitle">
				<div>myT Festival List</div>
				<div>마이티에서 제공하는 세계 각국, 국내 곳곳의 화려한 페스티벌!</div>
				<div>
					축제 둘러보기, 계획 짜기, 티켓팅까지 마이티에서 한 번에 해결하세요<img id="wink"
						src="img/wink.png" />
				</div>
			</div>
			<%
				List<Festival> list = (List<Festival>) request.getAttribute("result");
				for (int i = 0; i < list.size(); i++) {
					Festival festv = list.get(i);

					String startorigin = festv.getFestv_start();
					String[] startparts = startorigin.split("-");
					String start = startparts[0] + "년 " + startparts[1] + "월 " + startparts[2] + "일";

					String endorigin = festv.getFestv_end();
					String[] endparts = endorigin.split("-");
					String end = endparts[0] + "년 " + endparts[1] + "월 " + endparts[2] + "일";

					TicketDB tdb = new TicketDB(); // 티켓 
					TicketGetSet tgs = null;
					ArrayList<TicketGetSet> tgsa = tdb.TicketDBselect();
					tgs = tgsa.get(0);
					int adultprice = tgs.getTck_price();
					tgs = tgsa.get(1);
					int youngprice = tgs.getTck_price();
					tgs = tgsa.get(2);
					int kidprice = tgs.getTck_price();

					if (i == 0) {
			%>
			<!-- 게시물 -->
			<div class="cardwrap">
				<div class="card">
					<div class="name"><%=festv.getFestv_name()%></div>
					<div class="ename"><%=festv.getFestv_ename()%></div>
					<img src="<%=festv.getFestv_title()%>" class="festvtitle" />
					<div class="slidermom2">
						<div class="infomom">장소</div>
						<div class="infoson"><%=festv.getFestv_place()%></div>
						<div class="infomom">축제시작</div>
						<div class="infoson"><%=start%></div>
						<div class="infomom">축제종료</div>
						<div class="infoson"><%=end%></div>
						<div class="infomom">성인요금</div>
						<div class="infoson"><%=adultprice%>원
						</div>
						<div class="infomom">청소년요금</div>
						<div class="infoson"><%=youngprice%>원
						</div>
						<div class="infomom">소인요금</div>
						<div class="infoson"><%=kidprice%>원
						</div>
					</div>
					<div class="detail"><%=festv.getFestv_detail()%></div>
					<div id="seemore">내용 토글</div>
					<div class="btnmom">
						<a href="#infobox" class=infotab>상세정보</a> <a href="#postlistbox"
							class="postlisttab">축제후기</a> <a href="#ticketbox"
							class="ticketingtab">티켓팅</a>
					</div>
					<div class="infobox" id="infobox">
						<p class="infoboxtitle">상세 정보</p>
						<%
							} //if문 종료.
						%>
						<img class="infophoto" src="<%=festv.getEx_img()%>" />
						<div class="infodetail"><%=festv.getEx_detail()%></div>
						<%
							} // festvdetail에 관한 for문 종료.
						%>
					</div>
					<div class="postlistbox" id="postlistbox">
						<p class="postlistboxtitle">축제 후기</p>
						<%
							PostDB p = new PostDB();
							ArrayList<PostGetSet> a = p.PostDBselect(); // arrayList만들어서 리턴값 받아오기.
							PostGetSet pgs = null;
							// out.print(pgs.getFest_rtime());

							out.println("<table class='table' border='0'><tr><td class='td'><div class='hrvNo'>글번호</div></td>");
							out.println("<td class='td'><div class='htitle'>제목</div></td>");
							out.println("<td class='td'><div class='huserId'>작성자</div></td>");
							out.println("<td class='td'><div class='hfestrTime'>작성일시</div></td></tr>");
							//				out.println("<td class='td'><div class='festCnt'>조회수</div></td>");
							//				out.println("<td class='td'><div class='festRstars'>별점</div></td></tr>");

							//				out.println(pgs.getFest_rtime());
							//				String rtime = pgs.getFest_rtime();
							//				String rrtime = rtime.substring(0, 10);

							for (int k = 0; k < a.size(); k++) {
								pgs = a.get(k);
								// rvNo 내용을 바꿨다. 클래스는 rvNo지만 내용은 사실 아니다.
						%>
						<tr>
							<td class='td'><div class='rvNo'><%=k + 1%></div></td>
							<td class='td'><a class='title'><div><%=pgs.getFest_title()%></div></a></td>
							<td class='td'><div class='userId'><%=pgs.getUser_id()%></div></td>
							<td class='td'><div class='festTime'><%=pgs.getFest_rtime().substring(0, 10)%></div></td>
						</tr>
						<tr class='conttr'>
							<td class='td' colspan="3"><div class='cont'><%=pgs.getFest_rcont()%></div></td>
							<td class='td'><div>
									<a id='delbtn'>삭제하기</a>
								</div></td>
						</tr>
						<%
							String writer_id = pgs.getUser_id();
							}
						%>
						</table>
						<a href="postwrite.jsp" onclick=function()>
							<div class="write">후기쓰기</div>
						</a>
					</div>
					<div class="ticketbox">
						<p class="ticketboxtitle">티켓팅</p>
						<div class='tinfo'>
							<h3 class='ttitle'>예매 유의사항</h3>
							<ul>
								<li>다른 이용자의 원활한 예매 및 취소에 지장을 초래할 정도로 반복적인 행위를 지속하는 경우 회원의
									서비스 이용을 제한할 수 있습니다.</li>
								<li>일부 상품의 판매 오픈 시 원활한 서비스 제공을 위하여 인터파크페이, I-point, NOL
									포인트, 문화예매권 등의 특정 결제수단 이용이 제한될 수 있습니다.</li>
							</ul>
						</div>

						<div class='tinfo'>
							<h3 class='ttitle'>티켓 수령 안내</h3>
							<p class='tsmalltitle'>예약 번호 입장</p>
							<ul>
								<li>공연 당일 현장 교부처에서 예약번호 및 본인 확인 후 티켓을 수령하실 수 있습니다.</li>
								<li>상단 예매확인/취소 메뉴에서 예매내역을 프린트하여 가시면 편리합니다.</li>
							</ul>
							<p class='tsmalltitle'>티켓배송</p>
							<ul>
								<li>예매완료(결제익일) 기준 4~5일 이내에 배송됩니다. (주말, 공휴일을 제외한 영업일 기준)</li>
								<li>배송 중 전달 불가사항이 발생할 시에는 반송되며, 본인 수령 불가 시 경우에 따라 대리 수령도
									가능합니다.</li>
								<li>공연 3일 전까지 티켓을 배송받지 못하신 경우 고객센터(1544-1555)로 연락 주시기 바랍니다.</li>
								<li>반송이 확인되지 않은 티켓은 현장에서도 수령하실 수 없으며, 공연 관람 및 환불이 불가합니다.</li>
								<li>티켓 배송 (배송상태 : 배송 준비중 이후) 후에는 주소 변경이 불가합니다.</li>
								<li>부득이하게 주소 변경이 필요하신 경우 각 배송사에 수취 거절 요청 후,
									고객센터(1544-1555)로 재배송 신청할 수 있습니다. (배송비 3,200원 추가 부과)</li>
							</ul>
						</div>

						<div class='tinfo'>
							<h3 class='ttitle'>예매 취소 시 유의사항</h3>
							<p class='tsmalltitle'></p>
							<ul>
								<li>①예매 후 7일까지 취소 시에는 취소수수료가 없습니다.</li>
								<li>② 관람일 기준은 아래와 같이 취소수수료가 적용됩니다.
									<ul>
										<li>~관람일 10일전까지 : 뮤지컬/콘서트/클래식 장당 4,000원, 연극/전시 등 장당
											2,000원 (단, 최대 티켓금액의 10% 한도)</li>
										<li>관람일 9일전~관람일 7일전까지 : 티켓금액의 10%</li>
										<li>관람일 6일전~관람일 3일전까지 : 티켓금액의 20%</li>
										<li>관람일 2일전~관람일 1일전까지 : 티켓금액의 30%</li>
									</ul>
								</li>
								<li>①번과 ②번 모두 해당되는 경우, ②번 기준이 우선 적용됩니다.</li>
								<li>②번의 경우에도 예매 당일 밤 12시 이전 취소 시에는 취소수수료가 없습니다. (취소기간 내에
									한함)</li>
								<li>취소 시 예매수수료는 예매 당일 밤 12시 이전까지 환불되며, 그 이후 기간에는 환불되지 않습니다.</li>
								<li>웹 취소가능시간 이후에는 취소가 불가합니다.</li>
								<li>단, 관람일 당일 취소가능 한 상품의 경우 관람일 당일 취소 시에는 티켓금액의 90%가 과금됩니다.</li>
								<li>상품의 특성에 따라서, 취소수수료 정책이 달라질 수 있습니다.(각 상품 예매 시 취소수수료 확인)</li>
								<li>배송 및 반송처리 된 티켓의 배송료는 환불되지 않습니다.</li>
								<li>금주 주말 (토/일)공연 취소를 원할 경우 내사수령 바랍니다. 우편으로 보낼 시 우체국이 토요일
									근무를 안하는 관계로 수취인(인터파크)수령이 불가능하여 취소처리가 되지 않을 수 있습니다.</li>
								<li>취소는 관람일 하루 전(평일/주말/공휴일 오후 5시, 토요일 오전 11시 이전)까지 직접 취소가
									가능합니다. <br>배송이 시작된 티켓의 경우 티켓이 인터파크 티켓 고객센터로 공연 전일까지 반송되어야
									취소가능하며, <br>취소수수료는 도착일자 기준으로 부과됩니다. <br>(※ 단, 배송료는
									환불되지 않으며 일괄배송 상품의 경우 취소에 대한 자세한 문의는 고객센터로 문의해주시기 바랍니다.)
								</li>
								<li>(공연 전일이 휴일인 경우, 휴일 전날까지) 반송이 확인되지 않은 티켓은 현장에서도 수령하실 수
									없으며, 공연 관람 및 환불이 불가합니다.</li>
							</ul>
							<p class='tsmalltitle'>티켓 반송 주소</p>
							<ul>
								<li>(08511) 서울 금천구 벚꽃로 278 SJ테크노빌 빌딩 15층 인터파크 고객센터 환불담당자</li>
								<li>예매 및 예매취소, 티켓 반송 서비스는 소비자기본법에 따른 소비자분쟁 해결기준(공정위 고시)에
									따릅니다.</li>
							</ul>
						</div>

						<div class='tinfo'>
							<h3 class='ttitle'>환불안내</h3>
							<p class='tsmalltitle'>신용카드 결제의 경우</p>
							<ul>
								<li>일반적으로 당사의 취소 처리가 완료되고 4~5일 후 카드사의 취소가 확인됩니다. (체크카드 동일)</li>
								<li>예매 취소 시점과 해당 카드사의 환불 처리기준에 따라 취소금액의 환급방법과 환급일은 다소 차이가
									있을 수 있으며, 예매 취소시 기존에 결제하였던 내역을 취소하며 최초 결제하셨던 동일카드로 취소 시점에 따라
									취소수수료와 배송료를 재승인 합니다.</li>
							</ul>
							<p class='tsmalltitle'>무통장 입금의 경우</p>
							<ul>
								<li>예매 취소 시에 환불 계좌번호를 남기고, 그 계좌를 통해 취소수수료를 제외한 금액을 환불 받습니다.
									취소 후 고객님의 계좌로 입금까지 대략 5~7일 정도가 소요됩니다. (주말 제외)</li>
								<li>환불은 반드시 예매자 본인 명의의 계좌로만 받으실 수 있습니다.</li>
								<br>단, 예매자 본인 명의의 계좌가 없을 경우에는 직계 가족 명의의 계좌에 한하여 가능하며, 이 경우
								관계를 증명할 수 있는 증빙서류를 예매자 본인이 팩스나 우편 등으로 인터파크 티켓 본사로 보내주셔야 합니다.
								(예매자 본인 외 가족이 증빙서류를 보내주셨을 경우, 이로 인해 문제 발생 시 환불 접수한 가족 본인에게 모든
								책임이 있습니다.)
								</li>
							</ul>
							<p class='tsmalltitle'>휴대폰 결제의 경우</p>
							<ul>
								<li>취소 신청 후 바로 취소 처리가 되며 취소 수수료를 제외한 티켓 금액 및
									예매수수료/핸드폰결제이용료가 취소 가능합니다.</li>
								<li>예매 취소 시 기존에 결제하셨던 내역을 취소하며 결제하셨던 동일 정보로 취소 시점에 따라
									취소수수료가 재승인 합니다. (티켓이 배송된 경우는 배송료 포함하여 재승인 합니다.)</li>
								<li>환불 지연 등에 따른 배상급 지급에 대한 사항은 전자상거래 등에서의 소비자 보호에 관한 법률 및
									소비자기본법에 따른 소비자분쟁 해결기준(공정위 고시)에 따르며 관련 문의는 고객센터로 연락주시기 바랍니다.</li>
							</ul>
						</div>

						<div class='tinfo'>
							<h3 class='ttitle'>무통장입금 시 주의사항</h3>
							<p class='tsmalltitle'></p>
							<ul>
								<li>입금 시 총 결제금액을 정확히 입금하여야 합니다. 입금금액이 다를 경우 예매내역은 자동취소 되며,
									입금된 금액은 추후 환불 처리됩니다. <br>2건 이상 예매시에도, 각 예매 건 별로 입금을 하셔야
									합니다.
								</li>
								<li>입금 시, 입금자명으로 주문자명과 동일하게 입금해주시기 바랍니다.</li>
								<li>수표는 정상적으로 입금되지 않고 입금 오류가 발생하오니, 현금으로 입금을 해주시기 바랍니다.</li>
								<li>예매일 익일 오후 23시 59분까지 입금하지 않으시면 자동으로 예매취소 되며, 상품에 따라 입금
									기한이 상이 할 수 있으니 My 티켓에서 입금 마감시간을 확인해주시기 바랍니다. (단, 오후 17시 이후에는
									무통장입금 문의 대응이 어려울 수 있으니, 이전시간 입금을 권장합니다.)</li>
								<li>주말/공휴일은 은행 영업일이 아니고, ATM기기 중 가상계좌입금이 안 되는 경우가 있으니
									인터넷뱅킹, 폰뱅킹이 어려우신 고객님은 결제방법을 다른 결제수단을 선택하시기 바랍니다.</li>
								<li>은행에 무통장 입금 시에는 입금증에 반드시 전화번호를 기입하시기 바랍니다.</li>
								<li>입금 후에는 반드시 입금확인 메일이나 예매확인/취소에서 입금확인내역을 확인 후 공연장으로 가시기
									바랍니다.</li>
								<li>무통장입금 시 입급확인까지 일정시간이 소요될 수 있습니다.</li>
							</ul>
						</div>
						<a href="#" id="ticketbtn">
							<div>티켓 구매</div>
						</a>
					</div>
					<!-- ticketbox -->
				</div>
				<!-- card -->
				<div class="ticketingwrap">
					<div class="ticketingbox">
						<div>예매일시</div>
						<select name="">
							<%
								TicketDB tdb = new TicketDB(); // 티켓 
								TicketGetSet tgs = null;
								ArrayList<TicketGetSet> tgsa = tdb.TicketDBselect();

								String age;
								String day;
								int i = 0;

								for (i = 0; i < (tgsa.size() - 1); i++) {
									tgs = tgsa.get(i);

									if (tgs.getAge() == "adult") {
										age = "성인";
									} else if (tgs.getAge() == "young") {
										age = "청소년";
									} else {
										age = "소인";
									}
									
									if (tgs.getStart_day() == "mon") {
										day = "월";
									} else if (tgs.getStart_day() == "tue") {
										day = "화";
									} else if (tgs.getStart_day() == "wed") {
										day = "수";
									} else if (tgs.getStart_day() == "thu") {
										day = "목";
									} else if (tgs.getStart_day() == "fri") {
										day = "금";
									} else if (tgs.getStart_day() == "sat") {
										day = "토";
									} else{
										day = "일";
									}
									
									out.print("<option>" + tgs.getStart_date() + " " + tgs.getStart_time() + " " + day + " ~ "
											+ tgs.getEnd_time() + " " + age + "</option>");
								}
							%>
						</select>
						<div>예매</div>
						<div>예매</div>
					</div>
					<div id=getticket>예매하기</div>
				</div>
			</div>
			<!-- cardwrap -->
		</div>
		<!-- cardpage -->
	</section>
	<div class="ticketingbg">
		<div class="ticketing">
			<form>
				<h3>티켓팅</h3>
				<div>티켓매수</div>
				<select name="tck_count">
					<option value="1">1매</option>
					<option value="2">2매</option>
					<option value="3">3매</option>
					<option value="4">4매</option>
					<option value="5">5매</option>
				</select>
			</form>
		</div>
	</div>
	<footer>
		<jsp:include page="footer.jsp" />
	</footer>
</body>
</html>


