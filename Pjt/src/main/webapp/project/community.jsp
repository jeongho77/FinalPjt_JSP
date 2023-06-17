<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="community_list.css">
</head>
<body>
	<main class="container">
        <section class="main-list">
            <article class="main">
                <div class="main-title">
                    <h2>뉴진스의 하입보이</h2>
                </div>
                <hr>
                <div class="main-info">
                    <p class="author">이이잉</p>
                    <img src="../images/icon_view.png" alt="조회수">
                    <small>200</small>
                    <p class="date">2023-06-17</p>
                </div>
                <div class="content">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla eu pulvinar nisl. Vestibulum
                        cursus mi eu orci suscipit cursus. Sed interdum purus tellus, sed cursus sem sollicitudin vitae.
                        Donec ultrices risus ut tellus eleifend, euismod facilisis sem cursus. Nullam nec purus massa.
                        Duis auctor ex a dolor ultricies, et egestas mi convallis. Integer pharetra odio vitae est
                        facilisis, at rhoncus ligula ullamcorper. Morbi dictum purus eget sem rutrum, id vestibulum
                        turpis condimentum. Suspendisse potenti. Suspendisse condimentum libero at risus dignissim
                        fringilla. Nullam tincidunt semper tellus, non pharetra risus placerat in. Mauris eu rutrum
                        quam. Duis ullamcorper nunc vel ante fringilla, sed laoreet metus cursus.</p>
                </div>
            </article>

            <article class="comments">
                <h3>댓글</h3>
                <div class="comment-form">
                    <input type="text" placeholder="댓글을 작성해주세요." class="comment-input">
                    <button type="submit" class="comment-submit">등록</button>
                </div>
                <ul class="comment-list">
                    <li>
                        <p class="comment-author">댓글 작성자</p>
                        <p class="comment-content">댓글 내용</p>
                        <p class="comment-date">작성일시</p>
    
                    </li>
                    <!-- 다른 댓글들 -->
                </ul>
            </article>
        </section>
    </main>
</body>
</html>