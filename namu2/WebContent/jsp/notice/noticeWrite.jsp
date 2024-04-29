<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
</head>
<body>
	<form action="noticeWrite" method="post">
		<table>
			<tr>
				<th><label for="title">제목</label></th>
				<td><textarea id="title" name="title" required></textarea></td>
			</tr>
			<tr>
				<th><label for="content">내용</label></th>
				<td><textarea id="content" name="content"></textarea></td>
			</tr>
			<tr>
				<th><label for="file">첨부파일</label>
				<td><input type="file" id="file" name="file"></td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" onclick="history.back()">취소</button>
					<input type="submit" value="등록">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>