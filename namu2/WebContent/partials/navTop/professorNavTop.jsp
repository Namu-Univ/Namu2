<%@page import="com.namuuniv.vo.ProfessorVO"%>
<%@page import="com.namuuniv.vo.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
UsersVO user = (UsersVO) session.getAttribute("user");
String role = user.getRole();
ProfessorVO vo = (ProfessorVO)session.getAttribute("vo");
%>
<div class="top">
	<a>[&nbsp교수&nbsp] &nbsp <%=vo.getName()%>님</a>
	<a href="logout">로그아웃</a>
</div>
<div class="nav">
    <div class="logo">
        <img src="https://res.cloudinary.com/djlee4yl2/image/upload/v1714042611/logo/NamuUnivLogo_ixcxdw.png" alt="나무대학교 로고">나무대학교
    </div>
    <div class="topnav">
        <a href="mypage">내정보</a>
        <a href="subject">강의</a>
        <a href="noticeList">공지사항</a>
    </div>
</div>