<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	table {
		width: 900px;
		margin: 30px auto 0; /* 상 좌우 하 */
		border-collapse: collapse;
		text-align: center;
	}

	thead, tbody {
		border: 1px solid #349525;
	}
	
	tfoot tr{
		border: none;
	}

	th { 
		background-color: #349525;
		height: 30px;
	}
	tr { height: 40px; }
	
	
	tfoot td {
		border: none; 
	}
	
	.subTitle {
		font-size: 23px;
	}
	
	hr {
		width: 500px;
		height: 2px;
		background-color: #BBBBBB;
		border: 0;
		float: left;
	}
	
	.year { width: 60px; }
	.semester { width: 40px; }
	.deptName { width: 150px }
	.subName { width: 250px; }
	.room { width: 100px; }
	.grade { width: 60px; }
	
	.register {
		width: 40px;
		height: 25px;
		color: #FFFFFF;
		background: #349525;
		border: none;
		border-radius: 3px;		
	}
	.register:hover {
		cursor: pointer;
		background: #4CA844;
	}
	
	.paging {
		margin-top: 20px;
		text-align: center;
	}
	.paging a, .paging span {
		display: inline-block;
		padding: 5px 10px;
		margin: 0 2px;
		border: 1px solid #ccc;
		background-color: #f9f9f9;
		color: #333;
		text-decoration: none;
		border-radius: 5px;
		transition: background-color 0.3s ease;
	}
	.paging a:hover {
		background-color: #ddd;
	}
	.paging .disabled {
		pointer-events: none;
		background-color: #eee;
		color: #aaa;
		border-color: #eee;
	}
	.paging .arrow {
		font-weight: bold;
	}
	.paging .current {
		background-color: #b8b8b8;
		color: #fff;
		border-color: #b8b8b8;
		pointer-events: none;
	}
	.button {
		width: 80px;
		padding: 8px 10px;
		margin: 0 2px;
		border: none;
		border-radius: 5px;
		cursor: pointer;
	}
	.button:hover {
		background-color: #ddd;
	}
</style>