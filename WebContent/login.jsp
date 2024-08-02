<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>

<%
  String login = request.getParameter("login");
  String msg = "";

  String id = (String)session.getAttribute("ID");

  //  session에 아이디 저장이 되어 있으면 로그인 상태이므로 로그아웃 시킴
  if(id != null){
    //  session을 파기하고
    session.removeAttribute("LOGIN");
    session.removeAttribute("ID");
    session.removeAttribute("NAME");

    //   이전 페이지로 돌아감
    String referer = request.getHeader("Referer");
    response.sendRedirect(referer);
  }


  //  로그인 실패 메세지 셋팅하기
  if(login == null) //  로그인 처음 접속
    msg = "";
  else if(login.equals("x"))  // 로그인 실패
    msg = "아이디 또는 비밀번호 오류입니다.";
  


  //  쿠키에 저장된 아이디값 가져와서 셋팅하기
  // Cookie[] cookies = request.getCookies();
  // String cookie_id = "";
  // if(cookies == null)
  //   cookie_id = "";

  // for(Cookie cookie : cookies){
  //   //  getName() : 쿠키의 키를 가져옴 NAME, GENDER, AGE
  //   if(cookie.getName().equals("IDCHECK"))
  //     cookie_id = cookie.getValue();
  //}

%>

<html>

<head>
  <meta charset="utf-8">
  <title>myT</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
  <link rel="stylesheet" href="css/login.css">
  <script src="javascript/login.js"></script>

  <style>
    .login {
      text-align: center;

    }
  </style>
</head>

<body>
 <!--  상단배너 -->
 <jsp:include page="banner.jsp" />
 
 <form action="login2.jsp" onsubmit="return checkAll()" method="post">    
    <div class="lpage">
      <div class="title">
        <a href="login.jsp" class="login">
          <p>
            로그인
          </p>
        </a>
        <a href="sign_up2.jsp" class="sign">
          <p>
            회원가입
          </p>
        </a>
      </div>
      <div class="main">
        <div class="position">
          <!-- 아이디, 비밀번호 -->
          <div class="id">
            <img src="img/lperson.png" width="30px" height="30px" />
            <input type="text" name="user_id" placeholder="아이디" >
          </div>
          <div class="pwd">
            <img src="img/loglock.png" width="30px" height="30px" />
            <input type="password" name="pwd" placeholder="비밀번호" >
          </div>
          <!-- 아이디 저장하기, 로그인 상태 유지 -->
          <div class="check">
            <div class="idcheck">
              <img src="img/logcheck.png" width="18px" height="18px" />
              <p>아이디 저장하기</p>
            </div><div class="logcheck" value="0">
              <img src="img/logcheck.png" width="18px" height="18px" />
              <p>로그인 상태 유지</p>
            </div>
          </div>
          <p class="msg"><%= msg %></p>
          <input type="submit" value="로그인" class="loginbtn"/>
        </div>
      </div>
      <p class="find">아이디/비밀번호 찾기</p>
    </div>
  </form>

  <footer>
   <jsp:include page="footer.jsp" />
  </footer>
</body>
</html>