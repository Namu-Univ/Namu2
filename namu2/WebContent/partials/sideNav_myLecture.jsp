<%@page import="com.namuuniv.vo.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	UsersVO user = (UsersVO) session.getAttribute("user");
	String role = user.getRole();
%>
    
<!-- 내 강의 -->
<div class="sidenav">
	<div class="sidenavTitle"> 강의 </div>
	<a href="#">내강의</a>
<%
	if (role.equals("student")) {
%>
	<a href="#">내강의</a>
<% 
	} else if (role.equals("professor")) {
%>
	<a href="#">내강의</a>
<%
	}
%>
</div>
