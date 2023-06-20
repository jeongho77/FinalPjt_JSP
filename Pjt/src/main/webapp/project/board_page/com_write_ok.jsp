<%@page import="java.io.PrintWriter"%>
<%@page import="project.BoardDto"%>
<%@page import="project.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.getParameter("utf-8");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String rdoValue = request.getParameter("author");
	System.out.println(title + content + rdoValue);
	
	BoardDao dao = new BoardDao();
	BoardDto dto = new BoardDto(title, content);
	
	
    // 로그인 성공 시 다른 페이지로 이동
    System.out.println("등록 성공");
	
	if (rdoValue.equals("community")) {
		dao.Com_Insert(dto);	
		response.sendRedirect("com_list.jsp");
	} else if (rdoValue.equals("knowledge")) {
		dao.Know_Insert(dto);
		response.sendRedirect("com_list.jsp");
	} else {
		dao.Qa_Insert(dto);
		response.sendRedirect("com_list.jsp");
	}
    
%>
</body>
</html>