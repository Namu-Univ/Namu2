<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.searchForm {
		margin: 30px auto 0; /* 상 좌우 하 */
	}
 
	table {
		width: 700px;
		margin: 30px auto 0; /* 상 좌우 하 */
		border: 1px solid #349525;
		border-collapse: collapse;
		text-align: center;
	}
	th, td { border: 1px solid #349525; }
	th { background-color: #349525; }
	.red { color: red; }
	.center { text-align: center; }
	.title { width: 30%; }
	
	tfoot { height: 2em; text-align: center; font-size: 1.5em;}
	
	.scroll {
    overflow-y: auto;
    max-height: 400px;
	}

	.scroll thead,
	.scroll tbody tr {
	    display: table;
	    width: 100%;
	    table-layout: fixed;
	}
}
</style>