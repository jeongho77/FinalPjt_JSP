<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="login.css">
</head>
<body>
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
  <div class="login-container">
    <h2>로그인</h2>
    <form action = "login_ok.jsp" method = "get">
      <input type="text" placeholder="아이디" required name="email">
      <input type="password" placeholder="비밀번호" required name="pwd">
      <button type="submit">로그인</button>
    </form>
    <p onclick="moveSignup()">계정이 없으신가요? <a href="#">회원가입</a></p>
  </div>
  <footer>
    <p>Nekarakubae &copy; 2023. All rights reserved.</p>
  </footer>
</body>
</html>