//네비게이션 버튼 클릭시 화면 이동
function moveMain() {
    location.href = "index.jsp"
}

function moveKnowledge() {
    location.href = "board_page/knowledge.jsp"
}

function moveQ() {
    location.href = "board_page/qna.jsp"
}

function moveCommunity() {
    location.href = "board_page/community.jsp"
}

function moveLogin() {
    location.href = "login.jsp"
}

function moveLogout() {
    location.href = "logout.jsp"
}

function moveSignUp() {
	location.href = "signup.jsp"
}

function openAndResize() {
 	var newWindow = window.open("game/bounceball.html", "_blank");
  	newWindow.addEventListener("load", function() {
    	newWindow.resizeTo(800, 600);
 	});
}