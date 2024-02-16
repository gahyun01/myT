function pass() {
  var pwd = document.twin.
    if((pass_len <= 6) || (pass_len > 15)) {
      document.getElementById('same').innerHTML = '비밀번호는 6자리 이상 15자리 이하로 입력해주세요.';
}
if ($('#pwd').val() == $('#pwd1').val()) {
  $('#pwConfirm').text('비밀번호 일치').css('color', 'green')
} else {
  $('#pwConfirm').text('비밀번호 불일치').css('color', 'red')
}
}