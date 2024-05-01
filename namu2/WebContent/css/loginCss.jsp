<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<style>
html, body {
	position: relative;
	width: 1440px;
	height: 1024px;
}

body {
	width:100%;
 	height:100%;
	justify-content: center;
	background-image: url("/namu2/css/img/login_background.png");
	background-size : 100% 100%;
}

#loginForm {
	background-size: cover;
	position: relative;
	width: 474px;
	height: 673px;
	left: 50%;
    transform: translateX(-50%);
	background: #FFFFFF;
	border-radius: 20px;
	top: 15%;
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


#id {
	position: absolute;
	width: 326px;
	height: 82px;
	top: 250px;
	left: 15%;
	justify-content: center;
	background: #D9D9D9;
	border-radius: 15px;
	border:none;
}

#password {
	position: absolute;
	width: 326px;
	height: 82px;
	top: 350px;
	left: 15%;
	justify-content: center;
	background: #D9D9D9;
	border-radius: 15px;
	border:none;
}

#login input::placeholder {
	left: 20px;
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

errorMsg {
	top: 500px;
}
</style>
