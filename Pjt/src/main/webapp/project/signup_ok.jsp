<%@page import="project.LoginDao"%>
<%@page import="project.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% 
	request.setCharacterEncoding("utf-8");

	String email = request.getParameter("email");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	String nickname = request.getParameter("nickname");
	
	
	LoginDto dto = new LoginDto(email, name, pwd, nickname);
	
	LoginDao dao = new LoginDao();
	
	dao.insertLogin(dto);
	
	//회원가입 성공시 로그인창으로 이동
	response.sendRedirect("index.jsp");
%>
</body>
</html>