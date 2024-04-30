<%@page import="com.namuuniv.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.namuuniv.dao.SearchDAO"%>
<%@page import="com.namuuniv.vo.StaffVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="dao" class="com.namuuniv.dao.SearchDAO" scope="session"/>
    <%
		request.setCharacterEncoding("UTF-8");

    	String id = request.getParameter("id");
    	
		StaffVO svo = SearchDAO.staffOne(id);
		System.out.println("교직원 svo : " + svo);    
		session.setAttribute("svo", svo); //세션에 저장
		
		SqlSession ss = DBService.getFactory().openSession();

		ss.selectOne("staff.staffOne", id);
		
		StaffVO vo = ss.selectOne("staff.staffOne", id);

		ss.close();
		
		System.out.println(":: vo: " + vo);

		//session에 등록하여 수정, 삭제에서 사용
		session.setAttribute("StaffVO", vo);
	%>
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
		location.href="staffProfileUpdate.jsp?id=${svo.id}"; //수정화면으로 이동
	}
</script>
</head>
<body>
	<jsp:include page="../../partials/navTop.jsp"></jsp:include>
	<div class="mid">
	<jsp:include page="../../partials/sideNav.jsp"></jsp:include> 
			<div class="maintop">교직원 상세 정보</div>
			
			<!-- Page content -->
			<div class="main">
				<div class="container">
					<table class="profile">
						<tbody>
							<tr>
								<td>이름</td>
								<td>${svo.name }</td>
								<td>부서</td>
								<td>${svo.dept }</td>
							</tr>
							<tr>
								<td>생년월일</td>
								<td>${svo.birthDate }</td>
								<td>교번</td>
								<td>${svo.id }</td>
							</tr>
							<tr>
								<td>전화번호</td>
								<td>${svo.tel }</td>
								<td>주소</td>
								<td>${svo.address }</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colpsan="4"><input type="button" value="수정" onclick="modify_go()"></td>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
		</div>
</body>
</html>