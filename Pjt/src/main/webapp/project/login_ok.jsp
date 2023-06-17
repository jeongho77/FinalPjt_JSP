<%@page import="project.LoginDao"%>
<%@page import="project.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.getParameter("utf-8");
	String email = request.getParameter("email");
	String pwd = request.getParameter("pwd");
	
	LoginDao dao = new LoginDao();
	LoginDto dto = dao.login(email, pwd);
%>
</body>
</html>