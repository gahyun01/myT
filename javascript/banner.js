$(document).ready(function () {
  var timeoutId;

  $('body .top header .banner .btop a').mouseenter(function() {
      clearTimeout(timeoutId); // 기존에 예약된 setTimeout 제거
      timeoutId = setTimeout(function() {
          $('body .top header .banner .btop .sub, body .bnav').slideDown('slow');
          $('body .top').css('box-shadow', 'none');
      }, 100); // 300ms 후에 애니메이션 실행 (원하는 시간으로 조절 가능)
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
});
