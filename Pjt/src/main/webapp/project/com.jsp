<%@page import="project.BoardDao"%>
<%@page import="project.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="com.css">
</head>
<body>
<% 
int number = Integer.parseInt(request.getParameter("number"));

BoardDao dao = new BoardDao();
BoardDto dto = dao.Com_getOne(number);
%>

	<main class="container">
        <section class="main-list">
            <article class="main">
                <div class="main-title">
                    <h2><%= dto.getTitle() %></h2>
                </div>
                <hr>
                <div class="main-info">
                    <p class="author"><%= dto.getWriter() %></p>
                    <img src="../images/icon_view.png" alt="조회수">
                    <small><%= dto.getView_cnt() %></small>
                    <p class="date"><%= dto.getRegdate()%></p>
                </div>
                <div class="content">
                    <p><%= dto.getContent() %></p>
                </div>
                <div>
                    <button class="changeBtn" type="button">수정</button>
                    <button class="changeBtn" type="button">삭제</button>
                </div>
            </article>

            <article class="comments">
                <h3>댓글</h3>
                <div class="comment-form">
                    <input type="text" placeholder="댓글을 작성해주세요." class="comment-input">
                    <button type="submit" class="comment-submit">등록</button>
                </div>
                <ul class="comment-list">
                    <li>
                        <p class="comment-author">댓글 작성자</p>
                        <p class="comment-content">댓글 내용</p>
                        <p class="comment-date">작성일시</p>
    
                    </li>
                    <!-- 다른 댓글들 -->
                </ul>
            </article>
        </section>
    </main>
</body>
</html>