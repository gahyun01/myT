$(document).ready(function () {
  var timeoutId;

    // 로그인 시 베너 변경
    if (result === "SUCCESS") {
      $("body form .top header .login").css('display', 'none');
      $("body form .top header .profp").css('display', 'block');
    }

  $('body .top header .banner .btop a').mouseenter(function() {
      clearTimeout(timeoutId); // 기존에 예약된 setTimeout 제거
      timeoutId = setTimeout(function() {
          $('body .top header .banner .btop .sub, body .bnav').slideDown('slow');
          $('body .top').css('box-shadow', 'none');
      }, 100); // 100ms 후에 애니메이션 실행 (원하는 시간으로 조절 가능)
  });

  $('body .top header, body .bnav').mouseleave(function() {
    clearTimeout(timeoutId); // 기존에 예약된 setTimeout 제거
    timeoutId = setTimeout(function() {
        $('body .top header .banner .btop .sub, body .bnav').slideUp('slow', function() {
            // 애니메이션이 끝난 후 실행될 코드
            $('body .top').css('box-shadow', '0px 10px 10px 0px rgba(159, 159, 159, 0.2)');
        });
    }, 100); // 100ms 후에 애니메이션 실행 (원하는 시간으로 조절 가능)    
  });

  // 로그인 후 프로필 보임
  $(document).ready(function () {
    // 클릭한 요소가 .profp .prof일 때의 동작
    $(".profp .prof").click(function (e) {
        e.stopPropagation(); // 이벤트 버블링 방지
        $("body form .top header .profp .userp").css("display", "block");
        $(".profp .prof").css("box-shadow", "0px 10px 10px 0px rgba(159, 159, 159, 0.7)");
    });

    // 문서의 다른 영역을 클릭했을 때의 동작
    $(document).click(function () {
        $("body form .top header .profp .userp").css("display", "none");
        $(".profp .prof").css("box-shadow", "none");
    });
});
});