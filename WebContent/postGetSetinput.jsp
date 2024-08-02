<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>    
    
<%@ page import="java.util.*"%>
<%@ page import="myT.PostGetSet"%>
<%@ page import="myT.PostDB"%>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%

String user_id = request.getParameter("user_id");
String fest_title = request.getParameter("fest_title");
String fest_rcont = request.getParameter("fest_rcont");

out.println("cont" + fest_rcont);

PostGetSet pgs = new PostGetSet();

pgs.setUser_id(user_id);
pgs.setFest_title(fest_title);
pgs.setFest_rcont(fest_rcont);

PostDB pdb = new PostDB(); // postDB, 그러니까 메소드가 있는 클래스의 객체를 만들었고.
pdb.PostDBinput(pgs); // 객체에서 직접 메소드를 호출했단 말이지.

response.sendRedirect("postlist.jsp");
%>
</body>
</html>