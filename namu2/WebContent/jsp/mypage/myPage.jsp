<%@page import="com.namuuniv.vo.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보 조회</title>
<!-- <link href="../css/frame.css" rel="stylesheet" type="text/css"> -->
</head>
<body>
	<jsp:include page="../../css/frameCss.jsp" />
	<jsp:include page="../../css/mypageCSS.jsp" />
	<%
	UsersVO user = (UsersVO) session.getAttribute("user");
	String role = user.getRole();
	%>
	<jsp:include page="../../partials/navTop/navTop.jsp" />
	<div class="mid">
		<jsp:include page="../../partials/sideNav/sideNav_mypage.jsp" />
		<div class="maintop">내 정보</div>
		<!-- Page content -->
		<div class="main">
			<div class="rectangle">
				<%
				if (role.equals("student")) {
				%>
				<jsp:include page="mypagePatial/student.jsp" />
				<%
				} else if (role.equals("staff")) {
				%>
				<jsp:include page="mypagePatial/staff.jsp" />
				<%
				} else if (role.equals("professor")) {
				%>
				<jsp:include page="../mypage/mypagePatial/professor.jsp" />
				<%
				}
				%>
			</div>
		</div>
	</div>
</body>
</html>
