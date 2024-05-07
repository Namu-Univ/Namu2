<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	table {
		width: 100%;
		max-width: 1000px;
		height: 500px;
		margin: 0 auto;
		background-color: #fff;
		border-collapse: separate;
		border-spacing: 0 2px;
	}
	th, td {
		padding: 8px;
		text-align: left;
		border-bottom: #ddd;
		background-color: #e8e8e8;
		border: 1px solid #e8e8e8;
	}
	.info-row td { 
		width: 25%;
		padding-left: 3%;
		padding-right: 3%;
	}
	.info-row { 
		height: 10%;
	}
	.title-row td {
		height: 10%;
		text-align: center;
		vertical-align: center;
	}
	.title-row { height: 10%; }
	.content-row td {
		padding-left: 3%;
		padding-right: 3%;
	}
	.content-row { height: 80%; }
	
	input[type="submit"], button {
		width: 20%;
		padding: 8px 10px;
		margin-top: 10px;
		margin-right: 10px;
		margin-left: 10px;
		border: none;
		border-radius: 5px;
		cursor: pointer;
	}
	input[type="submit"]:hover, button:hover {
		background-color: #ddd;
	}
	.button {
		text-align: center;
		background-color: #fff;
		border: none;
	}
</style>