<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="write.css">
<script type="text/javascript" src="community.js"></script>
<title>글 작성하기</title>
</head>

<body>
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
				<button onclick="moveLogin()" class="w-btn w-btn-indigo"
					type="button">회원정보수정</button>
				<button onclick="moveLogin()" class="w-btn w-btn-indigo"
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
			<form action="com_write_ok.jsp" method="get">
				<div class="input-group">
					<label for="title">제목</label> <input type="text" id="title"
						name="title" placeholder="제목을 입력하세요.">
				</div>
				<div class="input-group">
					<label for="title">카테고리</label>
					<div class="radio-group">
						<label> <input type="radio" name="author"
							value="community" checked> 커뮤니티
						</label> <label> <input type="radio" name="author"
							value="knowledge"> 지식
						</label> <label> <input type="radio" name="author" value="qna">
							질문과답변
						</label>
					</div>
				</div>
				<div class="input-group">
					<label for="content">내용</label>
					<textarea id="content" name="content" placeholder="내용을 입력하세요."></textarea>
				</div>
				<div class="button-group">
					<input type="hidden" name="writer" value="<%=session.getAttribute("user")%>">
					<button class="w-btn w-btn-indigo" type="submit">작성 완료</button>
					<button class="w-btn" type="button" onclick="history.back()">취소</button>
				</div>
			</form>
		</section>
	</main>
</body>

</html>