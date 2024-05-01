<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
    .top {
	background-color: #349525;
	height: 2%;
	text-align: right;
}

.top a {
	text-decoration: none;
	color: #ffffff;
	margin-right: 30px;
}

.menu-item {
	font-size: 15px;
}

.nav {
	display: flex;
	item-align: center;
	border-style: none none solid none;
	border-color: #ccc;
	justify-content: space-between;
	line-height: 30px;
}

.logo {
	font-weight: 600;
	font-size: 1.4rem;
	margin-top: 10px;
	margin-left: 20px;
}

.logo img {
	height: 30px;
}

/* The navbar container */
.topnav {
	overflow: hidden;
	background-color: #fff;
}

/* Navbar links */
.topnav a {
	float: left;
	display: block;
	color: black;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	margin-left: 10px;
	margin-right: 20px;
}

/* Links - change color on hover */
.topnav a:hover {
	color: #349525;
}
</style>
<div class="top">
	<a href="logout">로그아웃</a>
</div>
<div class="nav">
    <div class="logo">
        <img src="https://res.cloudinary.com/djlee4yl2/image/upload/v1714042611/logo/NamuUnivLogo_ixcxdw.png" alt="나무대학교 로고">나무대학교
    </div>
    <div class="topnav">
        <a href="partials/sideNav_mypage.jsp">내정보</a>
        <a href="partials/sideNav_myLecture.jsp">강의</a>
        <a href="partials/sideNav_notivce.jsp">공지사항</a>
    </div>
</div>