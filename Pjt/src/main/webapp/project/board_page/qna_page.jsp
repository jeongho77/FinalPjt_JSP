<%@page import="project.ReplyDao"%>
<%@page import="project.ReplyDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="project.BoardDao"%>
<%@page import="project.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="community_page.css">
<script type="text/javascript" src="community.js"></script>
<title>상세페이지</title>
</head>

<body>
	<%
	int number = Integer.parseInt(request.getParameter("number"));
	String s = (String) session.getAttribute("user");
	BoardDao dao = new BoardDao();
	BoardDto dto = dao.Qa_getOne(number);
	
	ReplyDao dao2 = new ReplyDao();
	ArrayList<ReplyDto> replyList = dao2.Qa_Reply_list(number);
	dao.qa_view(number);
	
	%>
	
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
			<%
			if (dto.getWriter().equals(session.getAttribute("user"))) {
			%>
			<div class="modify-button">
   				 <button class="changeBtn w-btn" type="button" onclick="location.href='../qna_update.jsp?number=<%=dto.getNumber()%>'">수정</button>
    			 <button class="changeBtn w-btn" type="button" onclick="location.href='../qna_delete.jsp?number=<%=dto.getNumber()%>'">삭제</button>
			</div>
			<%
			}
			%>

			<article class="main">
				<div class="main-title">
					<h2><%=dto.getTitle()%></h2>
				</div>
				<hr>
				<div class="main-info">
					<p class="author"><%=dto.getWriter()%></p>
					<img src="../images/icon_view.png"> <p><%=dto.getView_cnt()%></p>
					<p class="date"><%=dto.getRegdate()%></p>
				</div>
				<div class="content">
					<p style="white-space: pre-wrap"><%=dto.getContent()%></p>
				</div>
			</article>
			<div class="like-button">
				<button class="w-btn" type="button" onclick = "location.href='http://localhost:8080/Pjt/project/board_page/qna_like.jsp?number=<%=dto.getNumber()%>'">좋아요!</button>
				<p><%=dto.getLike() %></p>
			</div>
			<article class="comments">
				<%
				if (session.getAttribute("user") == null) {
				}
				else{%>
				<form action="qna_reply.jsp">
					<div class="comment-form">
						<input type="text" placeholder="댓글을 작성해주세요." name="content"
							class="comment-input"> <input type="hidden" name="number"
							value="<%=dto.getNumber()%>"> <input type="hidden"
							name="writer" value="<%=session.getAttribute("user")%>">
						<button type="submit" class="comment-submit">등록</button>
						<%
						}
						%>
					</div>
				</form>
			</article>
			
			<ul class="comment-list">
				<%
				for (ReplyDto reply : replyList) {
				%>
				<li style="position: relative;">
					<p class="comment-author"><%=reply.getWriter()%></p>
					<p class="comment-content"><%=reply.getContent()%></p>
					<p class="comment-date"><%=reply.getDate()%></p>
					<%
					if (reply.getWriter().equals(session.getAttribute("user"))) {
					%>
					<button style="width:20px; height: 20px; border: none; position: absolute; transform: translateY(-50%); top: 70%; right: 0%" type="button" onclick="location.href='../qna_reply_delete.jsp?number=<%=reply.getNumber()%>&com_num=<%=dto.getNumber()%>'">
						<img style="width:20px; height: 20px;" class="reply_delete" src="../images/trash.jpg">
					</button>
					<%
					}
					%>
				</li>
				<%
				}
				%>
			</ul>
		</section>
	</main>
</body>

</html>