<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	table {
		width: 100%;
		max-width: 800px;
		height: 500px;
		margin: 0 auto;
		background: #fff;
		border-collapse: separate;
		border-spacing: 0 10px;
	}
	th, td {
		padding: 8px;
		text-align: left;
		border-bottom: #ddd;
		background-color: #e8e8e8;
		border: 1px solid #e8e8e8;
	}
	th { width: 15%; }
	td { width: 85%; }
	.title-row, .file-row { height: 10%; }
	.content-row { height: 80%; }
	input[type="text"], input[type="file"] {
		width: 95%;
		height: 40px;
		padding: 8px;
		margin: 6px;
		border: none;
		box-sizing: border-box;
	}
	input[type="text"], textarea { background-color: #f9f9f9; }
	textarea {
		width: 95%;
		height: 90%;
		padding: 8px;
		border: none;
		box-sizing: border-box;
		resize: none;
	}
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