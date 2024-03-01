<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%
    String id = (String) session.getAttribute("user_id");
    String result = "SUCCESS";
    
    session.setAttribute("user_id", id);
    session.setAttribute("result", result);

    response.sendRedirect("index.jsp?RESULT=" + result);
%>