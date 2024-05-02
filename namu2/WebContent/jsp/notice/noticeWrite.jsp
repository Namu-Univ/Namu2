<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
<jsp:include page="../../css/noticeInsertUpdateCss.jsp" />
</head>
<body>

	<form action="noticeWrite" method="post" enctype="multipart/form-data">
		<table>
			<tr class="title-row">
				<th><label for="title">제목</label></th>
				<td><input type="text" name="title" required></td>
			</tr>
			<tr class="content-row">
				<th><label for="content">내용</label></th>
				<td><textarea id="content" name="content"></textarea></td>
			</tr>
			<tr class="file-row">
				<th><label for="file">파일첨부</label>
				<td><input type="file" id="file" name="file" multiple></td>
			</tr>
			<tr>
				<td colspan="2" class="button">
					<button type="button" onclick="history.back()">취소</button>
					<input type="submit" value="등록">
				</td>
			</tr>
		</table>
	</form>
	
</body>
</html>