<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<jsp:include page="../css/loginCss.jsp"></jsp:include>
</head>
<body>
	<div class="container">
		<div id="loginForm">
			<div id="logo">
				<img src="/namu2/css/img/namu_logo.png" alt="namuLogo"/>
				<p>나무대학교</p>
			</div>
			<form action="/namu2/login" method="post"> <!-- 절대경로 -->
		    	<input type="text" id="id" placeholder="아이디" name="id">
			    <input type="password" id="password" placeholder="비밀번호" name="password">
	
				  <button type="submit">로그인</button>
			</form>
				  <!-- 로그인 실패 시 처리 -->
				  <% 
				  String errorMsg = (String)session.getAttribute("errorMsg");
				  
				  if(errorMsg != null) { 
				  %>
				  <div id="errorMsg" style="color:red;"><%=errorMsg %></div>
				 <% 
				 session.setAttribute("errorMsg", null);
				 } 
				 %>
				  
		</div>
	</div>
</body>
</html>