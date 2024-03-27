$(document).ready(function () {

  var msgs = document.querySelector('.msgs');

  // 아이디 확인
  $('#id').focusout(function () {
    var id = $('#user_id').val();
    if (id.length < 6 || id.length > 15) {
      msgs[0].css('opacity', '1');
      $('#user_id').focus();
    }
    else{
      msgs[0].css('opacity', '0');
    }
  });

  // 비밀번호 확인
  $('#pwd').focusout(function () {
    var pwd = $('#pwd').val();
    if (pwd.length < 6 || pwd.length > 15) {
      msgs[1].css('opacity', '1');
      $('#pwd').val('');
      $('#pwd').focus();
    }
    else{
      msgs[1].css('opacity', '0');
    }
  });

  // 비밀번호 확인
  $('#pwd2').focusout(function () {
    var pwd = $('#pwd').val();
    var pwd1 = $('#pwd2').val();
    if (pwd != pwd2) {
      msgs[2].css('opacity', '1');
      $('#pwd2').val('');
      $('#pwd2').focus();
    }
    else{
      msgs[2].css('opacity', '0');
    }
  });

  // 영문 성, 이름 확인 ( 대소문자만 가능 )
  $('#e_lastnm').focusout(function () {
    var name = $('#e_lastnm').val();
    if (name.length < 2 || name.length > 30 || !/^[a-zA-Z]+$/.test(name)) {
      msgs[3].style.opacity = '1';
      $('#e_lastnm').focus();
    }
    else{
      msgs[3].style.opacity = '0';
    }
  });

  $('#e_firstnm').focusout(function () {
    var name = $('#e_firstnm').val();
    if (name.length < 2 || name.length > 30 || !/^[a-zA-Z]+$/.test(name)) {
      msgs[3].style.opacity = '1';
      $('#e_firstnm').focus();
    }
    else{
      msgs[3].style.opacity = '0';
    }
  });
});