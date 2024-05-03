<%@page import="com.namuuniv.vo.StudentVO"%>
<%@page import="com.namuuniv.vo.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
UsersVO user = (UsersVO) session.getAttribute("user");
String role = user.getRole();
StudentVO vo = (StudentVO)session.getAttribute("vo");
%>
<div class="top">
	<a>[&nbsp학생&nbsp] &nbsp <%=vo.getName()%>님</a>
	<a href="logout" class="menu-item">로그아웃</a>
</div>
<div class="nav">
    <div class="logo">
        <img src="https://res.cloudinary.com/djlee4yl2/image/upload/v1714042611/logo/NamuUnivLogo_ixcxdw.png" alt="나무대학교 로고">나무대학교
    </div>
    <div class="topnav">
        <a href="mypage">내정보</a>
        <a href="StudentSemesterOff">휴학신청</a>
        <a href="subject">성적조회</a>
        <a href="noticeList">공지사항</a>
    </div>
</div>