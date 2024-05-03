<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	form { position: relative; margin-left:100px;}
	
	table {
		width: 350px;
		margin: 30px auto 0; /* 상 좌우 하 */
		border-collapse: collapse;
		position: absolute;
	}
	tr { height: 40px; }
	
	.subTitle { font-size: 23px; }
	
	hr {
		width: 500px;
		height: 2px;
		background-color: #BBBBBB;
		border: 0;
		float: left;
	}
	
	.left { width: 100px; }
	
	.middle { width: 100px; }
	
	.right { width: 50px; }
	
	.empty { height: 20px; }
	
	.submit {
		width: 40px;
		height: 25px;
		color: #FFFFFF;
		background: #349525;
		border: none;
		border-radius: 3px;
	}
	
	tfoot td {width: 100px;}
	
	tfoot tr {
		position: absolute;
	    margin-top: 10px;
	}
	
	.submit:hover {
		cursor: pointer;
		background: #4CA844;
	}
	
</style>