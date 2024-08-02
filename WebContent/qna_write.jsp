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
    <!-- 글쓰기 페이지 -->
    <form>
        <!-- <div class="qna-write">
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
                </li> -->
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
</body>