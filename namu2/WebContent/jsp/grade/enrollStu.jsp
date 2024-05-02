<%@page import="com.namuuniv.vo.EnrollStuVO"%>
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
	
	var msg = '<%=(String)session.getAttribute("resMsg")%>';
	if (msg !== 'null' && msg !== null && msg !== '') {
	    window.onload = function() {
	        alert(msg); 
	        <%session.removeAttribute("resMsg"); %>
	    }
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
        	<%
        	String resInsert = (String)session.getAttribute("resInsert");
        	if (resInsert == null) {
        		String subName = (String)request.getParameter("subName");
	            int year = Integer.parseInt(request.getParameter("year"));
	            int semester = Integer.parseInt(request.getParameter("semester"));
        	%>
	        		<div><%=year%> - <%=semester%> <%=subName%></div>
	        <%
        	} else {
        		EnrollStuVO vo = (EnrollStuVO)session.getAttribute("remStuSub");
        		%>
        			<div><%=vo.getYear()%> - <%=vo.getSemester()%> <%=vo.getSubName()%></div>
        		<%
        	}
        	%>
        	
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
					    <form id="form" action="infoGrade" method="POST">
					        <input type="hidden" name="stuId" id="stuIdInput">
					        <input type="hidden" name="stuName" id="stuNameInput">
					    </form>
					    <tr>
					        <td>${enrollStu.idx}</td>
					        <td>${enrollStu.grade}</td>
					        <td>${enrollStu.semester}</td>
					        <td>${enrollStu.stuId}</td>
					        <td>${enrollStu.deptName}</td>
					        <td>${enrollStu.stuName}</td>
					        <td>${enrollStu.tel}</td>
					        <td>
					        	<c:choose>
							        <c:when test="${enrollStu.gender eq 'M'}">
							        	남
							        </c:when>
							        <c:when test="${enrollStu.gender eq 'F'}">
							        	여
							        </c:when>
						    	</c:choose>
					        </td>
					        <td>
						        <c:choose>
							        <c:when test="${enrollStu.rate == null}">
							        	<!-- 성적 존재하지 않을 시 -->
							            <button onclick="remStuId('${enrollStu.stuId}', '${enrollStu.stuName}')">등록</button>
							        </c:when>
							        <c:otherwise>
							           	<!-- 성적 존재 시-->
							            ${enrollStu.rate}
							        </c:otherwise>
						    	</c:choose>
					        </td>
					    </tr>
					</c:forEach>

				</tbody>
			</table>
			
		</div>
	</div>
</body>
</html>