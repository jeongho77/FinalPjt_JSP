<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="signup.css">
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
           <%  
           if (session.getAttribute("user") == null) {
           
         %>
             <button onclick="moveLogin()" class="w-btn w-btn-indigo" type="button">
                로그인
            </button>
            <button onclick="moveSignup()" class="w-btn w-btn-indigo" type="button">
                회원가입
            </button>
        <%
        }else{
            %><button onclick="moveLogout()" class="w-btn w-btn-indigo" type="button">
               로그아웃
            </button>
        <%   }%>
        </div>
    </header>

    <div class="signup-container">	
        <h2>회원가입</h2>
        <form action = "signup_ok.jsp" method = "get">
            <input type="text" placeholder="이름" required name="name">
            <input type="email" placeholder="이메일" required name="email">
            <input type="password" placeholder="비밀번호" required name="pwd">
            <input type="text" placeholder="닉네임" required name="nickname">
            <button type="submit">가입하기</button>
        </form>
        <p onclick="moveLogin()">이미 계정이 있으신가요? <a href="#">로그인</a></p>
    </div>

    <footer>
        <p>Nekarakubae &copy; 2023. All rights reserved.</p>
    </footer>
</body>
</html>