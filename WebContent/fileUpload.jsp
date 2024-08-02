<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!-- com. == 어디서 불러오는거임 ( 내꺼 X ) -->
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<%
	// 저장하는 폴더 위치
	String uploadPath=request.getRealPath("/upload");
	
	int size = 10*1024*1024; // 10MB
	String name="";
	String subject="";
	String filename1="";
	String origfilename1="";
	
	try{
		// 파일 업로드
		MultipartRequest multi=new MultipartRequest(request,
							uploadPath, // 업로드 폴더
							size, // 업로드 용량 제한
							"UTF-8",
				new DefaultFileRenamePolicy());

		name=multi.getParameter("name"); // 폼으로 전송된 name값을 얻어옴
		subject=multi.getParameter("subject"); // 폼으로 전송된 subject값을 얻어옴
		
		// 업로드된 파일명과 원본 파일명을 얻어옴
		Enumeration files=multi.getFileNames(); // 전부 다 가져옴
		
		String file1 =(String)files.nextElement();
		// 컴퓨터가 인식하는 파일명을 가져옴
		filename1=multi.getFilesystemName(file1); // 첫번째 업로드된 파일명
		// 사용자가 올린 파일명을 가져옴
		origfilename1= multi.getOriginalFileName(file1); // 첫번째 원본 파일명
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<html>
<body>
<form name="filecheck" action="fileCheck.jsp" method="post">
	<input type="hidden" name="name" value="<%=name%>">
	<input type="hidden" name="subject" value="<%=subject%>">
	<input type="hidden" name="filename1" value="<%=filename1%>">
	<input type="hidden" name="origfilename1" value="<%=origfilename1%>">
</form>
<a href="#" onclick="javascript:filecheck.submit()">업로드 확인 및 다운로드 페이지 이동</a>
</body>
</html>
