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
<jsp:include page="../../css/enrollStuCss.jsp"/>
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

<jsp:include page="../../partials/navTop/professorNavTop.jsp"></jsp:include>
    <div class="mid">
		<jsp:include page="../../partials/sideNav/sideNav_myLecture.jsp"/>
			<div class="maintop">수강 중인 학생</div>
        		<div class="main">
        		<%
	        	String resInsert = (String)session.getAttribute("resInsert");
	        	String nextPage = (String)session.getAttribute("nextPage");
				nextPage = "nextPage";
				session.setAttribute("nextPage", nextPage);
				
	        	EnrollStuVO vo = (EnrollStuVO)session.getAttribute("remVo");
        		%>
        			<div class="subTitle"><%=vo.getYear()%> - <%=vo.getSemester()%> <%=vo.getSubName()%></div>
        		<hr>
        	
			<table>
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
							            <button class="register" onclick="remStuId('${enrollStu.stuId}', '${enrollStu.stuName}')">등록</button>
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
				<tfoot>
					<tr>
						<td colspan = "9">
							<div class="paging">
							<c:if test="{pvo.beginPage == 1}">
								<span class="disable">&laquo;</span>
							</c:if>
							<c:if test="{pvo.beginPage != 1}">
								
								<a href="enrollStu?cPage=${pvo.beginPage - 1}">&laquo;</a>
							</c:if>
								<c:if test="${pvo.nowBlock == 1}">
									<span class="disabled">&laquo;</span>
								</c:if>
								
								<c:forEach var="page" begin="${pvo.beginPage}" end="${pvo.endPage}">
									<c:choose>
										<c:when test="${page == pvo.nowPage}">
											<span>${page}</span>
										</c:when>
										<c:otherwise>
											<a href="enrollStu?cPage=${page}">${page}</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								
								<c:if test="${pvo.endPage < pvo.totalPage}">
									<a href="enrollStu?cPage=${pvo.endPage + 1}">&raquo;</a>
								</c:if>
								<c:if test="${pvo.endPage >= pvo.totalPage}">
									<span class="disable">&raquo;</span>
								</c:if>
							</div>
						</td>
					</tr>
				</tfoot>
			</table>
			
		</div>
	</div>
</body>
</html>