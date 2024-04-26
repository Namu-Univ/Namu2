<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 휴학 신청 목록 조회</title>
</head>
<body>
	<c:forEach var="listData" items="${list }">
		
		${listData.idx }
		${listData.id }
		${listData.status }
		${listData.startYear }
		${listData.startSemester }
		${listData.finishYear }
		${listData.finisthSemester }
		${listData.approvalStatus }
		${listData.reporingDate }
		<button class="checkData" type="button" onClick="location.href='eduStatus?type=check&idx=${listData.idx}'">Add to favorites</button>
		<br>
	</c:forEach>
</body>
</html>