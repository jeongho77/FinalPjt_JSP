<%@page import="project.BoardDto"%>
<%@page import="project.BoardDao"%>
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
	request.setCharacterEncoding("utf-8");

	int number = Integer.parseInt(request.getParameter("number"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");

	BoardDao dao = new BoardDao();
	BoardDto dto = new BoardDto(number, title, content);
	
	dao.com_update(dto); 
	
	response.sendRedirect("com_list.jsp");

%>
</body>
</html>