<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
</head>
<body>
<%@ page import="java.util.Enumeration" %>
<% request.setCharacterEncoding("utf-8"); %>

<h2> 회원가입 입력 내용</h2>
<%
	//	Enumeration e = request.getParameterNames();
	Enumeration<String> e = request.getParameterNames();

	String[] title = {"아이디", "비밀번호", "비밀번호 확인", "국문 성", "국문 이름", "영문 성", "영문 이름", "성별", "생년월일", "이메일주소", " ",  "연락처", " ", " ", "우편번호", "주소", " ", " ", " "};
	int i = 0;
//	out.println("title 길이 : " + title.length);

	while (e.hasMoreElements()){
		String name = e.nextElement();
		String[] data = request.getParameterValues(name);

		if(data != null){
			for(String eachdata : data)

				if(i==7){
					if(eachdata.equals("1"))
						out.println(title[i] + " 남성");
					else
						out.println(title[i] + " 여성");
				}
				else
					out.println(title[i] + " " + eachdata);

			i++;
		}
		out.println("<p>");
	}
%>
</body>
</html>