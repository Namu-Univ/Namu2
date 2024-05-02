<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
<jsp:include page="../../css/noticeDetailCss.jsp" />
</head>
<body>
	<table>
		<tr class="title-row">
			<td colspan="4">${notice.title}</td>
		</tr>
		<tr class="info-row">
			<td><strong>작성자</strong>&nbsp;${notice.staffName}</td>
			<td></td>
			<td><strong>작성일자</strong>&nbsp;<fmt:formatDate value="${notice.created}" pattern="yyyy.MM.dd"/></td>
			<td><strong>조회수</strong>&nbsp;${notice.views}</td>
		</tr>
		<tr class="content-row">
			<td colspan="4">${notice.content}</td>
		</tr>
		<tr>
			<td colspan="4" class="button">
				<button onclick="location.href='noticeList'">목록으로</button>
				<c:if test="${isStaff && isAutor}">
					<button onclick="location.href='updateNotice?id=${notice.id}'">수정</button>
					<button onclick="if(confirm('정말 삭제하시겠습니까?'))location.href='deleteNotice?id=${notice.id}'">삭제</button>
				</c:if>
			</td>
		</tr>
	</table>
	<c:if test="${not empty error}"><div>${error}</div></c:if>
</body>
</html>