<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int result = (int)request.getAttribute("RESULT");

%>
<p><%= result %>건 입력성공</p>

</body>
</html>