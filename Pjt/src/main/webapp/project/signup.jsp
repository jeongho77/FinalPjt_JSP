<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원가입</title>
  <link rel="stylesheet" href="signup.css">
  <script type="text/javascript" src="index.js"></script>
</head>
<body>
    <header>
		<img src="images/title.png" onclick="moveMain()" alt="타이틀">
		<nav>
			<span onclick="location.href='intro.jsp'" class="w-btn">소개</span>
			<span onclick="moveCommunity()" class="w-btn">커뮤니티</span> 
			<span onclick="location.href='<%=request.getContextPath()%>/project/board_page/knowledge.jsp'"
				class="w-btn">지식</span> 
			<span onclick="location.href='<%=request.getContextPath()%>/project/board_page/qna.jsp'"
				class="w-btn">질문과 답변</span>
			<span onclick="location.href='compiler.jsp'" class="w-btn">컴파일러</span>
			
		</nav>
		<%
		if (session.getAttribute("user") == null) {
		%>
		<div>
			<button onclick="moveLogin()" class="w-btn w-btn-indigo"
				type="button">로그인</button>
			<button onclick="moveSignUp()" class="w-btn w-btn-indigo"
				type="button">회원가입</button>
		</div>
		<%
		} else {
		%>
		<div class="login-success">
			<p>  
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
	</header>

    <div class="signup-container">
        <h2>회원가입</h2>
        <form action="signup_ok.jsp" method="post">
            <input type="text" name="name" placeholder="이름" required>
            <input type="email" name="email" placeholder="이메일" required>
            <input type="password" name="pwd" placeholder="비밀번호" required>
            <input type="password" placeholder="비밀번호 재입력" required>
            <input type="text" name="nickname" placeholder="닉네임" required>
            <button type="submit">가입하기</button>
        </form>
        <p>이미 계정이 있으신가요? <a onclick="location.href='signup.jsp'">로그인</a></p>
    </div>

    <footer>
        <p>Nekarakubae &copy; 2023. All rights reserved.</p>
    </footer>
</body>
</html>
