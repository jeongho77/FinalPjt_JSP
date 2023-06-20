<%@page import="project.ReplyDao"%>
<%@page import="project.ReplyDto"%>
<%@page import="java.util.ArrayList"%>
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
	ReplyDao dao2 = new ReplyDao();
	ArrayList<ReplyDto> replyList = dao2.Reply_list();
	%>
	<header>
		<img src="../images/title.png" onclick="moveMain()" alt="타이틀">
		<nav>
			<span onclick="moveCommunity()" class="w-btn">커뮤니티</span> <span
				onclick="moveKnowledge()" class="w-btn">지식</span> <span
				onclick="moveQ()" class="w-btn">질문과 답변</span>
		</nav>
		<div>
			<%
			if (session.getAttribute("user") == null) {
			%>
			<button onclick="moveLogin()" class="w-btn w-btn-indigo"
				type="button">로그인</button>
			<button onclick="moveSignup()" class="w-btn w-btn-indigo"
				type="button">회원가입</button>
			<%
			} else {
			%><button onclick="moveLogout()" class="w-btn w-btn-indigo"
				type="button">로그아웃</button>
			<%
			}
			%>
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
					<h2><%=dto.getTitle()%></h2>
				</div>
				<hr>
				<div class="main-info">
					<p class="author"><%=dto.getWriter()%></p>
					<img src="../images/icon_view.png" alt="<%=dto.getView_cnt()%>">
					<p class="date"><%=dto.getRegdate()%></p>
				</div>
				<div class="content">
					<p><%=dto.getContent()%></p>
				</div>
			</article>
			<div class="like-button">
				<button class="w-btn" type="button">좋아요!</button>
				<p>10</p>
			</div>
			<article class="comments">
				<form action="community_reply.jsp">
					<input type="text" placeholder="댓글을 작성해주세요." name="content" class="comment-input"> 
					<input type="hidden" name="number" value="<%=dto.getNumber()%>">
					<input type="hidden" name="writer" value="<%=session.getAttribute("user")%>">
					<%
					if (session != null) {
					%>
					<button type="submit" class="comment-submit">등록</button>
					<%
					} else {
					%>
					<script>
						alert("로그인 후 댓글을 작성할 수 있습니다.");
					</script>
					<%
					}
					%>
				</form>
				</div>


				<ul class="comment-list">
					<%
					for (ReplyDto reply : replyList) {
					%>
					<li>
						<p class="comment-author"><%=reply.getWriter()%></p>
						<p class="comment-content"><%=reply.getContent()%></p>
						<p class="comment-date"><%=reply.getDate()%></p>
					</li>
					<%
					}
					%>
				</ul>
			</article>
		</section>
	</main>
</body>

</html>