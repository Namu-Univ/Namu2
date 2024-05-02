<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	table {
		width: 100%;
		max-width: 800px;
		height: 500px;
		margin: 0 auto;
		border-collapse: collapse;
	}
	th, td {
		border: 1px solid #d2d2d2;
		padding: 12px 15px;
		text-align: center;
		border: none;
	}
	th {
		background-color: #f0f0f0;
	}
	td a {
		color: inherit;
		text-decoration: none;
	}
	thead, tbody {
		border: 2px solid #e5e5e5;
	}
	th#id, th#views { width: 10%;}
	th#title { width: 50%;}
	th#date, th#author { width: 15%;}
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