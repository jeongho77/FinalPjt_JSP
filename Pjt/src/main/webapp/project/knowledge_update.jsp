<%@page import="project.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="project.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="com_update.css">
<script type="text/javascript" src="index.js"></script>
<body>
<%
	int number = Integer.parseInt(request.getParameter("number"));
	BoardDao dao = new BoardDao();
	BoardDto dto = dao.Know_getOne(number);
%>
	<header>
		<img src="images/title.png" onclick="moveMain()" alt="타이틀">
		<nav>
			<span onclick="moveCommunity()" class="w-btn">커뮤니티</span>
			<span onclick="location.href='<%=request.getContextPath()%>/project/board_page/knowledge.jsp'" class="w-btn">지식</span>
			<span onclick="location.href='<%=request.getContextPath()%>/project/board_page/qna.jsp'" class="w-btn">질문과 답변</span>
			
		</nav>
		<div>
			<%
			if (session.getAttribute("user") == null) {
			%>
			<div>
				<button onclick="moveLogin()" class="w-btn w-btn-indigo"
					type="button">로그인</button>
				<button onclick="moveSignup()" class="w-btn w-btn-indigo"
					type="button">회원가입</button>
			</div>
			<%
			} else {
			%>
			<div class="login-success">
				<p>
					환영합니다.
					<%=session.getAttribute("user")%>님
				</p>
				<button onclick="location.href='<%=request.getContextPath()%>/project/edituser.jsp'" class="w-btn w-btn-indigo"
				type="button">회원정보수정</button>
			<button onclick="location.href='<%=request.getContextPath()%>/project/logout.jsp'" class="w-btn w-btn-indigo"
				type="button">로그아웃</button>
			</div>
			<%
			}
			%>
		</div>
	</header>
	<main class="container">
		<section class="main-list">
			<div class="page-title">
				<h2>글 작성하기</h2>
			</div>
			<form action="com_update_ok.jsp" method="get">
				<div class="input-group">
					<p>
						글 번호<input type="text" name="number" value="<%=dto.getNumber()%>" readOnly>
					</p>
				</div>
				<div class="input-group">
					<label for="title">제목</label> <input type="text" id="title"
						name="title" value="<%=dto.getTitle()%>">
				</div>
				<div class="input-group">
					<label for="title">카테고리</label>
					<div class="radio-group">
						<label> <input type="radio" name="author"
							value="community"> 커뮤니티
						</label> <label> <input type="radio" name="author"
							value="knowledge" checked> 지식
						</label> <label> <input type="radio" name="author" value="qna">
							질문과답변
						</label>
					</div>
				</div>
				<div class="input-group">
					<label for="content">내용</label>
					<input type="text" class="form-control" value="<%=dto.getContent() %>" name="content" maxlength="2048" style="width: 500px; height: 300px;">
				</div>
				<div class="button-group">
					<input type="hidden" name="writer" value="<%=session.getAttribute("user")%>">
					<button class="w-btn w-btn-indigo" type="submit">수정하기</button>
					<button class="w-btn" type="button" onclick="history.back()">취소</button>
				</div>
			</form>
		</section>
	</main>
</body>
</html>