<%
/*===============================
작성자 : qbnyp
작성일 : 2023. 6. 20.
프로그램 기능 : 
==============================*/
%>
 

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="project.*"%>
<%@page import="java.util.*"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%	
	String content = (String)request.getParameter("content");
	int number = Integer.parseInt(request.getParameter("number"));
	String writer = (String)request.getParameter("writer");
    ReplyDao dao = new ReplyDao();
	ReplyDto dto = new ReplyDto(number,writer,content);
    dao.Reply_Insert(dto);
	
    String previousPage = request.getHeader("referer");
    session.setAttribute("previousPage", previousPage);
    response.sendRedirect(previousPage);
%>
<body>

</body>
</html>