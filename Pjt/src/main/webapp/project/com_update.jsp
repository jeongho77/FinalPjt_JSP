<%@page import="project.BoardDto"%>
<%@page import="java.util.ArrayList"%>
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
	int number = Integer.parseInt(request.getParameter("number"));
	BoardDao dao = new BoardDao();
	BoardDto dto = dao.Com_getOne(number);
%>
	<div>
        <form action="com_write_ok.jsp" method="get">
            <table class="table1" style="text-align:center; border: 1px solid #dddddd">
                <thead>
                    <tr>
                    <th colspan="2" style="background-color:#eeeeee; text-align: center;">게시판 글쓰기</th>
                    </tr>
                </thead>
                <tbody>
                	<tr>
                    <td><input type="text" class="form-control" value="<%=number %>" name="title" maxlength="50" style="width:500px;"></td>
                    </tr>
                    <tr>
                    <td><input type="text" class="form-control" value="<%=dto.getTitle() %>" name="title" maxlength="50" style="width:500px;"></td>
                    </tr>
                    <tr>
                    <td><input type="text" class="form-control" value="<%=dto.getContent() %>" name="content" maxlength="2048" style="width: 500px; height: 300px;"></textarea></td>
                    </tr>
                </tbody>
            </table>
            <input type="submit" class="btnSub" value="수정하기">
        </form>
    </div>
</body>
</html>