<%@page import="project.BoardDao"%>
<%@page import="project.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="community_page.css">
<script type="text/javascript" src="community.js"></script>
<title>상세페이지</title>
</head>

<body>
	<%
	
	int number = Integer.parseInt(request.getParameter("number"));
	String s = (String) session.getAttribute("user");
	BoardDao dao = new BoardDao();
	BoardDto dto = dao.Com_getOne(number);
	
	%>
	<header>
		<img src="../images/title.png" onclick="moveMain()" alt="타이틀">
		<nav>
			<span onclick="moveCommunity()" class="w-btn">커뮤니티</span> <span
				onclick="moveKnowledge()" class="w-btn">지식</span> <span
				onclick="moveQ()" class="w-btn">질문과 답변</span>
		</nav>
		<div>
			<button class="w-btn w-btn-indigo" type="button">로그인</button>
			<button class="w-btn w-btn-indigo" type="button">회원가입</button>
		</div>
	</header>

	<main class="container">
		<section class="main-list">
			<%
			if (dto.getWriter().equals(session.getAttribute("user"))) {
			%>
			<button class="changeBtn" class="w-btn" type="button"
				onclick="location.href='com_update.jsp?number=<%=dto.getNumber()%>'">수정</button>
			<button class="changeBtn" class="w-btn" type="button"
				onclick="location.href='com_delete.jsp?number=<%=dto.getNumber()%>'">삭제</button>
			<%
			}
			%>

			<article class="main">
				<div class="main-title">
					<h2><%=dto.getTitle() %></h2>
				</div>
				<hr>
				<div class="main-info">
					<p class="author"><%=dto.getWriter() %></p>
					<img src="../images/icon_view.png" alt="<%=dto.getView_cnt()%>"> 
					<p class="date"><%=dto.getRegdate() %></p>
				</div>
				<div class="content">
					<p><%=dto.getContent() %></p>
				</div>
			</article>
			<div class="like-button">
				<button class="w-btn" type="button">좋아요!</button>
				<p>10</p>
			</div>
			<article class="comments">
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