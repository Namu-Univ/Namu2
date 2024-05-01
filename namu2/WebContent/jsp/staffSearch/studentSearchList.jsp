<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 조회</title>
<jsp:include page="../../css/frameCss.jsp"></jsp:include>
<jsp:include page="../../css/tableCss.jsp"></jsp:include>
<style>
	form {
		text-align: center;
	}
</style>
</head>
<body>
	<jsp:include page="../../partials/navTop.jsp"></jsp:include>
	<div class="mid">
	<jsp:include page="../../partials/sideNav_staffSearch.jsp"></jsp:include> 
		<div class="maintop">학생 조회</div>
			<div class="main">
				<form action="../../SearchStudent" method="get">
					<select name="idx">
						<option value="0">이름</option>
						<option value="1">교번</option>
						<option value="2">전공</option>
					</select>
					<input type="text" name="keyword">
					<input type="submit" value="검색">
				</form>
				
				<table border="1">
					<thead>
							<tr>
								<th>학번</th>
								<th>이름</th>
								<th>전공</th>
								<th>연락처</th>
							</tr>							
						</thead>
					<c:forEach var="vo" items="${list }">
						
						<tbody>
							<tr>
								<td>${vo.id }</td>
								<td><a href="jsp/staffSearch/studentSearchOne.jsp?id=${vo.id}">${vo.name }</td>
								<td>${vo.deptName }</td>
								<td>${vo.tel }</td>
							</tr>							
						</tbody>
					</c:forEach>
					<c:if test="${empty list }">
					<tr>
						<td colspan="5">조회된 사람이 없습니다.</td>
					</tr>
					</c:if>
				</table>
			</div>
</body>
</html>