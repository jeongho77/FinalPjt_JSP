<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OKKY - 로그인</title>
    <link rel="stylesheet" href="login.css">
    <script type="text/javascript" src="index.js"></script>
</head>
	<% 
	    String previousPage = request.getHeader("referer");
	    session.setAttribute("previousPage", previousPage);
	%>   
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
    <div class="login-container">
        <h2>로그인</h2>
        <form action="login_ok.jsp" method="get">
            <input type="text" name="email" placeholder="아이디" required>
            <input type="password" name="pwd" placeholder="비밀번호" required>
            <input type="hidden" name="previousPage" value="<%= previousPage %>">
            <button type="submit">로그인</button>
        </form>
        <p>계정이 없으신가요? <a href="signup.jsp">회원가입</a></p>
    </div>
</body>

</html>
