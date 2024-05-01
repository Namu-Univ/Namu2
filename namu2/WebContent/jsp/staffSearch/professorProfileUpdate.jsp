<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교수 정보 수정</title>
<jsp:include page="../../css/frameCss.jsp"></jsp:include>
<script>
	function save_go(frm){
		frm.action = "../../StaffUpdateProfessor";
		frm.submit();
	}
	function cancel(){
		location.href="professorSearchOne.jsp?id=${svo.id }";
	}
</script>
<style>
	table {
		margin: 0 auto;
	}
	td, tr {
		padding: 10px;
	}
	tfoot tr td {
		text-align: center;
		padding: 10px;
	}
</style>
</head>
<body>
	<jsp:include page="../../partials/navTop.jsp"></jsp:include>
	<div class="mid">
	<jsp:include page="../../partials/sideNav_staffSearch.jsp"></jsp:include> 
			<div class="maintop">교수 정보 수정</div>
			
			<div class="main">
				<div class="container">
					<form method="post">
						<table class="profile">
							<tbody>
								<tr>
									<td>이름</td>
									<td><input type="text" name="name" value="${ProfessorVO.name }"></td>
									<td>학과</td>
									<td>${ProfessorVO.deptName }</td>
								</tr>
								<tr>
									<td>생년월일</td>
									<td><input type="text" name="birthDate" value="${ProfessorVO.birthDate }"></td>
									<td>교번</td>
									<td>${svo.id }</td>
								</tr>
								<tr>
									<td>전화번호</td>
									<td><input type="text" name="tel" value="${ProfessorVO.tel}"></td>
									<td>주소</td>
									<td><input type="text" name="address" value="${ProfessorVO.address }"></td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td>
										<input type="button" value="수정" onclick="save_go(this.form)">
										<input type="button" value="취소"onclick="cancel()">
										<input type="hidden" name="id" value="${ProfessorVO.id }">
									</td>
								</tr>
							</tfoot>
						</table>
					</form>
				</div>
			</div>
</body>
</html>