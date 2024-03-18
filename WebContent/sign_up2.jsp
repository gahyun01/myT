<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="utf-8">
	<title>회원가입</title>
</head>
<!-- apach version : 최종 배너, 생년월일 달력, 다음 우편번호 구현,  sign_up2.js는 그대로 사용 -->

<!-- 우편번호추가 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>

    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }

</script>


<!-- 구글폰트 다운 받아서 적용함 
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Nanum+Gothic&display=swap" rel="stylesheet">
-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="javascript/signup.js"></script>
<link rel="stylesheet" href="css/signup.css">

<body>
 <!--  상단배너 -->
 <jsp:include page="banner.jsp" />

	<!-- 확인 버튼 누르면 jsp 화면으로 넘어가는 법 -->
	<!--form action="sign_up2_result.jsp" onsubmit="return checkAll()"-->    
	<!-- 확인 버튼 누르면 servlet 화면으로 넘어가는 법 -->
	<!--form action="sign_up2" onsubmit="return checkAll()"-->    
	<form action="sign_up2_db.jsp" onsubmit="return checkAll()">    

	<!-- 본문 -->
	<div id="bg">
	<!-- 	
			1. 온라인회원정보	member	

		아이디	user_id	varchar	15	nn		PK
		패스워드	pwd	varchar	15	nn		
		국문 성	k_lastnm	varchar	30	nn		
		국문 이름	k_firstnm	varchar	30	nn		
		영문 성	e_lastnm	varchar	30	nn		
		영문 이름	e_firstnm	varchar	30	nn		
		성별 ( 주	gender	varchar	1	nn		
		생년월일	birth	varchar	8	nn		
		이메일주소	email	varchar	15			
		이메일주소2email2	varchar	15			
		연락처	phone	varchar	3	nn	
		연락처1	phone1	varchar	4	nn	
		연락처2	phone2	varchar	4	nn	
		우편번호	post	varchar	5	nn
		주소		addr	varchar	100	nn		
		가입일자(온라인)	reg_date	datetime				
    -->
    <div class="lpage">
        <div class="title">
          <a href="login.jsp" class="logins">
            <p>
              로그인
            </p>
          </a>
          <a href="sign_up2.jsp" class="signs">
            <p>
              회원가입
            </p>
          </a>
        </div>
        <div class="mains">
            <p>아이디</p>
            <div class="flex">
                <input type="text" name="user_id" id="user_id" size="30" maxlength="15" placeholder="6~15자 영문, 숫자의 조합" class="inputh" onfocus="clearText(this)">
                <button type="button" name="btn_id" class="btn" id="btn_id">중복확인</button>
            </div>
            <a class="msgs">중복 아이디입니다.</a>
            <p>비밀번호</p>	
            <div class="flex">
                <input type="password" name="pwd" id="pwd" size="30" maxlength="15"  placeholder="8~15자 영문, 숫자의 조합" class="inputall" onfocus="clearPasswd(this)">
            </div>
            <a class="msgs">비밀번호는 6자리 이상 15자리 이하로 입력해주세요.</a>
            <p>비밀번호 확인</p>
            <div class="flex">
                <input type="password" name="pwd2" id="pwd2" size="30" maxlength="15" class="inputall" onfocus="returnText()">
            </div>
            <a class="msgs">비밀번호가 일치하지 않습니다.</a>
            <div class="flex">
                <a class="alr">※ 국영문 성함은 반드시 본인의 실명을 입력해주시기 바랍니다.(추후 변경 불가)</a>
            </div>
            <div class="flex1">
                <div class="block">
                    <a class="name">국문 성</a>
                    <input type="text" name="k_lastnm" class="names" size="30" maxlength="30">
                </div>
                <div class="block">
                    <a class="name">국문 이름</a>
                <input type="text" name="k_firstnm" class="names" size="30" maxlength="30">
                </div>
            </div>
            <div class="flex1">
                <div class="block">
                    <a class="name">영문 성</a>
                <input type="text" name="e_lastnm" id="e_lastnm" size="30" maxlength="30" class="names">
                </div>
                <div class="block">
                    <a class="name">영문 이름</a>
                    <input type="text" name="e_firstnm" id="e_firstnm" size="30" maxlength="30"  class="names">
                </div>
            </div>
            <a class="msgs">2~30자리의 영문으로 입력하세요.</a>
            <p>성별</p>
            <div class="radio">
                <input type="radio" name="gender" value="1" style="vertical-align:middle; margin-right: 10px;" checked /><a>남</a>
                &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="gender" value="2" style="vertical-align:middle; margin-right: 10px;"/>여
            </div>
            <p>생년월일</p>
            <input type="text" name="birth" class="inputb" id="birth" size="8" maxlength="10" placeholder="생년월일 8자리" /> <a class="alr">ex) 19990101</a>
            <p>이메일주소</p>
            <div class="flex2">
                <input type="text" name="email" size="13" maxlength="15" class="inpute" > @
                <input type="text" name="email1" size="8" maxlength="15" class="inputee" disabled="true">
                <select name="email2" class="eng" onchange="setEmail(this.value)">
                    <option value="0">선택</option>
                    <option value="naver.com">naver.com</option>
                    <option value="hanmail.net">hanmail.net</option>
                    <option value="gmail.com">gmail.com</option>
                    <option value="1">직접입력</option>
                </select>
            </div>
            <p>연락처</p>
            <div class="flex2">
                <select name="phone0" class="phon">
                    <option>선택</option>
                    <option>010</option>
                    <option>011</option>
                    <option>016</option>
                    <option>017</option>
                    <option>019</option>
                    <option>02</option>
                    <option>031</option>
                    <option>032</option>
                    <option>033</option>
                    <option>041</option>
                    <option>042</option>
                    <option>043</option>
                    <option>051</option>
                    <option>052</option>
                    <option>053</option>
                    <option>054</option>
                    <option>061</option>
                    <option>062</option>
                    <option>063</option>
                    <option>064</option>
                </select>
                <a class="phonh">-</a> <input class="inputee" type="text" name="phone1" size="4" maxlength="4" id="phone1" style="text-align: center">
                <a class="phonh">-</a> <input class="inputee" type="text" name="phone2" size="4" maxlength="4" id="phone2" style="text-align: center">
            </div>
            <p>주소</p>
            <div class="flex2">
                <input type="text" name="post" class="addr" id="sample6_postcode" size="5" maxlength="5" style="text-align: center">
                <button type="button" name="btn_post" class="btn" style="width: 90px; height: 36px;" onclick="sample6_execDaumPostcode()" id="btn_post" >우편번호</button>
            </div>
            <div class="flex3">
                <input type="text" name="addr1" class="inputall" id="sample6_address" placeholder="주소" size="30" maxlength="50">
                <span id="guide" style="color:#999;display:none"></span>
            </div>
            <div class="flex">
                <input type="text" name="addr2" class="addr2" id="sample6_detailAddress" placeholder="상세주소" size="20" maxlength="30">
                <input type="text" name="addr3" class="addr3" id="sample6_extraAddress" placeholder="참고항목" size="20">
                <input type="hidden" name = "hid_dupe" id="hid_dupe" value="1" > 
                <input type="hidden" name = "hid_pwd" id="hid_pwd" value="0" > 
            </div>
            <div class="flex">
                <button type="submit" name="btn_submit" class="signbtn">회원가입</button>
            </div>
        </div>
    </div>
    
 <footer>
    <jsp:include page="footer.jsp" />
   </footer>
</body>
</html>