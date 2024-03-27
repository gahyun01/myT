<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%
  String user_id = "";
  String btn_log = "로그인";
  String user_name = "";

  String login = (String)session.getAttribute("LOGIN");

  //  session이 null이면 로그아웃 또는 로그인 전인 상태임
  if( login != null ){
    //  로그인 상태인지 확인, x:로그인 실패, 1:로그인 성공
    if(login.equals("1")){
      //  배너에 아이디 셋팅 및 로그인 버튼을 로그아웃 버튼으로 변경
      user_id = (String)session.getAttribute("ID");
      user_name = (String)session.getAttribute("NAME");
    }
  }
%>
<html>

<head>
  <meta charset="utf-8">
  <title>myT</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link href="css/qna.css" rel="stylesheet" type="text/css">
<script src="javascript/qna.js"></script>

<body>
 <!--  상단배너 -->
 <jsp:include page="banner.jsp" />
 <input type='hidden' class='hidden' name='hidden_id' id='hidden_id' value='<%= user_id %>' >
  <form>
    <p class="title">Q&A</p>
    <!--  큐앤에이 목록 -->
    <div class="qna">
        <div class="tplus">
            <p class="msg">사이트 이용에 대해 궁금한 점이 있으신 경우 문의주세요.</p>
            <!-- 글쓰기 버튼 -->
            <p class="btn">글쓰기</p>
        </div>
        <!-- 큐앤에이 타이틀 -->
        <div class="qnat">
            <div class="dbstate">
                <span>답변상태</span>
            </div>
            <div class="dbtitle">
                <span>제목</span>
            </div>
            <div class="dbwriter">
                <span>작성자</span>
            </div>
            <div class="dbdate">
                <span>작성일</span>
            </div>
        </div>
        <!-- 큐앤에이 페이지 -->
        <div class="qnapage">
            <!-- 큐앤에이 댓글 -->
            <div class="bulletin">
                <div class="dbstate">
                    <!-- 미답변 | 답변완료 -->
                    <span>답변완료</span>
                </div>
                <div class="dbtitle">
                    <span>플래너 작성에 대한 질문</span>
                </div>
                <div class="dbwriter">
                    <span>gahyun010305</span>
                </div>
                <div class="dbdate">
                    <span>2024.03.18</span>
                </div>
            </div>
            <!-- 큐앤에이 답글 -->
            <div class="reply">
                <span class="dbtext">플래너 작성에 대한 질문플래너 작성에 대한 질문플래너 작성에 대한 질문플래너 작성에 대한 질문플래너 작성에 대한 질문플래너 작성에 대한 질문플래너 작성에 대한 질문플래너 작성에 대한 질문플래너 작성에 대한 질문플래너 작성에 대한 질문플래너 작성에 대한 질문플래너 작성에 대한 질문플래너 작성에 대한 질문</span>
                <div class="textre">
                    <div class="img">
                        <img src="img/reply.png" width="20px" height="20px">
                    </div>
                    <span class="dbreply">플래너 작성에 대한 질문플래너 작성에 대한 질문플래너 작성에 대한 질문플래너 작성에 대한 질문플래너 작성에 대한 질문플래너 작성에 대한 질문</span>
                </div>
            </div>
            <!-- 큐앤에이 댓글 -->
            <div class="bulletin">
                <div class="dbstate">
                    <!-- 미답변 | 답변완료 -->
                    <span>답변완료</span>
                </div>
                <div class="dbtitle">
                    <span>플래너 작성에 대한 질문</span>
                </div>
                <div class="dbwriter">
                    <span>gahyun010305</span>
                </div>
                <div class="dbdate">
                    <span>2024.03.18</span>
                </div>
            </div>
            <div class="bulletin">
                <div class="dbstate">
                    <!-- 미답변 | 답변완료 -->
                    <span>답변완료</span>
                </div>
                <div class="dbtitle">
                    <span>플래너 작성에 대한 질문</span>
                </div>
                <div class="dbwriter">
                    <span>gahyun010305</span>
                </div>
                <div class="dbdate">
                    <span>2024.03.18</span>
                </div>
            </div>
            <div class="bulletin">
                <div class="dbstate">
                    <!-- 미답변 | 답변완료 -->
                    <span>답변완료</span>
                </div>
                <div class="dbtitle">
                    <span>플래너 작성에 대한 질문</span>
                </div>
                <div class="dbwriter">
                    <span>gahyun010305</span>
                </div>
                <div class="dbdate">
                    <span>2024.03.18</span>
                </div>
            </div>
            <div class="bulletin">
                <div class="dbstate">
                    <!-- 미답변 | 답변완료 -->
                    <span>답변완료</span>
                </div>
                <div class="dbtitle">
                    <span>플래너 작성에 대한 질문</span>
                </div>
                <div class="dbwriter">
                    <span>gahyun010305</span>
                </div>
                <div class="dbdate">
                    <span>2024.03.18</span>
                </div>
            </div>
            <div class="bulletin">
                <div class="dbstate">
                    <!-- 미답변 | 답변완료 -->
                    <span>답변완료</span>
                </div>
                <div class="dbtitle">
                    <span>플래너 작성에 대한 질문</span>
                </div>
                <div class="dbwriter">
                    <span>gahyun010305</span>
                </div>
                <div class="dbdate">
                    <span>2024.03.18</span>
                </div>
            </div>
            <div class="bulletin">
                <div class="dbstate">
                    <!-- 미답변 | 답변완료 -->
                    <span>답변완료</span>
                </div>
                <div class="dbtitle">
                    <span>플래너 작성에 대한 질문</span>
                </div>
                <div class="dbwriter">
                    <span>gahyun010305</span>
                </div>
                <div class="dbdate">
                    <span>2024.03.18</span>
                </div>
            </div>
            <div class="bulletin">
                <div class="dbstate">
                    <!-- 미답변 | 답변완료 -->
                    <span>답변완료</span>
                </div>
                <div class="dbtitle">
                    <span>플래너 작성에 대한 질문</span>
                </div>
                <div class="dbwriter">
                    <span>gahyun010305</span>
                </div>
                <div class="dbdate">
                    <span>2024.03.18</span>
                </div>
            </div>
            <div class="bulletin">
                <div class="dbstate">
                    <!-- 미답변 | 답변완료 -->
                    <span>답변완료</span>
                </div>
                <div class="dbtitle">
                    <span>플래너 작성에 대한 질문</span>
                </div>
                <div class="dbwriter">
                    <span>gahyun010305</span>
                </div>
                <div class="dbdate">
                    <span>2024.03.18</span>
                </div>
            </div>
            <div class="bulletin">
                <div class="dbstate">
                    <!-- 미답변 | 답변완료 -->
                    <span>답변완료</span>
                </div>
                <div class="dbtitle">
                    <span>플래너 작성에 대한 질문</span>
                </div>
                <div class="dbwriter">
                    <span>gahyun010305</span>
                </div>
                <div class="dbdate">
                    <span>2024.03.18</span>
                </div>
            </div>
            <div class="bulletin">
                <div class="dbstate">
                    <!-- 미답변 | 답변완료 -->
                    <span>답변완료</span>
                </div>
                <div class="dbtitle">
                    <span>플래너 작성에 대한 질문</span>
                </div>
                <div class="dbwriter">
                    <span>gahyun010305</span>
                </div>
                <div class="dbdate">
                    <span>2024.03.18</span>
                </div>
            </div>
            <div class="bulletin">
                <div class="dbstate">
                    <!-- 미답변 | 답변완료 -->
                    <span>답변완료</span>
                </div>
                <div class="dbtitle">
                    <span>플래너 작성에 대한 질문</span>
                </div>
                <div class="dbwriter">
                    <span>gahyun010305</span>
                </div>
                <div class="dbdate">
                    <span>2024.03.18</span>
                </div>
            </div>
            <div class="bulletin">
                <div class="dbstate">
                    <!-- 미답변 | 답변완료 -->
                    <span>답변완료</span>
                </div>
                <div class="dbtitle">
                    <span>플래너 작성에 대한 질문</span>
                </div>
                <div class="dbwriter">
                    <span>gahyun010305</span>
                </div>
                <div class="dbdate">
                    <span>2024.03.18</span>
                </div>
            </div>
            <div class="bulletin">
                <div class="dbstate">
                    <!-- 미답변 | 답변완료 -->
                    <span>답변완료</span>
                </div>
                <div class="dbtitle">
                    <span>플래너 작성에 대한 질문</span>
                </div>
                <div class="dbwriter">
                    <span>gahyun010305</span>
                </div>
                <div class="dbdate">
                    <span>2024.03.18</span>
                </div>
            </div>
            <div class="bulletin">
                <div class="dbstate">
                    <!-- 미답변 | 답변완료 -->
                    <span>답변완료</span>
                </div>
                <div class="dbtitle">
                    <span>플래너 작성에 대한 질문</span>
                </div>
                <div class="dbwriter">
                    <span>gahyun010305</span>
                </div>
                <div class="dbdate">
                    <span>2024.03.18</span>
                </div>
            </div>
            <div class="bulletin">
                <div class="dbstate">
                    <!-- 미답변 | 답변완료 -->
                    <span>답변완료</span>
                </div>
                <div class="dbtitle">
                    <span>플래너 작성에 대한 질문</span>
                </div>
                <div class="dbwriter">
                    <span>gahyun010305</span>
                </div>
                <div class="dbdate">
                    <span>2024.03.18</span>
                </div>
            </div>
            <div class="bulletin">
                <div class="dbstate">
                    <!-- 미답변 | 답변완료 -->
                    <span>답변완료</span>
                </div>
                <div class="dbtitle">
                    <span>플래너 작성에 대한 질문</span>
                </div>
                <div class="dbwriter">
                    <span>gahyun010305</span>
                </div>
                <div class="dbdate">
                    <span>2024.03.18</span>
                </div>
            </div>
            <div class="bulletin">
                <div class="dbstate">
                    <!-- 미답변 | 답변완료 -->
                    <span>답변완료</span>
                </div>
                <div class="dbtitle">
                    <span>플래너 작성에 대한 질문</span>
                </div>
                <div class="dbwriter">
                    <span>gahyun010305</span>
                </div>
                <div class="dbdate">
                    <span>2024.03.18</span>
                </div>
            </div>
            <div class="bulletin">
                <div class="dbstate">
                    <!-- 미답변 | 답변완료 -->
                    <span>답변완료</span>
                </div>
                <div class="dbtitle">
                    <span>플래너 작성에 대한 질문</span>
                </div>
                <div class="dbwriter">
                    <span>gahyun010305</span>
                </div>
                <div class="dbdate">
                    <span>2024.03.18</span>
                </div>
            </div>
        </div>
        <div class="paging">
            <div class="pagination"></div>
        </div>
    </div>
    <!-- 글쓰기 페이지 -->
    <div class="qna-write">
            <ul class="write">
                <li>
                    <label for="qnaType">분류</label>
                    <select id="qnaType" name="qnaType">
                        <option value="">문의분류를 선택하세요</option>
                        <option value="1">플래너</option>
                        <option value="2">예약</option>
                        <option value="3">예약취소</option>
                        <option value="4">다이어리</option>
                    </select>
                </li>
                <!-- <li><label for="subject">제목</label><input type="text" name="subject" id="subject"></li>
                <li>
                    <p class="tit">휴대전화</p>
                    <ul class="form-tel">
                        <li>
                            <select name="cp1">
                                <option value="010">010</option>
                                <option value="011">011</option>
                                <option value="016">016</option>
                                <option value="017">017</option>
                            </select>
                        </li>
                        <li><input type="text" name="cp2" maxlength="4" title="휴대전화 앞자리" value="2516"></li>
                        <li><input type="text" name="cp3" maxlength="4" title="휴대전화 뒷자리" value="1193"></li>
                    </ul>
                    <span class="sms">※ 답변이 등록되면 카카오톡으로 알려드립니다.</span>

                    <span class="cs-form radio">
                        <input type="radio" name="sms" id="smsY" checked="checked">
                        <label for="smsY" id="smsY_label">예</label>
                    </span>
                    <span class="cs-form radio">
                        <input type="radio" name="sms" id="smsN">
                        <label for="smsN" id="smsN_label">아니오</label>
                    </span>
                </li>
                <li>
                    <label for="file">파일첨부1</label>
                    <div class="cs_file">
                        <input type="file" class="input_file" name="file1" id="file1">
                        <div class="file_name"></div>
                        <a href="javascript:">첨부파일</a>
                    </div>
                </li>
                <li>
                    <label for="file2">파일첨부2</label>
                    <div class="cs_file">
                        <input type="file" class="input_file" name="file2" id="file2">
                        <div class="file_name"></div>
                        <a href="javascript:">첨부파일</a>
                    </div>
                </li>
                <li><label for="txt">내용</label><textarea cols="10" rows="5" id="txt" name="txt" placeholder="항상 친절하게 응대해 드리겠습니다!
지금 응대하고 있는 소녀나라 CS직원은 고객여러분의 가족중 한사람일 수 있습니다.
폭언,인격침해등은 자제해주시기 바랍니다♥"></textarea></li> -->
            </ul>
    </div>
  </form>

<footer>
  <jsp:include page="footer.jsp" />
</footer>
</body>

</html>