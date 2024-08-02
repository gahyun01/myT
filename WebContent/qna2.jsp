<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<%
    request.setCharacterEncoding("UTF-8");
    Connection conn = null;
    Statement stmt = null;
%>

<head>
    <meta charset="utf-8">
    <title>myT</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link href="css/qna.css" rel="stylesheet" type="text/css">
<script src="javascript/qna.js"></script>

<body>
    <form>
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
                <!-- 큐앤에이 댓글 디비에서 불러와서 만들기 -->
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
    </form>
</body>