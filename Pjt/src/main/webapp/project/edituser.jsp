<%
/*===============================
작성자 : qbnyp
작성일 : 2023. 6. 21.
프로그램 기능 : 
==============================*/
%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="edituser.css">
    <script type="text/javascript" src="index.js"></script>
    <title>Nekarakubae - 개발자 커뮤니티</title>
</head>

<body>
    <header>
        <img src="images/title.png" onclick="moveMain()" alt="타이틀">
        <nav>
            <span onclick="moveCommunity()" class="w-btn">커뮤니티</span>
            <span onclick="moveKnowledge()" class="w-btn">지식</span>
            <span onclick="moveQ()" class="w-btn">질문과 답변</span>
        </nav>
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
        <!---
        <div class="login-success">
            <p>환영합니다. 홍길동님</p>
            <button onclick="moveLogin()" class="w-btn w-btn-indigo" type="button">
                회원정보수정
            </button>
            <button onclick="moveLogin()" class="w-btn w-btn-indigo" type="button">
                로그아웃
            </button>
        </div> -->
    </header>
    <div class="img1">
        <h2>나의 정보 수정</h2>
    </div>
    <main class="main-container">
        <div>
            <form class="user-form" action="edituser_ok.jsp" >
                <div class="form-group">
                  <label for="name">이름 </label>
                  <input type="text" id="name" name="name" placeholder="이름을 입력하세요">
                </div>
              
                <div class="form-group">
                  <label for="email">이메일 </label>
                  <input type="email" id="email" name="email" placeholder="이메일을 입력하세요">
                </div>
              
                <div class="form-group">
                  <label for="password">비밀번호 </label>
                  <input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요">
                </div>
              
                <div class="form-group">
                  <label for="nickname">닉네임 </label>
                  <input type="text" id="nickname" name="nickname" placeholder="닉네임을 입력하세요">
                </div>

                <button type="submit" class="w-btn">저장</button>
              </form>
        </div>
    </main>
    <footer>
        <p>Nekarakubae &copy; 2023. All rights reserved.</p>
    </footer>
</body>

</html>