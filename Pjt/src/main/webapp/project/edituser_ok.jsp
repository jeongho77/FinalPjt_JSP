<%@page import="project.LoginDto"%>
<%@page import="project.LoginDao"%>
<%
/*===============================
작성자 : qbnyp
작성일 : 2023. 6. 21.
프로그램 기능 : 
==============================*/
%>


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
	String a = (String) session.getAttribute("user");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String nickname = request.getParameter("nickname");
	  
	LoginDao dao = new LoginDao();
	LoginDto dto = new LoginDto(name,password,nickname,email,a);
	dao.Update(dto);
	
	
%>
</body>
</html>