<%@page import="com.namuuniv.vo.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>
<jsp:include page="../../css/frameCss.jsp"/>
<jsp:include page="../../css/noticeListCss.jsp"/>
<jsp:include page="../../css/btnCss.jsp"/>
<jsp:include page="../../partials/navTop/navTop.jsp"/>
	<div class="mid">
	<jsp:include page="../../partials/sideNav/sideNav_notice.jsp"/>
	<div class="maintop">공지사항</div>
		<table>
			<thead>
				<tr class="title">
					<th id="id">번호</th>
					<th id="title">제목</th>
					<th id="author">작성자</th>
					<th id="date">날짜</th>
					<th id="views">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="notice">
					<tr>
						<td>${notice.id }</td>
						<td><a href="noticeDetail?id=${notice.id}&cPage=${pvo.nowPage}">${notice.title}</a></td>
						<td>${notice.staffName}</td>
						<td>
							<c:if test="${not empty notice.created}">
								<fmt:formatDate value="${notice.created}" pattern="yyyy.MM.dd"/>
							</c:if>
						</td>
						<td>${notice.views }</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan = "4">
						<div class="paging">
							<c:if test="${pvo.beginPage == 1}">
								<span class="disable">&laquo;</span>
							</c:if>
							<c:if test="${pvo.beginPage != 1}">
								<a href="noticeList?cPage=${pvo.beginPage - 1}">&laquo;</a>
							</c:if>
						
							<c:forEach var="page" begin="${pvo.beginPage}" end="${pvo.endPage}">
								<c:choose>
									<c:when test="${page == pvo.nowPage}">
										<span class="current">${page}</span>
									</c:when>
									<c:otherwise>
										<a href="noticeList?cPage=${page}">${page}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<c:if test="${pvo.endPage < pvo.totalPage}">
								<a href="noticeList?cPage=${pvo.endPage + 1}">&raquo;</a>
							</c:if>
							<c:if test="${pvo.endPage >= pvo.totalPage}">
								<span class="disabled">&raquo;</span>
							</c:if>
						</div>
					</td>
					<td>
						<c:if test="${isStaff }">
							<button class="noticebtn" onclick="location.href='noticeWrite'">글작성</button>
						</c:if>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>	
</body>
</html>