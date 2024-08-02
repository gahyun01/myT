<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%
  String user_id = "";
  String btn_log = "로그인";

  String login = (String)session.getAttribute("LOGIN");

  //  session이 null이면 로그아웃 또는 로그인 전인 상태임
  if( login != null ){
    //  로그인 상태인지 확인, x:로그인 실패, 1:로그인 성공
    if(login.equals("1")){
      //  배너에 아이디 셋팅 및 로그인 버튼을 로그아웃 버튼으로 변경
      user_id = (String)session.getAttribute("ID") + "님";
      btn_log = "로그아웃";
    }
  }
%>
<html>
<head>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="css/dbanner.css" />
   <link rel="stylesheet" href="css/tdhome.css" />
   <link rel="stylesheet" href="css/footer.css" />

   <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.2.4.js"></script>
   <script src="javascript/tdhome.js"></script> <!--file upload-->

   <!-- 기본 글씨체 -->
   <link rel="preconnect" href="https://fonts.googleapis.com">
   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
 
   <title></title>
</head>
<body>
	<header>
	<div class="banner">
		  <p style="font-size: 15px" color="white"><%= user_id %></p>
	</div>
	</header>
	<section>
	<div class="cardpage">
	<!-- 게시물 -->
	<div class="card">
		<!-- 왼쪽 큰 네모 -->
		<div class="cardhalf">
			<div class="prfbox">
				<img src="img/dprofile.png" class="prfpics"/>
				<a href="t_diary.html" class="prfid"><%= user_id %></a>
				<a href="t_diary.html" class="prfpost">게시글 19</a>
			</div>
			<div class="imgslider">			
			<img src="img/lt.png" class="lt"/>
			<img src="img/gt.png" class="gt"/>
			<div class="sliderimgs">
				<img src="img/Doong.jpg" class="imgs"/>
				<img src="img/jejuc.jpg" class="imgs"/>
				<img src="img/tomato.jpg" class="imgs"/>
				<img src="img/.png" class="imgs"/>
			</div>
			</div>
			<div class="fb">
				<div class="fbcont">
					진짜 진심 또 오고 싶었다ㅠㅠ 나 궁궐, 성 이런 거 겁나 좋아하잖아. 가자마자 1박하고 일찌감치 오사카 성 보러 나갔는데... 아니 왜케 멋짐? 날씨가 찐이라 그런가? 생동감 대박이었음. 레알 에도시대 온 줄ㅎㅎㅎ 혹시 성벽 뒤에 사무라이 있나 살핀 1인ㅋㅋㅋ
					진짜 진심 또 오고 싶었다ㅠㅠ 나 궁궐, 성 이런 거 겁나 좋아하잖아. 가자마자 1박하고 일찌감치 오사카 성 보러 나갔는데... 아니 왜케 멋짐? 날씨가 찐이라 그런가? 생동감 대박이었음. 레알 에도시대 온 줄ㅎㅎㅎ 혹시 성벽 뒤에 사무라이 있나 살핀 1인ㅋㅋㅋ
					진짜 진심 또 오고 싶었다ㅠㅠ 나 궁궐, 성 이런 거 겁나 좋아하잖아. 가자마자 1박하고 일찌감치 오사카 성 보러 나갔는데... 아니 왜케 멋짐? 날씨가 찐이라 그런가? 생동감 대박이었음. 레알 에도시대 온 줄ㅎㅎㅎ 혹시 성벽 뒤에 사무라이 있나 살핀 1인ㅋㅋㅋ
				</div>
			</div>
			<div class="iconmom">
				<div class="iconblock">
				<img src="img/heart.png" id="heart"/>
				<img src="img/share.png" id="share"/>
				</div>
				<img src="img/bookmark.png" id="bmark"/>
			</div>
		</div>
		<!-- 오른쪽 큰 네모 -->
		<div class="cardhalf">
			<!-- 플래너카드 -->
			<a href="#" class="pcard">				 
				<img src="img/osakauniversal01.jpg" class="pimg"/>
				<div class="pinf">
					<p id="ptitle">역행자의 오사카 맛집탐험</p>
					<p id="pcity">일본 오사카</p>
					<p id="pdate">2024.02.15 ~ 02.27</p>
				</div>				 
			</a>
			<h3>댓글</h3>
			<div class="rplbox">
				<!-- 댓글 카드 -->
				<div class="rpl">
				<img src="img/dprofile.png" class="icon"/>
				<div class="rplblock">
					<a href="#">아이디</a>
					<div class="rplcont">별 헤는 밤 윤동주
					계절이 지나가는 하늘에는 가을로 가득 차 있습니다. 나는 아무 걱정도 없이 가을 속의 별들을 다 헤일 듯합니다.
					가슴속에 하나둘 새겨지는 별을
					이제 다 못 헤는 것은
					쉬이 아침이 오는 까닭이요,
					내일 밤이 남은 까닭이요,
					아직 나의 청춘이 다하지 않은 까닭입니다.
					</div>
				</div>
				<img src="img/heart.png" class="smallicon"/>
				</div>
				<div class="rpl">
				<img src="img/dprofile.png" class="icon"/>
				<div class="rplblock">
					<a href="#">아이디</a>
					<div class="rplcont">별 헤는 밤 윤동주
					계절이 지나가는 하늘에는 가을로 가득 차 있습니다. 나는 아무 걱정도 없이 가을 속의 별들을 다 헤일 듯합니다.
					가슴속에 하나둘 새겨지는 별을
					이제 다 못 헤는 것은
					쉬이 아침이 오는 까닭이요,
					내일 밤이 남은 까닭이요,
					아직 나의 청춘이 다하지 않은 까닭입니다.
					</div>
				</div>
				<img src="img/heart.png" class="smallicon"/>
				</div>
				<div class="rpl">
				<img src="img/dprofile.png" class="icon"/>
				<div class="rplblock">
					<a href="#">아이디</a>
					<div class="rplcont">별 헤는 밤 윤동주
					계절이 지나가는 하늘에는 가을로 가득 차 있습니다. 나는 아무 걱정도 없이 가을 속의 별들을 다 헤일 듯합니다.
					가슴속에 하나둘 새겨지는 별을
					이제 다 못 헤는 것은
					쉬이 아침이 오는 까닭이요,
					내일 밤이 남은 까닭이요,
					아직 나의 청춘이 다하지 않은 까닭입니다.
					</div>
				</div>
				<img src="img/heart.png" class="smallicon"/>
				</div>
				<div class="rpl">
				<img src="img/dprofile.png" class="icon"/>
				<div class="rplblock">
					<a href="#">아이디</a>
					<div class="rplcont">별 헤는 밤 윤동주
					계절이 지나가는 하늘에는 가을로 가득 차 있습니다. 나는 아무 걱정도 없이 가을 속의 별들을 다 헤일 듯합니다.
					가슴속에 하나둘 새겨지는 별을
					이제 다 못 헤는 것은
					쉬이 아침이 오는 까닭이요,
					내일 밤이 남은 까닭이요,
					아직 나의 청춘이 다하지 않은 까닭입니다.
					</div>
				</div>
				<img src="img/heart.png" class="smallicon"/>
				</div>
			</div>
			<!-- 댓글생성 -->
			<div class="makerpl">
				<img src="img/dprofile.png" class="icon"/>
				<input type="text" name="rpltext" class="rpltext" placeholder="댓글 내용" class="rpltext"></input>
				<input type="button" name="inputbtn" class="btn" value="댓글입력"></input>
			</div>
		</div>
	</div>
	</div>
	</section>
	<footer>
		<div class="footer">
			<div class="footer_box1">
				<p>주식회사 마이티 | 대표 정가현</p>
				<p>사업자등록번호 649-88-37824</p>
				<p>서울특별시 강남구 강남대로 428 10F</p>
			</div>
			<div class="footer_box1">
				<p>대표번호 | 1588 - 1111</p>
				<p>contact@myt.co.kr</p>
				<p class="support"> 이용약관 | 개인정보처리방침 | 고객지원 | 1:1문의</p>
			</div>
			<div class="footer_box2">
			<div><ul><li><img src="img/banner-appstore.png"  width="100px"></li><li><img src="img/banner-googleplay.png" width="100px"></li></ul></div>
			<div><img src="img/banner2.png"  height="30px"></div>
			</div>
		</div>
	<footer>

	<div class="share">
		<div id="sclose">
			<img src="img/close.png"/>
		</div>
		<div class="stitle01">
			공유하기
		</div>
		<div class="sttitle02">
			<p class="receiver">받는 사람 : </p>
			<p class="recom">추천</p>
		</div>
		<div class="sbody">			
			<div class="sbodyhalf">
				<div class="contact"></div>
			</div>
			<div class="sbodyhalf">
			</div>
		</div>
	</div>

	<div class="backdplnr">
		<div class="dplnr">
			<div>
			</div>
		</div>
	<div>

</body>
</html>
