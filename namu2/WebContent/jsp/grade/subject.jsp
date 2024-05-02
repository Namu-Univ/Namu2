<%@page import="com.namuuniv.vo.ProSubjectVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의</title>
<!-- <link href="../css/frame.css" rel="stylesheet" type="text/css"> -->
<jsp:include page="../../css/frameCss.jsp"/>
<script>
	function remSubName(subId, subName, year, semester) {
	    document.getElementById('subIdInput').value = subId;
	    document.getElementById('subNameInput').value = subName;
	    document.getElementById('yearInput').value = year;
	    document.getElementById('semesterInput').value = semester;
	    document.getElementById('form').submit();
	}
	

</script>
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
					<c:forEach items="${proSub}" var="proSub">
						<form id="form" action="enrollStu" method="POST">
						    <input type="hidden" name="subId" id="subIdInput">
						    <input type="hidden" name="subName" id="subNameInput">
						    <input type="hidden" name="year" id="yearInput">
						    <input type="hidden" name="semester" id="semesterInput">
						</form>
						<tr onclick="remSubName('${proSub.subId }', '${proSub.subName}', '${proSub.year}', '${proSub.semester}')">
							<td>${proSub.subId }</td>
							<td>${proSub.year }</td>
							<td>${proSub.semester }</td>
							<td>${proSub.deptName}</td>
							<td>${proSub.subName }</td>
							<td>${proSub.room }</td>
							<td>${proSub.grades }</td>
							<td>${proSub.time }</td>
						</tr>

					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>