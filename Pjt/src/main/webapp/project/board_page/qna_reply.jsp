<%@page import="project.ReplyDto"%>
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
	String content = (String)request.getParameter("content");
	int number = Integer.parseInt(request.getParameter("number"));
	String writer = (String)request.getParameter("writer");
    ReplyDao dao = new ReplyDao();
	ReplyDto dto = new ReplyDto(number,writer,content);
    dao.Qa_Reply_Insert(dto);
	
    String previousPage = request.getHeader("referer");
    session.setAttribute("previousPage", previousPage);
    response.sendRedirect(previousPage);
%>
</body>
</html>