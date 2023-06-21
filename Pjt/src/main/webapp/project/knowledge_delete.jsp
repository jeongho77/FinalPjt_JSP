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
	int number = Integer.parseInt(request.getParameter("number"));  
	BoardDao dao = new BoardDao();        
	dao.Know_Delete(number);
	
	  
	response.sendRedirect("board_page/knowledge.jsp");
%>
</body>
</html>