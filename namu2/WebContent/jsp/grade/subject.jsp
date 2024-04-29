<%@page import="com.namuuniv.vo.SubjectVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보 조회</title>
<!-- <link href="../css/frame.css" rel="stylesheet" type="text/css"> -->
<jsp:include page="../../css/frameCss.jsp"/>
</head>
<body>

<jsp:include page="../../partials/ProNavTop.jsp"></jsp:include>
    <div class="mid">
    <!-- Side navigation -->
		<div class="sidenav">
		    <a href="subject">내 강의</a>
		</div>
        <!-- Page content -->
        <div class="main">

			<table border="1">
				<thead>
					<tr>
						<th>번호</th>
						<th>연도</th>
						<th>학기</th>
						<th>학과</th>
						<th>강의명</th>
						<th>강의실</th>
						<th>이수학점</th>
						<th>강의시간</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${stuList}" var="grade">
						<tr>
							<td>${grade.id }</td>
							<td>${grade.year }</td>
							<td>${grade.deptName}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>