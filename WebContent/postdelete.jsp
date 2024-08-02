<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="pdb" class="myT.PostDB"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String rv_no = request.getParameter("rv_no");
String user_id = request.getParameter("user_id");
pdb.postDBdelete(rv_no);

response.sendRedirect("postlist.jsp");
%>
</body>
</html>