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
	
	
	LoginDao dao = new LoginDao();
	LoginDto dto = dao.getNumber(a); // getNumber 메서드의 반환값인 회원 번호를 가져옴
	int b = dto.getNumber();
	
	LoginDto Dto = new LoginDto(name, password, email, b);
	dao.Update(Dto);
	
	response.sendRedirect("index.jsp");
%>
</body>
</html>