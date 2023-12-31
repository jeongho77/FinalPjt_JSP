<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="intro.css">
    <script type="text/javascript" src="index.js"></script>
    <title>Nekarakubae - 개발자 커뮤니티</title>
</head>

<script>SEC_HTTPS = true;
    SEC_BASE = "compilers.widgets.sphere-engine.com";
    (function (d, s, id) {
        SEC = window.SEC || (window.SEC = []);
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return; js = d.createElement(s); js.id = id;
        js.src = (SEC_HTTPS ? "https" : "http") + "://" + SEC_BASE + "/static/sdk/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, "script", "sphere-engine-compilers-jssdk"));
</script>

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
			<button onclick="location.href='<%=request.getContextPath()%>/project/edituser.jsp'" class="w-btn w-btn-indigo"
				type="button">회원정보수정</button>
			<button onclick="location.href='<%=request.getContextPath()%>/project/logout.jsp'" class="w-btn w-btn-indigo"
				type="button">로그아웃</button>  
		</div>
		<%
		}
		%>
	</header>
    <div class="welcome-container">
        <h2 class="welcome-title">컴파일러</h2>
        <p class="welcome-message">바쁜 개발자들을 위해 간단한 코딩 테스트를 할 수 있는 공간입니다. Java, c, python 등 다양한 프로그래밍 언어를 지원하고 있습니다.</p>
    </div>
    <div class="sec-widget" data-widget="9e1e25c224b32a941cccc468d284e148"></div>
    <footer>
        <p>Nekarakubae &copy; 2023. All rights reserved.</p>
    </footer>
</body>

</html>