<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교수 등록</title>
</head>
<body>
<jsp:include page="../../css/frameCss.jsp"/>
<jsp:include page="../../css/registrationCss.jsp"/>
	<jsp:include page="../../partials/navTop/staffNavTop.jsp"/>
		<div class="mid">
		<jsp:include page="../../partials/sideNav/sideNav_staffSearch.jsp"/>	
			<div class="maintop">교수 등록</div>
			<div class="main">
				<div class="container">
				<form action="addProfessor" method="post">
					<table>
						<tr>
							<td><label for="name">이름</label></td>
							<td><input type="text" id="name" name="name" required></td>
						</tr>
						<tr>
							<td><label for="birthDate">생년월일</label></td>
							<td><input type="date" id="birthDate" name="birthDate" required></td>
						</tr>
						<tr>
							<td><label>성별</label></td>
							<td>
							<div class="radio">
								<input type="radio" id="male" name="gender" value="M" checked>남성
							</div>
							<div class="radio">
								<input type="radio" id="female" name="gender" value="F">여성
							</div>
							</td>
						</tr>
						<tr>
							<td><label for="address">주소</label></td>
							<td><input type="text" id="address" name="address"></td>
						</tr>
						<tr>
							<td><label for="tel">전화번호</label></td>
							<td><input type="text" id="tel" name="tel" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="000-0000-0000"></td>
						</tr>
						<tr>
							<td><label for="hireDate">고용일</label></td>
							<td><input type="date" id="hireDate" name="hireDate"></td>
						</tr>
						<tr>
							<td><label for="deptId">학과</label></td>
							<td><select id="deptId" name="deptId" required>
								<option value="" selected disabled>학과를 선택하세요</option>
								<c:forEach items="${departments}" var="dept">
									<option value="${dept.id}">${dept.name}</option>
								</c:forEach>
							</select></td>
						</tr>
					</table>
					<div class="button">
						<input type="submit" value="등록">
					</div>
				</form>
				</div>
			</div>
		</div>
	<script>
		window.onload = function() {
			var result = "<c:out value='${result}'/>";
			if (result == "success") {
				if (confirm('등록이 완료되었습니다. 계속 등록하시겠습니까?')) {
					window.location.href = window.location.href;
				} else {
					window.location.href = 'SearchProfessor';
				}
			} else if (result == "fail") {
				alert('등록에 실패했습니다.');
			}
		}
	</script>
</body>
</html>
