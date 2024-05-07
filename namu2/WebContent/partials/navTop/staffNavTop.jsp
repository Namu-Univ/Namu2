<%@page import="com.namuuniv.vo.StaffVO"%>
<%@page import="com.namuuniv.vo.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
UsersVO user = (UsersVO) session.getAttribute("user");
String role = user.getRole();
StaffVO vo = (StaffVO)session.getAttribute("vo");
%>
<div class="top">
	<a>[&nbsp교직원&nbsp] &nbsp <%=vo.getName()%>님</a>
    <a href="logout" class="menu-item">로그아웃</a>
</div>

<div class="nav">
    <div class="logo">
        <img src="https://res.cloudinary.com/djlee4yl2/image/upload/v1714042611/logo/NamuUnivLogo_ixcxdw.png" alt="나무대학교 로고">
        나무대학교
    </div>
    <div class="topnav">
        <a href="mypage">내정보</a>
        <a href="SearchStudent">등록/조회</a>
        <a href="eduStatus?type=list">학적관리</a>
        <a href="noticeList">공지사항</a>
    </div>
</div>
