<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="project.LoginDao"%>
<%@ page import="project.LoginDto"%>

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
	String previousPage = request.getParameter("previousPage");
    LoginDao dao = new LoginDao();
    LoginDto dto = dao.login(email, pwd);
       

    if (dto != null) {
        // 로그인 성공 시 세션 넘겨준후 index로 감
        session.setAttribute("user", dto.getNickname());
        response.sendRedirect(previousPage);
       
    } else {
        // 로그인 실패 시 알림창을 띄워서 메시지 출력
        response.setContentType("text/html; charset=UTF-8"); // 컨텐츠 타입 설정
        PrintWriter outPrint = response.getWriter();
        outPrint.println("<script>alert('회원 정보가 없습니다.'); location.href='login.jsp';</script>");
        // 로그인 페이지로 리다이렉트
    } 
%>
</body>
</html>
