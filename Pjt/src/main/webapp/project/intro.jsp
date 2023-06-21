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
        <h2 class="welcome-title">환영합니다!</h2>
        <p class="welcome-message">저희 커뮤니티에 오신 것을 환영합니다. 여기에서는 다양한 주제에 대한 토론과 지식 공유를 즐길 수 있습니다. 함께 커뮤니티 멤버들과 소통하고, 새로운
            아이디어를 만나보세요.</p>
    </div>
    <div class="postcontainer">
        <div class="image-container">
            <img src="images/intro3.jpg" alt="이미지 1">
        </div>
        <div class="text-container">
            <h2>다양한 주제에 대한 토론</h2>
            <p>우리 커뮤니티에서는 다양한 주제에 대한 토론을 진행합니다. 프로그래밍, 웹 개발, 인공지능, 디자인 등 다양한 분야에 관련된 주제를 공유하고 의견을 교환해보세요. 새로운 아이디어와 독특한
                관점을 만나보실 수 있습니다.</p>
        </div>
    </div>
    <div class="postcontainer">
        <div class="text-container">
            <h2>전문 지식 공유</h2>
            <p>저희 커뮤니티는 전문가들과 함께 지식을 공유하는 공간입니다. 다양한 분야의 전문가들이 여기에 모여 지식과 경험을 나누고, 질문에 답변해드립니다. 지식을 확장하고 실력을 향상시킬 수 있는
                기회를 놓치지 마세요!</p>
        </div>
        <div class="image-container">
            <img src="images/intro1.png" alt="이미지 2">
        </div>
    </div>
    <div class="postcontainer">
        <div class="image-container">
            <img src="images/intro2.jpg" alt="이미지 3">
        </div>
        <div class="text-container">
            <h2>사용자 친화적인 커뮤니티</h2>
            <p>저희 커뮤니티는 사용자 중심의 편안한 환경을 제공합니다. 새로운 멤버를 환영하며 상호 작용을 도모하는 것을 원칙으로 합니다. 다른 회원들과 쉽게 소통하고, 지식과 경험을 나누며 친목을
                도모할 수 있는 소중한 공간이기도 합니다.</p>
        </div>
    </div>
    <footer>
        <p>Nekarakubae &copy; 2023. All rights reserved.</p>
    </footer>
</body>

</html>