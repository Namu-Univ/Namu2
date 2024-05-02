<%@page import="com.namuuniv.vo.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의</title>
<!-- <link href="../css/frame.css" rel="stylesheet" type="text/css"> -->
<jsp:include page="../../css/frameCss.jsp"/>
</head>
<body>
<%
UsersVO user = (UsersVO) session.getAttribute("user");
String role = user.getRole();
%>
<jsp:include page="../../partials/ProNavTop.jsp"></jsp:include>
    <div class="mid">
    <!-- Side navigation -->
		<div class="sidenav">
		    <a href="subject">내 강의</a>
		</div>
        <!-- Page content -->
        <div class="main">

<%
	if (role.equals("student")) {
%>
	<jsp:include page="subjectPartial/student.jsp"/>
<% 
	} else if (role.equals("professor")) {
%>
	<jsp:include page="subjectPartial/professor.jsp"/>
<%
	}
%>
		</div>
	</div>
</body>
</html>