<%@page import="com.namuuniv.vo.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴학 신청</title>
<jsp:include page="../../css/frameCss.jsp"/>
<style>
	.container {
		margin: 30px auto 0;
		border: 1px solid black;
		width: 65%;
		text-align: center;
	}
	table {
		margin: 0 auto;
	}
	table tr,td {
		padding: 7px;
	}
	.btn {
		width: 30px;
		margin: 30px auto 0;
	}
	#title {
		font-weight: 600;
		font-size: 2rem;
	}
	#footText {
		font-size: 1.2rem;
	}
	table input {
		width: 120px;
		border: none;
	}
</style>
</head>
<body>
	<jsp:include page="../../partials/navTop/studentNavTop.jsp"/>
    <div class="mid">
    <jsp:include page="../../partials/sideNav/sideNav_semesteroff.jsp"/>
    			<div class="maintop">휴학 신청</div>
			
			<!-- Page content -->
			<div class="main">
				<div class="container">
					<p id="title">휴학신청서</p>
					<form action="StudentSemesterOff" method="post" >
						<table>
							<tr>
								<td>이름</td>
								<td><input type="text" name="name" readonly value="${vo.name }"></td>
								<td>학번</td>
								<td><input type="text" name="id" readonly value="${vo.id }"></td>
							</tr>
							<tr>
								<td>생년월일</td>
								<td><input type="text" name="birthDate" readonly value="${vo.birthDate }"></td>
								<td>연락처</td>
								<td><input type="text" name="tel" readonly value="${vo.tel }"></td>
							</tr>
							<tr>
								<td>전공</td>
								<td><input type="text" name="deptName" readonly value="${vo.deptName }"></td>
								<td>학년</td>
								<td><input type="text" name="grade" readonly value="${vo.grade }"></td>
							</tr>
							<tr>
								<td>입학일</td>
								<td><input type="text" name="entranceDate" readonly value="${vo.entranceDate }"></td>
								<td>학기</td>
								<td><input type="text" name="semester" readonly value="${vo.semester }"></td>
							</tr>
							<tr>
								<td>기간</td>
								<td colspan="3">
									  <select id="sYear" name="sYear">
									    <option value="2024">2024</option>
									  </select>
									  <select id="sSemester" name="sSemester">
									    <option value="1">1학기</option>
									    <option value="2">2학기</option>
									  </select>
									  -
									  <select id="eYear" name="eYear">
									    <option value="2024">2024</option>
									    <option value="2025">2025</option>
									    <option value="2026">2026</option>
									  </select>
									  <select id="eSemester" name="eSemester">
									    <option value="1">1학기</option>
									    <option value="2">2학기</option>
									  </select>
								</td>
							</tr>
					</table>
					<p id="footText">위와 같이 휴학하고자 하니 승인 바랍니다.</p>
				</div>
				<div class="btn"><input type="button" value="신청" onclick="submit()"></div>
				</form>
			</div>
		</div>
    
    </div>   
</body>
</html>