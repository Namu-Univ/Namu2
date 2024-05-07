<%@page import="com.namuuniv.vo.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.sidenav {
	position: fixed;
	top: 120px; /* 원하는 위치로 조절하세요 */
	left: 30px; /* 원하는 위치로 조절하세요 */
}

.sidenav {
	padding: 20px;
}

.sidenavTitle {
	margin-bottom: 10px;
}

.sidenav a {
	display: block;
	margin-bottom: 10px;
	text-decoration: none;
	color: #333;
	/
}

.sidenav a:hover {
	color: #006600;
}

#mypageTop {
	border-style: none none none none !important;
}
</style>
<%
UsersVO user = (UsersVO) session.getAttribute("user");
String role = user.getRole();
%>

<!-- 내정보 -->
<div class="maintop" id="mypageTop">
	<div class="sidenav">
		<div class="sidenavTitle">내정보</div>
		<a href="mypage">내정보</a>
		<a href="editMyPage">정보수정</a>
	</div>
</div>