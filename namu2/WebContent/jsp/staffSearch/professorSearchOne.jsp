<%@page import="com.namuuniv.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.namuuniv.dao.SearchDAO"%>
<%@page import="com.namuuniv.vo.ProfessorVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교수 상세 정보</title>
<jsp:include page="../../css/frameCss.jsp"/>
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
<script>
	function modify_go(){
		location.href="StaffUpdateProfessor"; //수정화면으로 이동
	}
</script>
</head>
<body>
	<jsp:include page="../../partials/navTop/staffNavTop.jsp"/>
	<div class="mid">
	<jsp:include page="../../partials/sideNav/sideNav_staffSearch.jsp"/> 
			<div class="maintop">교수 조회</div>
			
			<div class="main">
				<div class="container">
					<table class="profile">
						<tbody>
							<tr>
								<td>이름</td>
								<td>${prvo.name }</td>
								<td>단과대</td>
								<td>${prvo.college }</td>
							</tr>
							<tr>
								<td>생년월일</td>
								<td>${prvo.birthDate }</td>
								<td>학과</td>
								<td>${prvo.deptName }</td>
							</tr>
							<tr>
								<td>전화번호</td>
								<td>${prvo.tel }</td>
								<td>교번</td>
								<td>${prvo.id }</td>
							</tr>
							<tr>
								<td>주소</td>
								<td>${prvo.address } </td>
								<td></td>
								<td></td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="4"><input type="button" value="수정" onclick="modify_go()"></td>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
</body>
</html>