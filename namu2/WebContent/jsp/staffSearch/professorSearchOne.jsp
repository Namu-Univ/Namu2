<%@page import="com.namuuniv.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.namuuniv.dao.SearchDAO"%>
<%@page import="com.namuuniv.vo.ProfessorVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	    <%    	
		request.setCharacterEncoding("UTF-8");
	    
    	String id = request.getParameter("id");
    	
		ProfessorVO svo = SearchDAO.professorOne(id);
		System.out.println("교수 svo : " + svo);    
		session.setAttribute("svo", svo); //세션에 저장
		
		SqlSession ss = DBService.getFactory().openSession();

		ss.selectOne("staff.professorOne", id);
		
		ProfessorVO vo = ss.selectOne("staff.professorOne", id);
		ss.close();
		
		System.out.println(":: vo: " + vo);

		session.setAttribute("ProfessorVO", vo);
		
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교수 상세 정보</title>
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
		location.href="professorProfileUpdate.jsp?id=${svo.id}"; //수정화면으로 이동
	}
</script>
</head>
<body>
	<jsp:include page="../../partials/navTop.jsp"></jsp:include>
	<div class="mid">
	<jsp:include page="../../partials/sideNav.jsp"></jsp:include> 
			<div class="maintop">교수 조회</div>
			
			<div class="main">
				<div class="container">
					<table class="profile">
						<tbody>
							<tr>
								<td>이름</td>
								<td>${svo.name }</td>
								<td>단과대</td>
								<td>${svo.college }</td>
							</tr>
							<tr>
								<td>생년월일</td>
								<td>${svo.birthDate }</td>
								<td>학과</td>
								<td>${svo.deptName }</td>
							</tr>
							<tr>
								<td>전화번호</td>
								<td>${svo.tel }</td>
								<td>교번</td>
								<td>${svo.id }</td>
							</tr>
							<tr>
								<td>주소</td>
								<td>${svo.address } </td>
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