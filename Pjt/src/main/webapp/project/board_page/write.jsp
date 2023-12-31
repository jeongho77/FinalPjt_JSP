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
        <img src="../images/title.png" onclick="location.href='<%=request.getContextPath()%>/project/index.jsp'" alt="타이틀">
        <nav>
        	<span onclick="location.href='../intro.jsp'" class="w-btn">소개</span>
            <span onclick="location.href='<%=request.getContextPath()%>/project/board_page/community.jsp'" class="w-btn">커뮤니티</span>
            <span onclick="location.href='<%=request.getContextPath()%>/project/board_page/knowledge.jsp'" class="w-btn">지식</span>
			<span onclick="location.href='<%=request.getContextPath()%>/project/board_page/qna.jsp'" class="w-btn">질문과 답변</span>
			<span onclick="location.href='../compiler.jsp'" class="w-btn">컴파일러</span>
        </nav>
        <div>
          <%  
           if (session.getAttribute("user") == null) {
           
         %>
             <button onclick="location.href='<%=request.getContextPath()%>/project/login.jsp'" class="w-btn w-btn-indigo" type="button">
                로그인
            </button>
            <button onclick="location.href='<%=request.getContextPath()%>/project/signup.jsp'" class="w-btn w-btn-indigo" type="button">
                회원가입
            </button>
        <%
        }else{
            %><button onclick="location.href='<%=request.getContextPath()%>/project/edituser.jsp'" class="w-btn w-btn-indigo"
				type="button">회원정보수정</button>
			<button onclick="location.href='<%=request.getContextPath()%>/project/logout.jsp'" class="w-btn w-btn-indigo"
				type="button">로그아웃</button>
        <%   }%>
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