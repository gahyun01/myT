<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Enumeration" %>

<%
	// 		member;
	// 		+-----------+--------------+------+-----+---------+-------+
	// 		| Field     | Type         | Null | Key | Default | Extra |
	// 		+-----------+--------------+------+-----+---------+-------+
	// 0	| user_id   | varchar(15)  | NO   | PRI | NULL    |       |
	// 1	| pwd       | varchar(15)  | NO   |     | NULL    |       |
	// 3	| k_lastnm  | varchar(30)  | NO   |     | NULL    |       |
	// 4 	| k_firstnm | varchar(30)  | NO   |     | NULL    |       |
	// 5 	| e_lastnm  | varchar(30)  | NO   |     | NULL    |       |
	// 6 	| e_firstnm | varchar(30)  | NO   |     | NULL    |       |
	// 7 	| gender    | varchar(1)   | NO   |     | NULL    |       |
	// 8 	| birth     | varchar(8)   | NO   |     | NULL    |       |
	// 9 	| email     | varchar(15)  | YES  |     | NULL    |       |
	// 10 	| email2    | varchar(15)  | YES  |     | NULL    |       |
	// 11 	| phone     | varchar(3)   | NO   |     | NULL    |       |
	// 12	| phone1    | varchar(4)   | NO   |     | NULL    |       |
	// 13	| phone2    | varchar(4)   | NO   |     | NULL    |       |
	// 14  	| post      | varchar(5)   | YES  |     | NULL    |       |
	// 15 	| addr      | varchar(100) | NO   |     | NULL    |       |
	// 16 	| reg_date  | datetime     | YES  |     | NULL    |       |
	// +-----------+--------------+------+-----+---------+-------+

	//	0: userid123 
	//	1: password1234 
	//	2: password1234 
	//	3: 홍 
	//	4: 길동 
	//	5: Hong 
	//	6: Kildong 
	//	7: 2  1-남성, 2:여성 
	//	8: 2024-03-07 
	//	9: hogkildong 
	//	10: hanmail.net 
	//	11: 010 
	//	12: 1234 
	//	13: 5678 
	//	14: 05945 우편번호 
	//	15: 서울 동작구  
	//	16: 110-1105 
	//	17: (동작동, 이수푸르지오) 
	//	18: 들어오는 값은 안쓰고 reg_date를 셋팅해야 함
	request.setCharacterEncoding("utf-8");
	
	Enumeration<String> e = request.getParameterNames();
	//	table column명
	int i = 0;
	String id = "";

	String sql = "INSERT INTO MEMBER VALUES (";
	
	while (e.hasMoreElements()){
		String name = e.nextElement();
		String[] data = request.getParameterValues(name);

		if(i == 19)
			break;
		
		if(data != null){
			for(String eachdata : data){
				if(i == 0)
					id = eachdata;
				
				if(i == 2){	//	비번확인은 스킵
					continue;
				}
				else if(i == 5 || i == 6){	//	영문 성과 이름은 대문자로 저장 UPPER('eachdata')
					sql += "UPPER('" + eachdata + "'), ";
				}
				else if(i == 8){	//	생년월일 2021-01-01 -> 20210101로 변환
					sql += "'" + eachdata.substring(0, 4) + eachdata.substring(5, 7) + eachdata.substring(8, 10) + "', ";
				}
				else if(i == 15)	//	주소 '15 16 17',
					sql += "'" + eachdata;
				else if(i == 16)	//	주소 '15 16 17',
					sql += " " + eachdata;
				else if(i == 17)	//	주소 '15 16 17',
					sql += " " + eachdata + "', ";
				else if(i == 18)
					sql += "sysdate());";
				else
					sql += "'" + eachdata + "', ";
			}
		}
		i++;
	}
	//out.println("before" + sql + "<p>");

	Connection conn = null;
	Statement stmt = null;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		//	db, jsp, html 모두 한글 인코딩을 넣어야 하며
		//	그래도 안되면 마지막으로 한글 인코딩 mydb?characterEncoding=utf8을 써줘야 함
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/planner?characterEncoding=utf8&useSSL=false", "root", "1234");
//		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/myt?characterEncoding=utf8&useSSL=false", "root", "1234");
		if(conn == null)
			throw new Exception("mydb 데이터베이스로 연결할 수 없습니다<br>");
		
		stmt = conn.createStatement();
		int rowNum = stmt.executeUpdate(sql);

		if(rowNum < 1){
			throw new Exception("데이타를 DB에 입력할 수 없습니다<br>");
		}

		out.println("after" + sql + "<p>");
		response.sendRedirect("sign_up2_db2.jsp?id=" + id);

	} catch(Exception ex){
		out.println("DB Exception 발생 : " + ex);
	} finally {
		try {
			stmt.close();
			conn.close();
		} catch(Exception ex) {}
	}
	
%>