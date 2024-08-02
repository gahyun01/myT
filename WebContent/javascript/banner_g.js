$(document).ready(function () {
  var timeoutId; // setTimeout의 반환값을 저장하기 위한 변수

  // 로그인 성공했을 때
  if ($('#hidden_id').val() != "") {
    $("body form .top header .login").css('display', 'none');
    $("body form .top header .profp").css('display', 'block');
  }

  // 로그인 후 프로필 보임
  // 클릭한 요소가 .profp .prof일 때의 동작
  $(".profp .prof").click(function (e) {
    e.stopPropagation(); // 이벤트 버블링 방지
    $("body form .top header .profp .userp").css("display", "block");
    $(".profp .prof").css("box-shadow", "0 0 20px rgba(90, 90, 90, 0.7)");
  });

  // 문서의 다른 영역을 클릭했을 때의 동작
  $(document).click(function () {
    $("body form .top header .profp .userp").css("display", "none");
    $(".profp .prof").css("box-shadow", "none");
  });


  // 베너 메뉴
  $('body .top header .banner .btop').mouseenter(function() {
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

  // 날씨 정보 가져오기
  const API_KEY = 'da5b483e19e5c6d01b41200187412d35';
});