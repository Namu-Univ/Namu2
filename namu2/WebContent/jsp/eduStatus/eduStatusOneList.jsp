<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.namuuniv.dao.EduStatusDAO"%>
<%@ page import="com.namuuniv.vo.EduStatusVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 휴학신청서 ${absence.idx }</title>
<style>

/* 	CSS시트 및 Top nav , side nav 적용처리 */

</style>
</head>
<body>
	${absence.idx }
	<br> ${absence.id }
	<br> ${absence.status }
	<br> ${absence.startYear }
	<br> ${absence.startSemester }
	<br> ${absence.finishYear }
	<br> ${absence.finisthSemester }
	<br> ${absence.approvalStatus }
	<br> ${absence.reporingDate }
	<br>
	<%
	System.out.println(request.getParameter("idx"));
	EduStatusVO evo = EduStatusDAO.eduStatusSelOne(Integer.parseInt(request.getParameter("idx")));
	String status = evo.getApprovalStatus();
	%>
	<%
	if (status.equals("wait")) {
	%>
	<button class="checkData" type="button"
		onClick="location.href='eduStatus?type=process&idx=${absence.idx}&check=approve'">승인</button>
	<button class="checkData" type="button"
		onClick="location.href='eduStatus?type=process&idx=${absence.idx}&check=reject'">반려</button>
	<%
	}
	%>
</body>
</html>