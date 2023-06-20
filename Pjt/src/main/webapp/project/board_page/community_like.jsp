<%@page import="project.BoardDao"%>
<%
/*===============================
작성자 : qbnyp
작성일 : 2023. 6. 20.
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
	<% int number = Integer.parseInt(request.getParameter("number")); 
	   BoardDao dao = new BoardDao();
	   dao.com_like(number);
	   
	    String previousPage = request.getHeader("referer");
	    session.setAttribute("previousPage", previousPage);
	    response.sendRedirect(previousPage);
	
	%>
</body>
</html>