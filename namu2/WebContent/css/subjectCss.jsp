<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	table {
		width: 900px;
		margin: 30px auto 0; /* 상 좌우 하 */
		border: 1px solid #349525;
		border-collapse: collapse;
		text-align: center;
	}
	th { 
		background-color: #349525;
		height: 30px;
	}
	tr { height: 40px; }
	
	
	.year { width: 60px; }
	.semester { width: 40px; }
	.deptName { width: 150px }
	.subName { width: 250px; }
	.rom { width: 100px; }
	.grade { width: 60px; }
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
</style>