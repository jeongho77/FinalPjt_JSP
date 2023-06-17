<%@ page import="java.io.PrintWriter"%>
<%@ page import="project.LoginDao"%>
<%@ page import="project.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String email = request.getParameter("email");
    String pwd = request.getParameter("pwd");

    LoginDao dao = new LoginDao();
    LoginDto dto = dao.login(email, pwd);

    if (dto != null) {
        // 로그인 성공 시 다른 페이지로 이동
        response.sendRedirect("index.jsp");
    } else {
        // 로그인 실패 시 알림창을 띄워서 메시지 출력
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter outPrint = response.getWriter();
        out.println("<script>alert('회원 정보가 없습니다.');</script>");
        // 로그인 페이지에 머무르도록 리다이렉트하지 않음
    }
%>
</body>
</html>