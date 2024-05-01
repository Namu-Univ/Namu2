<%@page import="com.namuuniv.vo.ProSubjectVO"%>
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
<script>
	function remStuId(stuId, stuName) {
	    document.getElementById('stuIdInput').value = stuId; 
	    document.getElementById('stuNameInput').value = stuName; 
	    document.getElementById('form').submit();
	}

</script>
	
<body>

<jsp:include page="../../partials/ProNavTop.jsp"></jsp:include>
    <div class="mid">
    <!-- Side navigation -->
		<div class="sidenav">
		    <a href="subject">내 강의</a>
		</div>
        <!-- Page content -->
        <div class="main">
        	<div></div>
			<table border="1">
				<thead>
					<tr>
						<th>번호</th>
						<th>학년</th>
						<th>학기</th>
						<th>학번</th>
						<th>학과</th>
						<th>이름</th>
						<th>전화번호</th>
						<th>성별</th>
						<th>성적</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${enrollStu}" var="enrollStu">
					    <form id="form" action="infoGrade" method="GET">
					        <input type="hidden" name="stuId" id="stuIdInput">
					        <input type="hidden" name="stuName" id="stuNameInput">
					    </form>
					    <tr onclick="remStuId('${enrollStu.stuId}', '${enrollStu.stuName}')">
					        <td>${enrollStu.idx}</td>
					        <td>${enrollStu.grade}</td>
					        <td>${enrollStu.semester}</td>
					        <td>${enrollStu.stuId}</td>
					        <td>${enrollStu.deptName}</td>
					        <td>${enrollStu.stuName}</td>
					        <td>${enrollStu.tel}</td>
					        <td>${enrollStu.gender}</td>
					    </tr>
					</c:forEach>

				</tbody>
			</table>
			
		</div>
	</div>
</body>
</html>