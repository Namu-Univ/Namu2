<%@page import="com.namuuniv.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.namuuniv.dao.SearchDAO"%>
<%@page import="com.namuuniv.vo.StaffVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교직원 상세 정보</title>
<jsp:include page="../../css/frameCss.jsp"></jsp:include>
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
		location.href="StaffUpdateStaff"; //수정화면으로 이동
	}
</script>
</head>
<body>
	<jsp:include page="../../partials/navTop/staffNavTop.jsp"/>
	<div class="mid">
	<jsp:include page="../../partials/sideNav/sideNav_staffSearch.jsp"/> 
			<div class="maintop">교직원 상세 정보</div>
			
			<!-- Page content -->
			<div class="main">
				<div class="container">
					<table class="profile">
						<tbody>
							<tr>
								<td>이름</td>
								<td>${stvo.name }</td>
								<td>부서</td>
								<td>${stvo.dept }</td>
							</tr>
							<tr>
								<td>생년월일</td>
								<td>${stvo.birthDate }</td>
								<td>교번</td>
								<td>${stvo.id }</td>
							</tr>
							<tr>
								<td>전화번호</td>
								<td>${stvo.tel }</td>
								<td>주소</td>
								<td>${stvo.address }</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="4"><input type="button" value="수정" onclick="modify_go()">
								</td>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
		</div>
</body>
</html>