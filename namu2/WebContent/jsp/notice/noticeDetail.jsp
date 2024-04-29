<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
</head>
<body>
	<table>
		<tr>
			<td>${notice.title}</td>
		</tr>
		<tr>
			<th>작성자:</th>
			<td>${notice.staffName}</td>
			<th>작성일자:</th>
			<td><fmt:formatDate value="${notice.created}" pattern="yyyy.MM.dd"/></td>
			<th>조회수</th>
			<td>${notice.views}</td>
		</tr>
		<tr>
			<td>${notice.content}</td>
		</tr>
		<tr>
			<td>
				<button onclick="location.href='noticeList'">목록으로</button>
				<c:if test="${isStaff }">
					<button onclick="location.href='updateNotice?id=${notice.id}'">수정</button>
					<button onclick="if(confirm('정말 삭제하시겠습니까?'))location.href='deleteNotice?id=${notice.id}'">삭제</button>
				</c:if>
			</td>
		</tr>
	</table>
	<c:if test="${not empty error}"><div>${error}</div></c:if>
</body>
</html>