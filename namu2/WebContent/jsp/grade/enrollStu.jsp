<%@page import="com.namuuniv.vo.SubjectVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강중인 학생</title>
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
						<th>강의명</th>
						<th>강의실</th>
						<th>이수학점</th>
						<th>강의시간</th>
						<th>성적</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${subList}" var="subject">
						<tr onclick="location.href='enrollStu'">
							<td>${subject.id }</td>
							<td>${subject.year }</td>
							<td>${subject.semester }</td>
							<td>${subject.deptName}</td>
							<td>${subject.name }</td>
							<td>${subject.room }</td>
							<td>${subject.grades }</td>
							<td>${subject.time }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
		</div>
	</div>
</body>
</html>