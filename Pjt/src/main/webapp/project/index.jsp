<!DOCTYPE html>
<%@page import="project.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="project.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="index.css">
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
	<div class="postcontainer">
		<video src="video/welcome.mp4" poster="images/notfound.png" loop=""
			autoplay="" muted=""></video>
		<div>
			<h3>모든 개발자를 위한 SNS</h3>
			<h1 onclick="openAndResize()">네카라쿠배</h1>
		</div>
	</div>
	<div class="box-container">
		<div class="box">
		
			<h2>실시간 BEST</h2>
			<ul>
				<%
				BoardDao dao = new BoardDao();
				ArrayList<BoardDto> dtos = dao.best_list();
				
				int count = 0;
				for (BoardDto dto : dtos) {
					if (count >= 5) {
						break;
					}
				%>
				<li>
					<div onclick="goToKnowPage(<%=dto.getNumber()%>)" id="left">
						<h3><%=dto.getTitle()%></h3>
						<small>작성자: <%=dto.getWriter()%></small> <small> | </small> <small>작성일:
							<%=dto.getRegdate()%></small> <small> | </small> <small>조회수: <%=dto.getView_cnt()%></small>
					</div>
					<div id="right">
						<img src="images/icon_chat.png" alt="댓글"> <small><%=dto.getReply_cnt() %></small>
						<img src="images/icon_heart.png" alt="좋아요"> <small><%=dto.getLike() %></small>
					</div>
				</li>
				<%
				count++;
				}
				%>
			</ul>
		</div>
		<div class="box" id="box1">
			<h2>커뮤니티</h2>
			<ul>
				<%
				
				ArrayList<BoardDto> dtos1 = dao.Com_list();
				
				int count1 = 0;
				for (BoardDto dto : dtos1) {
					if (count1 >= 5) {
						break;
					}
				%>
				<li>
					<div onclick="goToKnowPage(<%=dto.getNumber()%>)" id="left">
						<h3><%=dto.getTitle()%></h3>
						<small>작성자: <%=dto.getWriter()%></small> <small> | </small> <small>작성일:
							<%=dto.getRegdate()%></small> <small> | </small> <small>조회수: <%=dto.getView_cnt()%></small>
					</div>
					<div id="right">
						<img src="images/icon_chat.png" alt="댓글"> <small><%=dto.getReply_cnt() %></small>
						<img src="images/icon_heart.png" alt="좋아요"> <small><%=dto.getLike() %></small>
					</div>
				</li>
				<%
				count1++;
				}
				%>
			</ul>
		</div>

		<script>
			function goToCommunityPage(number) {
    		var url = "http://localhost:8080/Pjt/project/board_page/community_page.jsp?number=" + number;
    		window.location.href = url;
		}
			function goToQNAPage(number) {
    		var url = "http://localhost:8080/Pjt/project/board_page/qna_page.jsp?number=" + number;
    		window.location.href = url;
		}
			function goToKnowPage(number) {
    		var url = "http://localhost:8080/Pjt/project/board_page/knowledge_page.jsp?number=" + number;
    		window.location.href = url;
		}
</script>

		<div class="box" id="box1">
			<h2>지식</h2>
			<ul>
				<%
				
				ArrayList<BoardDto> dtos2 = dao.Know_list();
				
				int count2 = 0;
				for (BoardDto dto : dtos2) {
					if (count2 >= 5) {
						break;
					}
				%>
				<li>
					<div onclick="goToKnowPage(<%=dto.getNumber()%>)" id="left">
						<h3><%=dto.getTitle()%></h3>
						<small>작성자: <%=dto.getWriter()%></small> <small> | </small> <small>작성일:
							<%=dto.getRegdate()%></small> <small> | </small> <small>조회수: <%=dto.getView_cnt()%></small>
					</div>
					<div id="right">
						<img src="images/icon_chat.png" alt="댓글"> <small><%=dto.getReply_cnt() %></small>
						<img src="images/icon_heart.png" alt="좋아요"> <small><%=dto.getLike() %></small>
					</div>
				</li>
				<%
				count2++;
				}
				%>
				
			</ul>
		</div>
		<div class="box" id="box1">
			<h2>질문과 답변</h2>
			<ul>
				<%
				
				ArrayList<BoardDto> dtos3 = dao.Qa_list();
				
				int count3 = 0;
				for (BoardDto dto : dtos3) {
					if (count3 >= 5) {
						break;
					}
				%>
				<li>
					<div onclick="goToQNAPage(<%=dto.getNumber()%>)" id="left">
						<h3><%=dto.getTitle()%></h3>
						<small>작성자: <%=dto.getWriter()%></small> <small> | </small> <small>작성일:
							<%=dto.getRegdate()%></small> <small> | </small> <small>조회수: <%=dto.getView_cnt()%></small>
					</div>
					<div id="right">
						<img src="images/icon_chat.png" alt="댓글"> <small><%=dto.getReply_cnt() %></small>
						<img src="images/icon_heart.png" alt="좋아요"> <small><%=dto.getLike() %></small>
					</div>
				</li>
				<%
				count3++;
				}
				%>
				
			</ul>
		</div>
</div>
	<footer>
		<p>Nekarakubae &copy; 2023. All rights reserved.</p>
	</footer>
</body>

</html>