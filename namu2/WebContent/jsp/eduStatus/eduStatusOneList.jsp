<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.namuuniv.dao.EduStatusDAO"%>
<%@ page import="com.namuuniv.vo.EduStatusVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 휴학신청서 ${absence.idx }</title>
<jsp:include page="../../css/frameCss.jsp" />
<style>

/* CSS시트 및 Top nav , side nav 적용처리 */

/* 중앙 정렬 및 여백 추가 */
.mid {
	margin: 20px auto;
	width: 80%;
}

/* 테이블 스타일 */
table {
	border-collapse: collapse;
	width: 60%; /* 전체 너비의 100%로 설정 */
	margin-left: auto; /* 오른쪽으로 이동 */
	margin-right: auto; /* 왼쪽으로 이동 */
}

th, td {
	border: 1px solid #ddd;
	padding: 10px;
	text-align: left;
}

th {
	background-color: #f2f2f2;
	font-weight: bold;
}

/* 확인 버튼 스타일 */
.checkData {
	background-color: #4CAF50;
	color: white;
	padding: 8px 16px;
	border: none;
	border-radius: 5px;
	text-decoration: none;
	cursor: pointer;
	margin-right: 10px;
}

.checkData:hover {
	background-color: #45a049;
}

/* 버튼 컨테이너 스타일 */
.button-container {
	text-align: center; /* 버튼을 가운데로 정렬 */
	margin-top: 10px; /* 버튼 위쪽 여백 추가 */
}

/* 제목 컨테이너 스타일 */
header {
	text-align: left; /* 텍스트를 좌측으로 정렬 */
	margin-bottom: 10px;
	font-size: 20px;
	font-weight: bold;
	color: #333;
}

/* 구분선 스타일 */
.divider {
	border-top: 1px solid #ddd; /* 테이블 가로선과 동일하게 수정 */
	margin-bottom: 10px; /* 조정된 여백 */
}
</style>
</head>
<body>
	<jsp:include page="../../partials/navTop/staffNavTop.jsp"/>
	<div class="mid">
		<jsp:include page="../../partials/sideNav/sideNav_staffEduStatus.jsp"/>
		<div class="maintop">학적 관리</div>
   	    <div class="main">
		<!-- 구분선 추가 -->
		<table>
			<tr>
				<th>항목</th>
				<th>내용</th>
			</tr>
			<tr>
				<td>번호</td>
				<td>${absence.idx }</td>
			</tr>
			<tr>
				<td>학번</td>
				<td>${absence.id }</td>
			</tr>
			<tr>
				<td>상태</td>
				<td>${absence.status }</td>
			</tr>
			<tr>
				<td>시작 연도</td>
				<td>${absence.startYear }</td>
			</tr>
			<tr>
				<td>시작 학기</td>
				<td>${absence.startSemester }</td>
			</tr>
			<tr>
				<td>종료 연도</td>
				<td>${absence.finishYear }</td>
			</tr>
			<tr>
				<td>종료 학기</td>
				<td>${absence.finishSemester }</td>
			</tr>
			<tr>
				<td>승인 상태</td>
				<td>${absence.approvalStatus }</td>
			</tr>
			<tr>
				<td>신청일</td>
				<td>${absence.reporingDate }</td>
			</tr>
		</table>
		<%
		System.out.println(request.getParameter("idx"));
		EduStatusVO evo = EduStatusDAO.eduStatusSelOne(Integer.parseInt(request.getParameter("idx")));
		String status = evo.getApprovalStatus();
		%>
		<%
		if (status.equals("대기")) {
		%>
		<!-- 버튼을 테이블 아래쪽에 배치 -->
		<div class="button-container">
			<button class="checkData" type="button"
				onClick="location.href='${pageContext.request.contextPath}/eduStatus?type=process&idx=${absence.idx}&check=approve'">승인</button>
			<button class="checkData" type="button"
				onClick="location.href='${pageContext.request.contextPath}/eduStatus?type=process&idx=${absence.idx}&check=reject'">반려</button>
		</div>
		<%
		}
		%>
    </div> <!-- .main 닫기 -->
  </div> <!-- .mid 닫기 -->
</body>
</html>