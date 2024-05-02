<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교직원 조회</title>
<jsp:include page="../../css/frameCss.jsp"/>
<jsp:include page="../../css/tableCss.jsp"/>
<style>
	form {
		text-align: center;
	}
</style>
</head>
<body>
	<jsp:include page="../../partials/navTop/staffNavTop.jsp"/>
	<div class="mid">
	<jsp:include page="../../partials/sideNav/sideNav_staffSearch.jsp"/> 
			<div class="maintop">교직원 조회</div>
			
			<div class="main">
				<form action="../../SearchStaff" method="get">
					<select name="idx">
						<option value="0">이름</option>
						<option value="1">교번</option>
						<option value="2">부서</option>
					</select>
					<input type="text" name="keyword">
					<input type="submit" value="검색">
				</form>
				
				<table border="1">
					<thead>
							<tr>
								<th>교번</th>
								<th>이름</th>
								<th>부서</th>
								<th>연락처</th>
							</tr>							
						</thead>
					<c:forEach var="vo" items="${list }">
						
						<tbody>
							<tr>
								<td>${vo.id }</td>
								<td><a href="jsp/staffSearch/staffSearchOne.jsp?id=${vo.id}">${vo.name }</td>
								<td>${vo.dept }</td>
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