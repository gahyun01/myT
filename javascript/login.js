function AllCheck() {
    var id = document.getElementsByName('user_id');
    var pwd = document.getElementsByName('pwd');
    
    if( id[0].value.length < 6 || id[0].value.length > 15 ){
        $("body form .lpage .main .position .error").css({ 'opacity': '1' });
        return false;
    }
    else{
        if( pwd[0].value.length < 8 || pwd[0].value.length > 15 ){
            $("body form .lpage .main .position .error").css({ 'opacity': '1' });
            return false;
        }
        else{
            return true;
        }
    }
};

$(document).ready(function () {
    // 아이디 클릭시 이미지 변경
    $("body form .lpage .main .id input").focus(function () {
        $(this).closest(".id").find("img").css({ 'opacity': '1' });
    });
    
    $("body form .lpage .main .id input").focusout(function () {
        $(this).closest(".id").find("img").css({ 'opacity': '0.5' });
    });

    // 비밀번호 클릭시 이미지 변경
    $('input[type="password"]').focus(function () {
        $(this).val('');
      });
    $("body form .lpage .main .pwd input").focus(function () {
        $(this).closest(".pwd").find("img").css({ 'opacity': '1' });
    });
    
    $("body form .lpage .main .pwd input").focusout(function () {
        $(this).closest(".pwd").find("img").css({ 'opacity': '0.5' });
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

    var pwd = 'false';
    $("body form .lpage .main .check .logcheck").click(function () {
       if(pwd === 'false'){
        $(this).find("img").css({ 'opacity': '1' });
        $(this).find("img").attr("src", "img/logcheckc.png");
        pwd = 'true';
       }
       else{
        $(this).find("img").css({ 'opacity': '0.5' });
        $(this).find("img").attr("src", "img/logcheck.png");
        pwd = 'false';
       }
    });    
});