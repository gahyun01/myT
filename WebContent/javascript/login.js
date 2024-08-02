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
};

$(document).ready(function () {
   //  아이디 클릭시 이미지 변경
    $("body form .lpage .main .position .id .input").focus(function () {
       $("body form .lpage .main .position .id").find("img").css({ 'opacity': '1' });
    });
    $("body form .lpage .main .id").focusout(function () {
       $(this).find("img").css({ 'opacity': '0.5' });
    });

   //  비밀번호 클릭시 이미지 변경
    $("body form .lpage .main .position .pwd .input").focus(function () {
       $("body form .lpage .main .position .pwd").find("img").css({ 'opacity': '1' });
    });
    $("body form .lpage .main .pwd").focusout(function () {
       $(this).find("img").css({ 'opacity': '0.5' });
    });

    // 체크 버튼 클릭시
    var id = 'false';
    $("body form .lpage .main .check .idcheck").click(function () {
       if(id === 'false'){
        $(this).find("img").css({ 'opacity': '1' });
        $(this).find("img").attr("src", "img/logcheckc.png");
        id = 'true';
       }
       else{
        $(this).find("img").css({ 'opacity': '0.5' });
        $(this).find("img").attr("src", "img/logcheck.png");
        id = 'false';
      }
    });

    var stay = 'false';
    $("body form .lpage .main .check .logcheck").click(function () {
       if(stay === 'false'){
        $(this).find("img").css({ 'opacity': '1' });
        $(this).find("img").attr("src", "img/logcheckc.png");
        stay = 'true';
       }
       else{
        $(this).find("img").css({ 'opacity': '0.5' });
        $(this).find("img").attr("src", "img/logcheck.png");
        stay = 'false';
       }
    });    
});