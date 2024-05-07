<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
body {
	background-image: url("/namu2/css/img/login_background.png");
	background-size: cover;
}

.container {
	position: relative;
	display: flex;
    justify-content: center;
    align-items: center; /* 추가: 수직 중앙 정렬을 위해 */
    height: 100vh; /* 추가: 브라우저 창의 전체 높이 */
}

#loginForm {
	align-items: center;
	justify-content: center;
	background-size: cover;
	position: relative;
	width: 474px;
	height: 673px;
	background: #FFFFFF;
	border-radius: 20px;
}

#logo {
	position: absolute;
	display: flex;
	left: 50%;
	transform: translateX(-50%);
  	justify-content: center;
  	margin-top: 100px;
}

#logo p {
	font-size: 20px;
	font-weight: bold;
}

#id, #password {
	position: absolute;
	width: 326px;
	height: 82px;
	left: 15%;
	justify-content: center;
	background: #D9D9D9;
	border-radius: 15px;
	border:none;
}

#id {
	top: 250px;
}

#password {
	top: 350px;
}

button {
	position: absolute;
	width: 326px;
	height: 82px;
	top: 450px;
	left: 15%;
	font-size: 20px;
	color: #FFFFFF;
	background: #349525;
	border-radius: 15px;
	border:none;
}

button:hover {
	background: #4CA844;
	cursor: pointer;
}

#errorMsg {
	margin-top: 550px;
	text-align: center;
}

</style>
