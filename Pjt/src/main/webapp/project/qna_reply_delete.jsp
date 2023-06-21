<%@page import="project.ReplyDao"%>
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
	int number = Integer.parseInt(request.getParameter("number"));
	int number2 =Integer.parseInt(request.getParameter("com_num"));
	ReplyDao dao = new ReplyDao();
	dao.Qa_Delete(number,number2);
	
	String previousPage = request.getHeader("referer");
	session.setAttribute("previousPage", previousPage);
	response.sendRedirect(previousPage);
%>
</body>
</html>