function checkAll(){
	//	아이디와 비번을 입력했는지 확인
	var str;
	var len;
	var ok = true;
	var warning = "";

	var p = document.getElementsByName('user_id');
	str = p[0].value;
	len = p[0].value.length;

	var msg = document.querySelector('.msg');		/* 선택자를 통해서 1개만 */

	if(len == 0 || len < 6 || len > 15){
		ok = false;
		warning = "6~15자리의 아이디를 입력하세요";
		msg.textContent = warning;
		msg.style.display = "block"
		p[0].focus();
		p[0].select();
		return ok;
	}

	var p = document.getElementsByName('pwd');
	str = p[0].value;
	len = p[0].value.length;

	if(len == 0 || len < 8 || len > 15){
		ok = false;
		warning = "8~15자리의 비밀번호로 입력하세요";
		msg.textContent = warning;
		p[0].focus();
		p[0].select();
		return ok;
	}
	return ok;				
}

// 쿠키를 설정하는 함수
function setCookie(name, value, days) {
   var expires = "";
   if (days) {
       var date = new Date();
       date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));  // 기간(days) 설정
       expires = "; expires=" + date.toUTCString();
   }
   document.cookie = name + "=" + (value || "") + expires + "; path=/";
}

// 쿠키를 읽는 함수
function getCookie(name) {
   var nameEQ = name + "=";
   var ca = document.cookie.split(';');
   for (var i = 0; i < ca.length; i++) {
       var c = ca[i].trim();
       if (c.indexOf(nameEQ) === 0) return c.substring(nameEQ.length, c.length);
   }
   return null;
}

// 쿠키를 삭제하는 함수
function eraseCookie(name) {
   document.cookie = name + "=; Max-Age=-99999999; path=/";
}

// 초기 상태 읽기
var id = getCookie('idChecked') === 'true' ? 'true' : 'false';
var stay = getCookie('stayChecked') === 'true' ? 'true' : 'false';

// 초기 이미지 설정 (쿠키 상태에 맞게)
if (id === 'true') {
   $("body form .lpage .main .check .idcheck img").css({ 'opacity': '1' });
   $("body form .lpage .main .check .idcheck img").attr("src", logcheckcImg);
}

if (stay === 'true') {
   $("body form .lpage .main .check .logcheck img").css({ 'opacity': '1' });
   $("body form .lpage .main .check .logcheck img").attr("src", logcheckcImg);
}

// 아이디 저장 체크 버튼 클릭시
$("body form .lpage .main .check .idcheck").click(function () {
   if (id === 'false') {
       $(this).find("img").css({ 'opacity': '1' });
       $(this).find("img").attr("src", logcheckcImg);
       id = 'true';
       setCookie('idChecked', 'true', 7);  // 7일 동안 쿠키 유지
   } else {
       $(this).find("img").css({ 'opacity': '0.5' });
       $(this).find("img").attr("src", logcheckImg);
       id = 'false';
       eraseCookie('idChecked');
   }
});

// 로그인 상태 유지 체크 버튼 클릭시
$("body form .lpage .main .check .logcheck").click(function () {
   if (stay === 'false') {
       $(this).find("img").css({ 'opacity': '1' });
       $(this).find("img").attr("src", logcheckcImg);
       stay = 'true';
       setCookie('stayChecked', 'true', 7);  // 7일 동안 쿠키 유지
   } else {
       $(this).find("img").css({ 'opacity': '0.5' });
       $(this).find("img").attr("src", logcheckImg);
       stay = 'false';
       eraseCookie('stayChecked');
   }
});

$(document).ready(function () {
   // 아이디 클릭시 이미지 변경
   $("body form .lpage .main .id").click(function () {
      $(this).find("img").css({ 'opacity': '1' });
   });
   $("body form .lpage .main .id").focusout(function () {
      $(this).find("img").css({ 'opacity': '0.5' });
   });

   // 비밀번호 클릭시 이미지 변경
   $("body form .lpage .main .pwd").click(function () {
      $(this).find("img").css({ 'opacity': '1' });
   });
   $("body form .lpage .main .pwd").focusout(function () {
      $(this).find("img").css({ 'opacity': '0.5' });
   });
});