<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Enumeration" %>
<% request.setCharacterEncoding("utf-8"); %>

<%
	Connection conn = null;
	Statement stmt = null;
	String user_id = request.getParameter("user_id");
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		//	db, jsp, html 모두 한글 인코딩을 넣어야 하며
		//	그래도 안되면 마지막으로 한글 인코딩 mydb?characterEncoding=utf8을 써줘야 함
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/planner?useSSL=false", "root", "1234");
//		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/myt?useSSL=false", "root", "1234");
		if(conn == null)
			throw new Exception("mydb 데이터베이스로 연결할 수 없습니다<br>");
		
		stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT USER_ID FROM MEMBER WHERE USER_ID = '" + user_id + "';");
		if(rs.next())
			out.println("1");	//	중복으로 사용불가 아이디
		else
			out.println("0");	//	중복 아니므로 사용 가능한 아이디
			
				
	} catch(Exception ex){
		out.println("DB Exception 발생 : " + ex);
	} finally {
		try {
			stmt.close();
			conn.close();
		} catch(Exception ex) {}
	}

%>