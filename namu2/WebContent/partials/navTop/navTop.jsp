<%@page import="com.namuuniv.vo.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	UsersVO user = (UsersVO) session.getAttribute("user");
	String role = user.getRole();
%>

<div class="top">
	<a href="logout">로그아웃</a>
</div>
<div class="nav">
    <div class="logo">
        <img src="https://res.cloudinary.com/djlee4yl2/image/upload/v1714042611/logo/NamuUnivLogo_ixcxdw.png" alt="나무대학교 로고">나무대학교
    </div>
    <div class="topnav">
        <a href="#">내정보</a>
        <a href="jsp/studentOff/studentSemesterOff.jsp">휴학신청</a>
        <a href="#">등록/관리</a>
        <a href="#">공지사항</a>
        <%
			if (role.equals("student")) {
		%>
			<jsp:include page="../../partials/navTop/studentNavTop.jsp"/>
		<% 
			} else if (role.equals("staff")) {
		%>
			<jsp:include page="../../partials/navTop/staffNavTop.jsp"/>
		<%
			} else if (role.equals("professor")) {
		%>
			<jsp:include page="../../partials/navTop/professorNavTop.jsp"/>
		<%	
			}
		%>
    </div>
</div>
