<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
</head>
<body>
<jsp:include page="../../css/frameCss.jsp"/>
<jsp:include page="../../css/noticeInsertUpdateCss.jsp" />
<jsp:include page="../../partials/navTop/navTop.jsp"/>
	<div class="mid">
	<jsp:include page="../../partials/sideNav/sideNav_notice.jsp"/>
	<div class="maintop">공지사항 수정</div>
		<form action="updateNotice" method="post">
			<input type="hidden" name="id" value="${notice.id}">
			<table>
				<tr class="title-row">
					<th>제목</th>
					<td><input type="text" name="title" value="${notice.title}"></td>
				</tr>
				<tr class="content-row">
					<th>내용</th>
					<td><textarea name="content" rows="10" cols="30">${notice.content}</textarea></td>
				</tr>
				<tr>
					<td colspan="2" class="button">
						<input type="submit" value="수정">
						<button type="button" onclick="history.back()">취소</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>