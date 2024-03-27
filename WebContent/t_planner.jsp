<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<html>

<head>
  <meta charset="utf-8">
  <title>myT</title>
  <link rel="stylesheet" href="css/mytbtop.css" />
  <link rel="stylesheet" href="css/planner.css" />
 
  <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.2.4.min.js"></script>
  <script src="javascript/planner.js"></script>
</head>

<body>
 <!--  상단배너 -->
 <jsp:include page="banner.jsp" />

  <form>

    <!-- 베스트 탑 10 플래너 게시물 -->
    <div class="pbclick">
      <!-- 제주도 -->
      <div class="diary">
        <img class="close-btn" src="img/x.png" />
        <div class="hdiary">
          <div class="default">
            <p class="nation">JEJU</p>
            <p class="title">홍길동의 제주도 맛집투어</p>
            <!-- 사진 -->
            <div class="picpage">
              <div class="sab1">
                <img src="img/lt.png" />
              </div>
              <div class="picture">
                <img class="main" src="img/jejuc.jpg" />
                <img class="main" src="img/jejuc1.jpg" />
                <img class="main" src="img/jejuc2.jpg" />
                <img class="main" src="img/jejuc3.jpg" />
                <div class="profile">
                  <img src="img/Doong.jpg" />
                  <p class="id">1879.03</p>
                </div>
                <p class="text">진짜 진심 또 오고 싶었다ㅠㅠ 나 궁궐, 성 이런 거 겁나 좋아하잖아. 가자마자 1박하고 일찌감치 오사카 성 보러 나갔는데... 아니 왜케 멋짐? 날씨가 찐이라 그런가? 생동감 대박이었음. 레알 에도시대 온 줄ㅎㅎㅎ 혹시 성벽 뒤에 사무라이 있나 살핀 1인ㅋㅋㅋ</p>
              </div>
              <div class="sab2">
                <img src="img/gt.png" />
              </div>
            </div>
          </div>
          <!-- 아이콘 -->
          <div class="cicon">
            <div class="ciconl">
              <div class="ci" id="heart">
                <img src="img/heart.png" />
                <a>37만</a>
              </div>
              <div class="ci" id="comment">
                <img src="img/comment.png" />
                <a>1,347</a>
              </div>
              <div class="ci" id="share">
                <img src="img/share.png" />
                <a>1만</a>
              </div>
            </div>
            <div class="ci" id="bookmark">
              <img src="img/bookmark.png" />
            </div>
          </div>
          <!-- 댓글 -->
          <div class="comments">
            <div class="pcom">
              <img src="img/Doong.jpg" width="50px" height="50px"/>
              <div class="middlecom">
                <p class="id">1879.03</p>
                <p class="text">진짜 진심 또 오고 싶었다ㅠㅠ 나 궁궐, 성 이런 거 겁나 좋아하잖아. 가자마자 1박하고 일찌감치 오사카 성 보러 나갔는데... 아니 왜케 멋짐? 날씨가 찐이라 그런가? 생동감 대박이었음. 레알 에도시대 온 줄ㅎㅎㅎ 혹시 성벽 뒤에 사무라이 있나 살핀 1인ㅋㅋㅋ</p>
              </div>
              <div class="heart"><img src="img/heart.png" width="20px" height="20px"/></div>
            </div>
            <div class="pcom">
              <img src="img/Doong.jpg" width="50px" height="50px"/>
              <div class="middlecom">
                <p class="id">1879.03</p>
                <p class="text">진짜 진심 또 오고 싶었다ㅠㅠ 나 궁궐, 성 이런 거 겁나 좋아하잖아. 가자마자 1박하고 일찌감치 오사카 성 보러 나갔는데... 아니 왜케 멋짐? 날씨가 찐이라 그런가? 생동감 대박이었음. 레알 에도시대 온 줄ㅎㅎㅎ 혹시 성벽 뒤에 사무라이 있나 살핀 1인ㅋㅋㅋ</p>
              </div>
              <div class="heart"><img src="img/heart.png" width="20px" height="20px"/></div>
            </div>
            <div class="pcom">
              <img src="img/Doong.jpg" width="50px" height="50px"/>
              <div class="middlecom">
                <p class="id">1879.03</p>
                <p class="text">진짜 진심 또 오고 싶었다ㅠㅠ 나 궁궐, 성 이런 거 겁나 좋아하잖아. 가자마자 1박하고 일찌감치 오사카 성 보러 나갔는데... 아니 왜케 멋짐? 날씨가 찐이라 그런가? 생동감 대박이었음. 레알 에도시대 온 줄ㅎㅎㅎ 혹시 성벽 뒤에 사무라이 있나 살핀 1인ㅋㅋㅋ</p>
              </div>
              <div class="heart"><img src="img/heart.png" width="20px" height="20px"/></div>
            </div>
            <div class="pcom">
              <img src="img/Doong.jpg" width="50px" height="50px"/>
              <div class="middlecom">
                <p class="id">1879.03</p>
                <p class="text">진짜 진심 또 오고 싶었다ㅠㅠ 나 궁궐, 성 이런 거 겁나 좋아하잖아. 가자마자 1박하고 일찌감치 오사카 성 보러 나갔는데... 아니 왜케 멋짐? 날씨가 찐이라 그런가? 생동감 대박이었음. 레알 에도시대 온 줄ㅎㅎㅎ 혹시 성벽 뒤에 사무라이 있나 살핀 1인ㅋㅋㅋ</p>
              </div>
              <div class="heart"><img src="img/heart.png" width="20px" height="20px"/></div>
            </div>
            <div class="pcom">
              <img src="img/Doong.jpg" width="50px" height="50px"/>
              <div class="middlecom">
                <p class="id">1879.03</p>
                <p class="text">진짜 진심 또 오고 싶었다ㅠㅠ 나 궁궐, 성 이런 거 겁나 좋아하잖아. 가자마자 1박하고 일찌감치 오사카 성 보러 나갔는데... 아니 왜케 멋짐? 날씨가 찐이라 그런가? 생동감 대박이었음. 레알 에도시대 온 줄ㅎㅎㅎ 혹시 성벽 뒤에 사무라이 있나 살핀 1인ㅋㅋㅋ</p>
              </div>
              <div class="heart"><img src="img/heart.png" width="20px" height="20px"/></div>
            </div>
            <div class="pcom">
              <img src="img/Doong.jpg" width="50px" height="50px"/>
              <div class="middlecom">
                <p class="id">1879.03</p>
                <p class="text">진짜 진심 또 오고 싶었다ㅠㅠ 나 궁궐, 성 이런 거 겁나 좋아하잖아. 가자마자 1박하고 일찌감치 오사카 성 보러 나갔는데... 아니 왜케 멋짐? 날씨가 찐이라 그런가? 생동감 대박이었음. 레알 에도시대 온 줄ㅎㅎㅎ 혹시 성벽 뒤에 사무라이 있나 살핀 1인ㅋㅋㅋ</p>
              </div>
              <div class="heart"><img src="img/heart.png" width="20px" height="20px"/></div>
            </div>
            <div class="pcom">
              <img src="img/Doong.jpg" width="50px" height="50px"/>
              <div class="middlecom">
                <p class="id">1879.03</p>
                <p class="text">진짜 진심 또 오고 싶었다ㅠㅠ 나 궁궐, 성 이런 거 겁나 좋아하잖아. 가자마자 1박하고 일찌감치 오사카 성 보러 나갔는데... 아니 왜케 멋짐? 날씨가 찐이라 그런가? 생동감 대박이었음. 레알 에도시대 온 줄ㅎㅎㅎ 혹시 성벽 뒤에 사무라이 있나 살핀 1인ㅋㅋㅋ</p>
              </div>
              <div class="heart"><img src="img/heart.png" width="20px" height="20px"/></div>
            </div>
            <div class="pcom">
              <img src="img/Doong.jpg" width="50px" height="50px"/>
              <div class="middlecom">
                <p class="id">1879.03</p>
                <p class="text">진짜 진심 또 오고 싶었다ㅠㅠ 나 궁궐, 성 이런 거 겁나 좋아하잖아. 가자마자 1박하고 일찌감치 오사카 성 보러 나갔는데... 아니 왜케 멋짐? 날씨가 찐이라 그런가? 생동감 대박이었음. 레알 에도시대 온 줄ㅎㅎㅎ 혹시 성벽 뒤에 사무라이 있나 살핀 1인ㅋㅋㅋ</p>
              </div>
              <div class="heart"><img src="img/heart.png" width="20px" height="20px"/></div>
            </div>
            <div class="pcom">
              <img src="img/Doong.jpg" width="50px" height="50px"/>
              <div class="middlecom">
                <p class="id">1879.03</p>
                <p class="text">진짜 진심 또 오고 싶었다ㅠㅠ 나 궁궐, 성 이런 거 겁나 좋아하잖아. 가자마자 1박하고 일찌감치 오사카 성 보러 나갔는데... 아니 왜케 멋짐? 날씨가 찐이라 그런가? 생동감 대박이었음. 레알 에도시대 온 줄ㅎㅎㅎ 혹시 성벽 뒤에 사무라이 있나 살핀 1인ㅋㅋㅋ</p>
              </div>
              <div class="heart"><img src="img/heart.png" width="20px" height="20px"/></div>
            </div>
            <div class="pcom">
              <img src="img/Doong.jpg" width="50px" height="50px"/>
              <div class="middlecom">
                <p class="id">1879.03</p>
                <p class="text">진짜 진심 또 오고 싶었다ㅠㅠ 나 궁궐, 성 이런 거 겁나 좋아하잖아. 가자마자 1박하고 일찌감치 오사카 성 보러 나갔는데... 아니 왜케 멋짐? 날씨가 찐이라 그런가? 생동감 대박이었음. 레알 에도시대 온 줄ㅎㅎㅎ 혹시 성벽 뒤에 사무라이 있나 살핀 1인ㅋㅋㅋ</p>
              </div>
              <div class="heart"><img src="img/heart.png" width="20px" height="20px"/></div>
            </div>

          </div>  
          <!-- 댓글 입력창 -->
          <div class="plus">
            <img class="pro" src="img/Doong.jpg" width="50px" height="50px"/>
            <div class="pluscom">
              <input type="text" class="combox" placeholder="댓글 달기..." />
              <img src="img/gif.png" width="30px" height="30px"/>
            </div>
          </div>
        </div>
        <div class="hdiary">
          <div class="tsab1">
            <img src="img/lt.png" />
          </div>
          <!-- day1 -->
          <div class="days">
            <p class="day">DAY1</p>
            <div class="map">
              <img src="img/map.png" />
            </div>
            <div class="plan">
              <img src="img/po.png" width="300px"/>
            </div>
          </div>
          <div class="tsab2">
            <img src="img/gt.png" />
          </div>
        </div>
        <div>

        </div>
      </div>
      <!-- 네덜란드 -->
      <div class="diary">
        <img class="close-btn" src="img/x.png" />
        <div class="hdiary">
          <p class="nation">OSACA</p>
          <p class="title">홍길동의 네덜란드 시장투어</p>
        </div>
        <div class="hdiary">
        </div>
        <div>

        </div>
      </div>
      <!-- 스페인 -->
      <div class="diary">
        <img class="close-btn" src="img/x.png" />
        <div class="hdiary">
          <p class="nation">OSACA</p>
          <p class="title">홍길동의 스페인 축제투어</p>
        </div>
        <div class="hdiary">
        </div>
        <div>

        </div>
      </div>
      <!-- 미국 -->
      <div class="diary">
        <img class="close-btn" src="img/x.png" />
        <div class="hdiary">
          <p class="nation">OSACA</p>
          <p class="title">홍길동의 미국 힐링</p>
        </div>
        <div class="hdiary">
        </div>
        <div>

        </div>
      </div>
      <!-- 일본 -->
      <div class="diary">
        <img class="close-btn" src="img/x.png" />
        <div class="hdiary">
          <p class="nation">OSACA</p>
          <p class="title">홍길동의 일본 관광지투어</p>
        </div>
        <div class="hdiary">
        </div>
        <div>

        </div>
      </div>
      <!-- 캄보디아 -->
      <div class="diary">
        <img class="close-btn" src="img/x.png" />
        <div class="hdiary">
          <p class="nation">OSACA</p>
          <p class="title">홍길동의 캄보디아 와트투어</p>
        </div>
        <div class="hdiary">
        </div>
        <div>

        </div>
      </div>
      <!-- 중국 -->
      <div class="diary">
        <img class="close-btn" src="img/x.png" />
        <div class="hdiary">
          <p class="nation">OSACA</p>
          <p class="title">홍길동의 중국 관광지투어</p>
        </div>
        <div class="hdiary">
        </div>
        <div>

        </div>
      </div>
      <!-- 그리스 -->
      <div class="diary">
        <img class="close-btn" src="img/x.png" />
        <div class="hdiary">
          <p class="nation">OSACA</p>
          <p class="title">홍길동의 그리스 마을투어</p>
        </div>
        <div class="hdiary">
        </div>
        <div>

        </div>
      </div>
      <!-- 이탈리아 -->
      <div class="diary">
        <img class="close-btn" src="img/x.png" />
        <div class="hdiary">
          <p class="nation">OSACA</p>
          <p class="title">홍길동의 이탈리아 맛집투어</p>
        </div>
        <div class="hdiary">
        </div>
        <div>

        </div>
      </div>
      <!-- 터키 -->
      <div class="diary">
        <img class="close-btn" src="img/x.png" />
        <div class="hdiary">
          <p class="nation">OSACA</p>
          <p class="title">홍길동의 터키 스포츠투어</p>
        </div>
        <div class="hdiary">
        </div>
        <div>

        </div>
      </div>
    </div>

    <!-- 베스트 탑 10 플래너 -->
    <div class="pback">
      <div class="pbinner">
        <div class="planner">
          <p>Best 플래너 Top 10</p>
          <img src="img/fire.png" width="40px" height="40px">
        </div>
        <div class="cardback">
          <div class="sab1">
            <img src="img/lt.png" height="100px" />
          </div>
          <div class="cardpage">
            <!-- 제주도 -->
            <div class="card">
              <div class="position">1. 한국 제주도</div>
              <img src="img/jeju.jpg" />
              <div class="name">홍길동의 제주도 맛집투어</div>
              <div class="planInfo">
                <div class="category">#맛집투어</div>
              </div>
            </div>
            <!-- 네덜란드 -->
            <div class="card">
              <div class="position">2. 네덜란드 알크마르</div>
              <img src="img/cheese.jpg" />
              <div class="name">홍길동의 네덜란드 시장투어</div>
              <div class="planInfo">
                <div class="category">#시장투어</div>
              </div>
            </div>
            <!-- 스페인 -->
            <div class="card">
              <div class="position">3. 스페인 발렌시아주</div>
              <img src="img/tomato.jpg" />
              <div class="name">홍길동의 스페인 축제투어</div>
              <div class="planInfo">
                <div class="category">#축제투어</div>
              </div>
            </div>
            <!-- 미국 -->
            <div class="card">
              <div class="position">4. 미국 뉴욕</div>
              <img src="img/park.jpeg" />
              <div class="name">홍길동의 미국 힐링</div>
              <div class="planInfo">
                <div class="category">#힐링</div>
              </div>
            </div>
            <!-- 일본 -->
            <div class="card">
              <div class="position">5. 일본 오사카</div>
              <img src="img/japan.jpg" />
              <div class="name">홍길동의 일본 관광지투어</div>
              <div class="planInfo">
                <div class="category">#관광지투어</div>
              </div>
            </div> 
            <!-- 캄보디아 -->
            <div class="card">
              <div class="position">6. 캄보디아 시엠레아프</div>
              <img src="img/angkorwat.jpg" />
              <div class="name">홍길동의 캄보디아 와트투어</div>
              <div class="planInfo">
                <div class="category">#관광지투어</div>
              </div>
            </div>
            <!-- 중국 -->
            <div class="card">
              <div class="position">7. 중국 후난성</div>
              <img src="img/china.jpg" />
              <div class="name">홍길동의 중국 관광지투어</div>
              <div class="planInfo">
                <div class="category">#관광지투어</div>
              </div>
            </div>
            <!-- 그리스 -->
            <div class="card">
              <div class="position">8. 그리스 산토리니</div>
              <img src="img/santorini.jpg" />
              <div class="name">홍길동의 그리스 마을투어</div>
              <div class="planInfo">
                <div class="category">#관광지투어</div>
              </div>
            </div>
            <!-- 이탈리아 -->
            <div class="card">
              <div class="position">9. 이탈리아 베니스</div>
              <img src="img/pizza.jpg" />
              <div class="name">홍길동의 이탈리아 맛집투어</div>
              <div class="planInfo">
                <div class="category">#맛집투어</div>
              </div>
            </div>
            <!-- 터키 -->
            <div class="card">
              <div class="position">10. 터키 카파도키아</div>
              <img src="img/airballoon.jpg" />
              <div class="name">홍길동의 터키 스포츠투어</div>
              <div class="planInfo">
                <div class="category">#이색스포츠</div>
              </div>
            </div>
          </div>
          <div class="sab2">
            <img src="img/gt.png" height="100px" />
          </div>
        </div>
      </div>
    </div>

    <div class="mainp">
      <!-- 메인 검색창 -->
      <div class="psearch">
        <!-- 나라 선택 combobox -->
        <select id="combo">
          <option value="option1">국가</option>
          <option value="option2">대한민국</option>
          <option value="option3">일본</option>
          <option value="option3">미국</option>
          <option value="option3">중국</option>
        </select>
        <!-- # 검색 -->
        <div class="search-hash"><a>#</a>
          <input type="text" class="search-box">
          <button class="search-button"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
              viewBox="0 0 1664 1664">
              <path fill="#dc8b35"
                d="M1152 704q0-185-131.5-316.5T704 256T387.5 387.5T256 704t131.5 316.5T704 1152t316.5-131.5T1152 704m512 832q0 52-38 90t-90 38q-54 0-90-38l-343-342q-179 124-399 124q-143 0-273.5-55.5t-225-150t-150-225T0 704t55.5-273.5t150-225t225-150T704 0t273.5 55.5t225 150t150 225T1408 704q0 220-124 399l343 343q37 37 37 90">
              </path>
            </svg></button>
        </div>
      </div>

      <!-- 플래너 카드 -->
      <div class="pplanner">
        <div class="pcards">
          <!-- 첫번째 카드 -->
        <div class="splanner">
          <div class="pinfo">
            <img src="img/cheesec.png" />
            <div class="pfphotos"><img class="pfphoto" src="img/dprofile.png"/></div>
            <div class="position">김철수님의 일정 · 10박 11일</div>
            <div class="title">김철수의 네덜란드 시장투어</div>
            
            <div class="text">
              꾸덕이는 해삼이 달콤함과 혀로 섞여 미각이 열릴때 술 한잔 넘기니 살맛이 나서 기분이 전환된다.
              비바람속에 나를 넘겼고 태풍을 만나 배가 뒤집혀 해엄치듯 난 그속에서 벗어나려 둥둥 떠내려가 해볕에 놓여졌고.
            </div>
            <div class="cicon">
              <div class="ci">
                <img src="img/heartc.png" />
                <a>1.4K</a>
              </div>
              <div class="ci">
                <img src="img/bookmarkc.png" />
                <a>1.0K</a>
              </div>
            </div>
          </div>
        </div>
        <!-- 두번째 카드 -->
        <div class="splanner">
          <div class="pinfo">
            <img src="img/japanc.jpg" />
            <div class="pfphotos"><img class="pfphoto" src="img/dprofile.png"/></div>
            <div class="position">김철수님의 일정 · 무박 1일</div>
            <div class="title">김철수의 일본 관광지 투어</div>
            
            <div class="text">
              꾸덕이는 해삼이 달콤함과 혀로 섞여 미각이 열릴때 술 한잔 넘기니 살맛이 나서 기분이 전환된다.
              비바람속에 나를 넘겼고 태풍을 만나 배가 뒤집혀 해엄치듯 난 그속에서 벗어나려 둥둥 떠내려가 해볕에 놓여졌고.
            </div>
            <div class="cicon">
              <div class="ci">
                <img src="img/heartc.png" />
              <a>1.3K</a>
              </div>
              <div class="ci">
                <img src="img/bookmarkc.png" />
                <a>1.0K</a>
              </div>
            </div>
          </div>
        </div>
        <!-- 세번째 카드 -->
        <div class="splanner">
          <div class="pinfo">
            <img src="img/angkorwatc.avif" />
            <div class="pfphotos"><img class="pfphoto" src="img/dprofile.png"/></div>
            <div class="position">김철수님의 일정 · 15박 16일</div>
            <div class="title">김철수의 캄보디아 관광지투어</div>
            
            <div class="text">
              꾸덕이는 해삼이 달콤함과 혀로 섞여 미각이 열릴때 술 한잔 넘기니 살맛이 나서 기분이 전환된다.
              비바람속에 나를 넘겼고 태풍을 만나 배가 뒤집혀 해엄치듯 난 그속에서 벗어나려 둥둥 떠내려가 해볕에 놓여졌고.
            </div>
            <div class="cicon">
              <div class="ci">
                <img src="img/heartc.png" />
                <a>1.5K</a>
              </div>
              <div class="ci">
                <img src="img/bookmarkc.png" />
                <a>1.2K</a>
              </div>
          </div>
          </div>
        </div>
        <!-- 네번째 카드 -->
        <div class="splanner">
          <div class="pinfo">
            <img src="img/newyorkc.jpg" />
            <div class="pfphotos"><img class="pfphoto" src="img/dprofile.png"/></div>
            <div class="position">김철수님의 일정 · 1달</div>
            <div class="title">김철수의 미국 힐링</div>
            
            <div class="text">
              꾸덕이는 해삼이 달콤함과 혀로 섞여 미각이 열릴때 술 한잔 넘기니 살맛이 나서 기분이 전환된다.
              비바람속에 나를 넘겼고 태풍을 만나 배가 뒤집혀 해엄치듯 난 그속에서 벗어나려 둥둥 떠내려가 해볕에 놓여졌고.
            </div>
            <div class="cicon">
              <div class="ci">
                <img src="img/heartc.png" />
                <a>1.6K</a>
              </div>
              <div class="ci">
                <img src="img/bookmarkc.png" />
                <a>1.3K</a>
              </div>
            </div>
          </div>
        </div>
        <!-- 다섯번째 카드 -->
        <div class="splanner">
          <div class="pinfo">
            <img src="img/chinac.jpg" />
            <div class="pfphotos"><img class="pfphoto" src="img/dprofile.png"/></div>
            <div class="position">김철수님의 일정 · 7박 8일</div>
            <div class="title">김철수의 중국 허난성 관광지투어</div>
            
            <div class="text">
              꾸덕이는 해삼이 달콤함과 혀로 섞여 미각이 열릴때 술 한잔 넘기니 살맛이 나서 기분이 전환된다.
              비바람속에 나를 넘겼고 태풍을 만나 배가 뒤집혀 해엄치듯 난 그속에서 벗어나려 둥둥 떠내려가 해볕에 놓여졌고.
            </div>
            <div class="cicon">
              <div class="ci">
                <img src="img/heartc.png" />
                <a>1.4K</a>
              </div>
              <div class="ci">
                <img src="img/bookmarkc.png" />
                <a>1.2K</a>
              </div>
            </div>
          </div>
        </div>
        <!-- 여섯번째 카드 -->
        <div class="splanner">
          <div class="pinfo">
            <img src="img/jejuc.jpg" />
            <div class="pfphotos"><img class="pfphoto" src="img/dprofile.png"/></div>
            <div class="position">김철수님의 일정 · 4박 5일</div>
            <div class="title">김철수의 제주도 맛집투어</div>
            
            <div class="text">
              꾸덕이는 해삼이 달콤함과 혀로 섞여 미각이 열릴때 술 한잔 넘기니 살맛이 나서 기분이 전환된다.
              비바람속에 나를 넘겼고 태풍을 만나 배가 뒤집혀 해엄치듯 난 그속에서 벗어나려 둥둥 떠내려가 해볕에 놓여졌고.
            </div>
            <div class="cicon">
              <div class="ci">
                <img src="img/heartc.png" />
                <a>1.9K</a>
              </div>
              <div class="ci">
                <img src="img/bookmarkc.png" />
                <a>1.8K</a>
                </div>
            </div>
          </div>
        </div>
        <!-- 일곱번째 카드 -->
        <div class="splanner">
          <div class="pinfo">
            <img src="img/santorinic.jpg" />
            <div class="pfphotos"><img class="pfphoto" src="img/dprofile.png"/></div>
            <div class="position">김철수님의 일정 · 2달</div>
            <div class="title">김철수의 그리스 관광지투어</div>
            
            <div class="text">
              꾸덕이는 해삼이 달콤함과 혀로 섞여 미각이 열릴때 술 한잔 넘기니 살맛이 나서 기분이 전환된다.
              비바람속에 나를 넘겼고 태풍을 만나 배가 뒤집혀 해엄치듯 난 그속에서 벗어나려 둥둥 떠내려가 해볕에 놓여졌고.
            </div>
            <div class="cicon">
              <div class="ci">
                <img src="img/heartc.png" />
                <a>1.7K</a>
              </div>
              <div class="ci">
                <img src="img/bookmarkc.png" />
                <a>1.5K</a>
              </div>
            </div>
          </div>
        </div>
        <!-- 여덟번째 카드 -->
        <div class="splanner">
          <div class="pinfo">
            <img src="img/tomatoc.jpg" />
            <div class="pfphotos"><img class="pfphoto" src="img/dprofile.png"/></div>
            <div class="position">김철수님의 일정 · 19박 20일</div>
            <div class="title">김철수의 스페인 축제투어</div>
            
            <div class="text">
              꾸덕이는 해삼이 달콤함과 혀로 섞여 미각이 열릴때 술 한잔 넘기니 살맛이 나서 기분이 전환된다.
              비바람속에 나를 넘겼고 태풍을 만나 배가 뒤집혀 해엄치듯 난 그속에서 벗어나려 둥둥 떠내려가 해볕에 놓여졌고.
            </div>
            <div class="cicon">
              <div class="ci">
                <img src="img/heartc.png" />
                <a>1.6K</a>
              </div>
              <div class="ci">
                <img src="img/bookmarkc.png" />
                <a>1.4K</a>
              </div>
            </div>
          </div>
        </div>
        <!-- 아홉번째 카드 -->
        <div class="splanner">
          <div class="pinfo">
            <img src="img/pizzac.webp" />
            <div class="pfphotos"><img class="pfphoto" src="img/dprofile.png"/></div>
            <div class="position">김철수님의 일정 · 3달</div>
            <div class="title">김철수의 이탈리아 관광지투어</div>
            
            <div class="text">
              꾸덕이는 해삼이 달콤함과 혀로 섞여 미각이 열릴때 술 한잔 넘기니 살맛이 나서 기분이 전환된다.
              비바람속에 나를 넘겼고 태풍을 만나 배가 뒤집혀 해엄치듯 난 그속에서 벗어나려 둥둥 떠내려가 해볕에 놓여졌고.
            </div>
            <div class="cicon">
              <div class="ci">
                <img src="img/heartc.png" />
                <a>1.2K</a>
              </div>
              <div class="ci">
                <img src="img/bookmarkc.png" />
                <a>1.0K</a>
              </div>
            </div>
          </div>
        </div>
        <!-- 열번째 카드 -->
        <div class="splanner">
          <div class="pinfo">
            <img src="img/turkeyc.jpg" />
            <div class="pfphotos"><img class="pfphoto" src="img/dprofile.png"/></div>
            <div class="position">김철수님의 일정 · 25박 26일</div>
            <div class="title">김철수의 터키 먹거리투어</div>
            
            <div class="text">
              꾸덕이는 해삼이 달콤함과 혀로 섞여 미각이 열릴때 술 한잔 넘기니 살맛이 나서 기분이 전환된다.
              비바람속에 나를 넘겼고 태풍을 만나 배가 뒤집혀 해엄치듯 난 그속에서 벗어나려 둥둥 떠내려가 해볕에 놓여졌고.
            </div>
            <div class="cicon">
              <div class="ci">
                <img src="img/heartc.png" />
                <a>1.3K</a>
              </div>
              <div class="ci">
                <img src="img/bookmarkc.png" />
                <a>1.1K</a>
              </div>
            </div>
          </div>
        </div>
        </div>
        <div class="paging">
          <div class="pagination"></div>
        </div>
      </div>
    </div>
  </form>


<footer>
  <jsp:include page="footer.jsp" />
</footer>
</body>

</html>