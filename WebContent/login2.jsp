<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<%
	//	login.jsp에서 로그인 버튼(submit)을 누르면 호출되는 페이지
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("user_id");
	String pwd = request.getParameter("pwd");

//	String idcheck = request.getParameter("idcheck");
//	response.addCookie(new Cookie("IDCHECK", idcheck));
//	아이디 저장 idcheck = 1이면 쿠키에 아이디를 저장해놔야 한다
//	if(idcheck.equals("1")){
//		response.addCookie(new Cookie("ID", id));
//	}

	//	DB 접숙해서 아이디 비번이 맞는지 확인
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
		ResultSet rs = stmt.executeQuery("SELECT PWD, K_LASTNM, K_FIRSTNM FROM MEMBER WHERE USER_ID = '" + id + "';");
		
		//	해당 id에 대한 정보가 있는 경우(회원)
		if(rs.next()){
			String db_pwd = rs.getString("pwd");
			String db_name = rs.getString("k_lastnm") + rs.getString("k_firstnm");;
			
			//	비번이 같을 경우
			if(db_pwd.equals(pwd)){
				session.setAttribute("ID", id);
				session.setAttribute("NAME", db_name);
				session.setAttribute("LOGIN", "1");	//	LOGIN 정보 1 :성공 x:실패

				response.sendRedirect("index.jsp?login=1");
			}
			//	비번이 틀릴 경우
			else
				response.sendRedirect("login.jsp?login=x");
		}
		else //	해당 id에 대한 정보가 없는 비회원의 경우
			response.sendRedirect("login.jsp?login=x");

	} catch(Exception ex){
		out.println("DB Exception 발생 : " + ex);
	} finally {
		try {
			stmt.close();
			conn.close();
		} catch(Exception ex) {}
	}
	

/*
	if(id.equals(pwd)){
		login = "1";
		
		

		//	session이 잘 되었는지 파일로 확인
		//	session은 type이 없으므로 getAttribute로 가져올 때는 반드시 타입변환을 해줘야 함
		//	ex)String id = (String)session.getAttribute("ID");
		//	setAttribute 할 때는 타입 지정할 필요없이 그냥 넣으면 됨
		session.setAttribute("ID", id);
		session.setAttribute("PWD", pwd);
		session.setAttribute("LOGIN", "1");

		//	session에만 저장하고 아래 화일에 저장할 필요없음(디버깅용으로 저장했었음)
		// PrintWriter writer = null;
		// try{
		// 	String filePath = application.getRealPath("/WEB-INF/" + id + ".txt");
		// 	writer = new PrintWriter(filePath);
		// 	writer.println("아이디: " + id);
		// 	writer.println("비밀번호: " + pwd);
		// 	writer.println("로그인 상태: 1");

		// }catch(IOException ioe){
		// 	id = null;
		// } finally{
		// 	try{
		// 		writer.close();
		// 	}catch(Exception e){

		// 	}
		// }
		response.sendRedirect("index.jsp?login=" + login);
	}
	else{
		response.sendRedirect("login.jsp?login=x");
	}
*/
%>