<%@page import="com.namuuniv.vo.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	UsersVO user = (UsersVO) session.getAttribute("user");
	String role = user.getRole();
%>
    <div >
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
