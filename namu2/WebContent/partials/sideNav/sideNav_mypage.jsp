<%@page import="com.namuuniv.vo.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
    .sidenav {
        padding: 20px;
    }
    
    .sidenavTitle {
        font-weight: bold;
        margin-bottom: 10px;
    }
    
    .sidenav a {
        display: block;
        margin-bottom: 10px;
        text-decoration: none;
        color: #333;
    }
    
    .sidenav a:hover {
        color: #0066ff;
    }
</style>
<%
	UsersVO user = (UsersVO) session.getAttribute("user");
	String role = user.getRole();
%>

<!-- 내정보 -->
<div class="maintop">
	<div class="sidenav">
		<div class="sidenavTitle"> 내정보 </div>
<%
		if (role.equals("student")) {
%>
		<a href="mypagePatial/student.jsp">내정보</a>
<% 
		} else if (role.equals("staff")) {
%>
		<a href="mypagePatial/staff.jsp">내정보</a>	
<%
		} else if (role.equals("professor")) {
%>
		<a href="mypagePatial/professor.jsp">내정보</a>
<%
		}
%>
    	<a href="editMyPage">정보수정</a>
	</div>
</div>