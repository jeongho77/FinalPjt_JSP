<%@page import="project.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="project.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="com_list.css">
</head>
<body>
<%
    BoardDao dao = new BoardDao();
	ArrayList<BoardDto> dtos = dao.Com_list();
%>
	 <header>
        <h1 onclick="moveMain()">Nekarakubae</h1>
        <nav>
            <span onclick="moveCommunity()" class="w-btn">커뮤니티</span>
            <span onclick="moveKnowledge()" class="w-btn">지식</span>
            <span onclick="moveQ()" class="w-btn">질문과 답변</span>
        </nav>
        <div>
            <button onclick="moveLogin()" class="w-btn w-btn-indigo" type="button">
                로그인
            </button>
            <button onclick="moveSignup()" class="w-btn w-btn-indigo" type="button">
                회원가입
            </button>
        </div>
    </header>
    <div class="page-title">
        <h2>커뮤니티 게시판</h2>
        <small>여러분들의 소통을 위한 공간입니다.</small>
    </div>
    <%
    for (BoardDto dto : dtos){ 
    %>
    <div class="container">
        <section class="post-list">
            <article class="post">
                <h2 class="post-title"> <a href = "com.jsp?number=<%=dto.getNumber()%>"> <%=dto.getTitle() %></h2>
                <div class="post-meta">
                    <div id="left">
                        <p>작성자 : <%=dto.getWriter() %></p>
                        <p>작성일 : <%=dto.getRegdate() %></p>
                    </div>
                    <div id="right">
                        <img src="../images/icon_view.png" alt="조회수">
                        <small><%=dto.getView_cnt() %></small>
                        <img src="../images/icon_chat.png" alt="댓글">
                        <small><%=dto.getReply_cnt() %></small>
                        <img src="../images/icon_heart.png" alt="좋아요">
                        <small><%=dto.getLike() %></small>
                    </div>
                </div>
            </article>

        </section>
    </div>
    <%}%>
    <footer>
        <p>Nekarakubae &copy; 2023. All rights reserved.</p>
    </footer>
</body>
</html>