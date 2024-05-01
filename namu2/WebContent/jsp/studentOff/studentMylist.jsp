<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴학 신청 목록</title>
<jsp:include page="../../css/frameCss.jsp"/>
<jsp:include page="../../css/tableCss.jsp"/>
</head>
<body>
	<jsp:include page="../../partials/navTop/studentNavTop.jsp"/>
    <div class="mid">
    <jsp:include page="../../partials/sideNav/sideNav_semesteroff.jsp"/>
    	<div class="maintop">휴학 신청 목록</div>
			<div class="main">
				<table border="1">
					<thead>
							<tr>
								<th>신청일</th>
								<th>시작일</th>
								<th>종료일</th>
								<th>상태</th>
							</tr>							
						</thead>
					<c:forEach var="vo" items="${list }">
						<tbody>
							<tr>
								<td>${vo.reporingDate }</td>
								<td>${vo.startYear }-${vo.startSemester }</td>
								<td>${vo.finishYear }-${vo.finishSemester }</td>
								<td>${vo.approvalStatus }</td>
							</tr>
						</tbody>
					</c:forEach>
					<c:if test="${empty list }">
					<tr>
						<td colspan="5">목록이 없습니다.</td>
					</tr>
					</c:if>
				</table>
			</div>
</body>
</html>