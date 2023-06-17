<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
        <form action="com_write_ok.jsp" method="get">
            <table class="table1" style="text-align:center; border: 1px solid #dddddd">
                <thead>
                    <tr>
                    <th colspan="2" style="background-color:#eeeeee; text-align: center;">게시판 글쓰기</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                    <td><input type="text" class="form-control" placeholder=" 글 제목" name="title" maxlength="50" style="width:500px;"></td>
                    </tr>
                    <tr>
                    <td><textarea class="form-control" placeholder="글 내용" name="content" maxlength="2048" style="width: 500px; height: 300px;"></textarea></td>
                    </tr>
                </tbody>
            </table>
            <input type="submit" class="btnSub" value="글쓰기">
        </form>
    </div>
</body>
</html>