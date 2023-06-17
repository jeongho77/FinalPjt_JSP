<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="project.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="index.css">
    <script type="text/javascript" src="index.js"></script>
    <title>Nekarakubae 커뮤니티</title>
    
</head>
<body>
<%
    BoardDao dao = new BoardDao();
	ArrayList<BoardDto> dtos = dao.Com_list();
%>
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
    <div class="postcontainer" >
        <video class="center" src="video/welcome.mp4" poster="images/notfound.png" width="100%" loop="" autoplay="" muted=""></video>    
    </div>

    <div class="box-container">
        <div class="box">
        
            <h2>지식 타이틀</h2>
            <ul>
                <li>
                    <h3>글 제목 1</h3>
                    <small>작성자: 사용자1 | 작성일: 2023-05-24</small>
                </li>
                <li>
                    <h3>글 제목 2</h3>
                    <small>작성자: 사용자2 | 작성일: 2023-05-23</small>
                </li>
                <!-- 필요한 만큼 글 목록을 추가하세요 -->
            </ul>
        </div>

        <div class="box" id="box1">
        <h2>커뮤니티 타이틀</h2>
        	<ul>
        <% int count = 0;
         for (BoardDto dto : dtos){ 
         	if ( count >= 2) {
         		break ;
         	}  
         %>
                <li>
                    <h3><%=dto.getTitle()%></h3>
                    <small>작성자: <%=dto.getWriter() %> | 작성일: <%= dto.getRegdate() %></small>
                </li>
            <% count++; 
         }%>
        
            </ul>
        </div>

        <div class="box" id="box2">
            <h2>인기 타이틀</h2>
            <ul>
                <li>
                    <h3>글 제목 1</h3>
                    <small>작성자: 사용자1 | 작성일: 2023-05-24</small>
                </li>
                <li>
                    <h3>글 제목 2</h3>
                    <small>작성자: 사용자2 | 작성일: 2023-05-23</small>
                </li>
                <!-- 필요한 만큼 글 목록을 추가하세요 -->
            </ul>
        </div>

        <div class="box" id="box3">
            <h2>질문과 답변 타이틀</h2>
            <ul>
                <li>
                    <h3>글 제목 1</h3>
                    <small>작성자: 사용자1 | 작성일: 2023-05-24</small>
                </li>
                <li>
                    <h3>글 제목 2</h3>
                    <small>작성자: 사용자2 | 작성일: 2023-05-23</small>
                </li>
            </ul>
        </div>
    </div>

    <div class="box-container">
        <div class="box">
            <h2>지식 타이틀</h2>
            <ul>
                <li>
                    <h3>글 제목 1</h3>
                    <small>작성자: 사용자1 | 작성일: 2023-05-24</small>
                </li>
                <li>
                    <h3>글 제목 2</h3>
                    <small>작성자: 사용자2 | 작성일: 2023-05-23</small>
                </li>
                <!-- 필요한 만큼 글 목록을 추가하세요 -->
            </ul>
        </div>

        <div class="box" id="box1">
            <h2>커뮤니티 타이틀</h2>
            <ul>
                <li>
                    <h3>글 제목 1</h3>
                    <small>작성자: 사용자1 | 작성일: 2023-05-24</small>
                </li>
                <li>
                    <h3>글 제목 2</h3>
                    <small>작성자: 사용자2 | 작성일: 2023-05-23</small>
                </li>
                <!-- 필요한 만큼 글 목록을 추가하세요 -->
            </ul>
        </div>

        <div class="box" id="box2">
            <h2>인기 타이틀</h2>
            <ul>
                <li>
                    <h3>글 제목 1</h3>
                    <small>작성자: 사용자1 | 작성일: 2023-05-24</small>
                </li>
                <li>
                    <h3>글 제목 2</h3>
                    <small>작성자: 사용자2 | 작성일: 2023-05-23</small>
                </li>
                <!-- 필요한 만큼 글 목록을 추가하세요 -->
            </ul>
        </div>

        <div class="box" id="box3">
            <h2>질문과 답변 타이틀</h2>
            <ul>
                <li>
                    <h3>글 제목 1</h3>
                    <small>작성자: 사용자1 | 작성일: 2023-05-24</small>
                </li>
                <li>
                    <h3>글 제목 2</h3>
                    <small>작성자: 사용자2 | 작성일: 2023-05-23</small>
                </li>
            </ul>
        </div>
    </div>

    <footer>
        <p>Nekarakubae &copy; 2023. All rights reserved.</p>
    </footer>
</body>

</html>