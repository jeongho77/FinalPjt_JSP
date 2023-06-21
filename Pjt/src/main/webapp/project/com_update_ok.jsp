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
	String rdoValue = request.getParameter("author");
	String writer = request.getParameter("writer");

	BoardDao dao = new BoardDao();
	BoardDto dto = new BoardDto(number, title, content, writer);
	
	 // 로그인 성공 시 다른 페이지로 이동
    System.out.println("등록 성공");
	
    if (rdoValue != null) {
        if (rdoValue.equals("community")) {
            dao.com_update(dto);	
            response.sendRedirect("board_page/community.jsp");
            
        } else if (rdoValue.equals("knowledge")) {
            dao.know_update(dto);
            response.sendRedirect("board_page/knowledge.jsp");
            
        } else {
            dao.qa_update(dto);
            response.sendRedirect("board_page/qna.jsp");
        }
    }

%>
</body>
</html>