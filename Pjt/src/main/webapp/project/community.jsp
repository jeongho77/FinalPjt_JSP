<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
    <div class="page-title">
        <h2>커뮤니티 게시판</h2>
        <small>여러분들의 소통을 위한 공간입니다.</small>
    </div>
    <div class="container">
        <section class="post-list">
            <article class="post" onclick="moveCommunityPage()">
                <h2 class="post-title">안녕하세요!</h2>
                <p class="post-content">
                    Baby, got me looking so crazy
                    빠져버리는 daydream
                    Got me feeling you
                    너도 말해줄래
                </p>
                <div class="post-meta">
                    <div id="left">
                        <p>작성자 : 미연</p>
                        <p>작성일 : 2023-06-17</p>
                    </div>
                    <div id="right">
                        <img src="../images/icon_view.png" alt="조회수">
                        <small>200</small>
                        <img src="../images/icon_chat.png" alt="댓글">
                        <small>10</small>
                        <img src="../images/icon_heart.png" alt="좋아요">
                        <small>20</small>
                    </div>
                </div>
            </article>

        </section>
    </div>
    <footer>
        <p>Nekarakubae &copy; 2023. All rights reserved.</p>
    </footer>
</body>
</html>