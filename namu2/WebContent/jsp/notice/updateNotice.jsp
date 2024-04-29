<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
</head>
<body>
	<form action="updateNotice" method="post">
		<input type="hidden" name="id" value="${notice.id}">
		<table>
			<tr>
				<th>제목:</th>
				<td><input type="text" name="title" value="${notice.title}"></td>
			</tr>
			<tr>
				<th>내용:</th>
				<td><textarea name="content" rows="10" cols="30">${notice.content}</textarea></td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="수정">
					<button type="button" onclick="history.back()">취소</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>