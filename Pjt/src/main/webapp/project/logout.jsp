<%
/*===============================
작성자 : qbnyp
작성일 : 2023. 6. 18.
프로그램 기능 : 
==============================*/
%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String previousPage = request.getHeader("referer");
    session.setAttribute("previousPage", previousPage);
%>

<%-- 로그아웃 처리 및 이전 페이지로 이동 --%>
<%
    session.invalidate();
    response.sendRedirect(previousPage);
%>
