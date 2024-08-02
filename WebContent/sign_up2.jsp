<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
	<meta charset="utf-8">
	<title>회원가입</title>
	<link rel="stylesheet" href="css/sign_up2.css">
</head>
<!-- apach version : 최종 배너, 생년월일 달력, 다음 우편번호 구현,  sign_up2.js는 그대로 사용 -->

<style>
 		
	#box{
		width: 800px;			
		height: 1040px;
		margin: 50px auto;
		border: 2px lightgray solid;
		border-radius: 20px;
	    background-color: white;
	    box-shadow: 0px 0px 5px rgba(90, 90, 90, 0.7);
	}
	.title1{
		font-size: 30px;
		margin: 50px auto;
 		text-align: center;
 	}

	table tr td{
		font-size: 16px;
		font-weight: bold;
 	}
	
	input{
		height: 35px;
		font-size: 16px;
		color: grey;
		padding-left: 10px;
		border-radius: 3px;
		border-width: 1px;

	}

	.input2{
		font-size: 15px;		
		padding-left: 0px;
		text-align: center
	}
	select{
		width: 93px;
 		height: 40px;
		text-align: center

	}

	#msg{
		font-size: 14px; 
		color: red;
	}

</style>

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
<script src="javascript/sign_up2.js"></script>
<link href="css/default.css" rel="stylesheet" type="text/css">

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
 		<div class="title1">
			회원가입
		</div>
		<div id="box">
		<table border="0" cellpadding="9"align="center" style="margin-top: 45px">
			<tr>
				<td><label>아이디</label></td> 	
				<td><input type="text" name="user_id" id="user_id" size="30" maxlength="15" value="6~15자 영문, 숫자의 조합" class="engnum" onfocus="clearText(this)">
					<button type="button" name="btn_id" class="btn" id="btn_id" style="width: 113px; height: 37px; font-size: 14px;" >중복확인</button>
					
				</td>
			</tr>
			<tr>
				<td><label>비밀번호</label></td> 	
				<td><input type="text" name="pwd" id="pwd" size="30" maxlength="15"  value="8~15자 영문, 숫자의 조합" class="engnum" onfocus="clearPasswd(this)"> </td> 
			</tr>
			<tr>
				<td><label>비밀번호 확인</label></td> 	
				<td><input type="password" name="pwd2" id="pwd2" size="30" maxlength="15" class="engnum" onfocus="returnText()"> 
					<button type="button" name="btn_pwd" class="btn" style="width: 113px; height: 37px; font-size: 14px;" onclick="checkPasswd(this)">동일확인</button> 
				</td> 
			</tr>
				<tr>
				<td colspan="2" id="msg">※ 국영문 성함은 반드시 본인의 실명을 입력해주시기 바랍니다.(추후 변경 불가)</td>
			</tr>
			<tr>
				<td class="title2 "><label>국문 성</label></td> 	
				<td><input type="text" name="k_lastnm" class="kor_in" size="30" maxlength="30"></td>
			</tr>
			<tr>
				<td><label>국문 이름</label></td> 	
				<td><input type="text" name="k_firstnm" class="kor_in" size="30" maxlength="30"></td>
		</tr>
			<tr>
				<td><label>영문 성</label></td> 	
				<td><input type="text" name="e_lastnm" size="30" maxlength="30" class="eng"></td>
			</tr>
			<tr>
				<td><label>영문 이름</label></td> 	
				<td><input type="text" name="e_firstnm" size="30" maxlength="30"  class="eng"></td>
			</tr>
			<tr>
				<td><label>성별</label></td> 	
				<td><input type="radio" name="gender" value="1" style="vertical-align:middle; margin-right: 10px;" checked />남
					&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="gender" value="2" style="vertical-align:middle; margin-right: 10px;"/>여</td>
			</tr>
			<tr>
				<td><label>생년월일</label></td> 
				<td><input type="text" name="birth" class="input2" id="birth" size="8" maxlength="8" style="text-align: center;" /> ex) 19990101
				</td>
			</tr>
			<tr>
				<td><label>이메일주소</label></td> 	
				<td><input type="text" name="email" size="13" maxlength="15" class="engnum" > @
					<input type="text" name="email1" size="8" maxlength="15"  disabled="true">
					<select name="email2" style="width: 113px"  class="eng" onchange="setEmail(this.value)">
						<option value="0">선택</option>
						<option value="naver.com">naver.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="gmail.com">gmail.com</option>
						<option value="1">직접입력</option>
					</select>
				</td>
			</tr>
			<tr>
				<!-- 지역번호
					서울	인천	대전	부산	울산	대구	광주	제주
					02	032	042	051	052	053	062	064
					경기	강원	충남	충북	경북	경남	전남	전북
					031	033	041	043	054	055	061	063
					-->
				<td><label>연락처</td> 	
				<td><select name="phone0">
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
				 	- <input class="input2" type="text" name="phone1" size="4" maxlength="4" id="phone1">
					- <input class="input2" type="text" name="phone2" size="4" maxlength="4" id="phone2" style="text-align: center"></td>
			</tr>
 			<tr>
				<td><label>주소</label></td> 	
				<td><input type="text" name="post" class="input2" id="sample6_postcode" size="5" maxlength="5" style="text-align: center">
						<button type="button" name="btn_post" class="btn" style="width: 90px; height: 36px;" onclick="sample6_execDaumPostcode()" id="btn_post" >우편번호</button></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="text" name="addr1" id="sample6_address" placeholder="주소" size="30" maxlength="50">
					<span id="guide" style="color:#999;display:none"></span>
				</td>
			</tr>
			<tr>
				<td></td>
				<td><input type="text" name="addr2" id="sample6_detailAddress" placeholder="상세주소" size="20" maxlength="30">
					<input type="text" name="addr3" class="input2" id="sample6_extraAddress" placeholder="참고항목" size="20">
					<input type="hidden" name = "hid_dupe" id="hid_dupe" value="1" > 
					<input type="hidden" name = "hid_pwd" id="hid_pwd" value="0" > 
				</td>
			</tr>
			<tr>
				<!--td colspan="2" align="center"><br><button type="submit" name="btn_submit" class="btn" 
					style="width: 550px; height: 40px;" onclick="checkAll()">확 인</button-->
				<td colspan="2" align="center"><br><button type="submit" name="btn_submit" class="btn" 
					style="width: 550px; height: 40px;">확 인</button>
				</td> 	
			</tr>
		</table>
	</div>
	</div>
</form>
<footer>
 <jsp:include page="footer.jsp" />
</footer>

</body>
</html>