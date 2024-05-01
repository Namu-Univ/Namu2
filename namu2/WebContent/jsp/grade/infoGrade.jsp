<%@page import="com.namuuniv.vo.EnrollStuVO"%>
<%@page import="com.namuuniv.vo.ProSubjectVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적 입력</title>
<jsp:include page="../../css/frameCss.jsp"/>
</head>
<script>
	function calcExScore() {
	    var mid = parseInt(document.getElementById('mid').value);
	    var fin = parseInt(document.getElementById('fin').value);
	    var absent = parseInt(document.getElementById('absent').value);
	
	    // 중간고사와 기말고사 점수의 평균
	    var averageScore = (mid + fin) / 2;
	
	    // 결석 횟수만큼 감점
	    var exScore = averageScore - absent;
	
	    document.getElementById('exScore').value = exScore;
	}
</script>	
<body>

<jsp:include page="../../partials/ProNavTop.jsp"></jsp:include>
    <div class="mid">
    
    <!-- Side navigation -->
		<div class="sidenav">
		    <a href="subject">내 강의</a>
		</div>
        <!-- Page content -->
        <div class="main">
        	<%
				EnrollStuVO vo = (EnrollStuVO)session.getAttribute("remStuSub");
        	%>
        	<div>
				<%vo.getYear()%><%=vo.getSubName() %>
        	</div>
        	<div>
        		학번 <%=vo.getStuId()%>
        	</div>
        	<div>
        		이름 <%=vo.getStuName() %> 
        	</div>		
			<form action="insertGrade" method="post">
	            <label for="absent">결석</label>
				<input type="number" id="absent" name="absent" min="0" max="15" step="1" value="0">
				
	            <label for="mid">중간고사</label>
				<input type="number" id="mid" name="mid" min="0" max="100" step="1" value="0">
				
				<label for="fin">기말고사</label>
				<input type="number" id="fin" name="fin" min="0" max="100" step="1" value="0">
			
				<label for="exScore">환산점수</label>
				<input type="text" id="exScore" name="exScore" value="0" readonly="readonly">
				<button type="button" onclick="calcExScore()">
					환산
				</button>
				<select id="rate" name="rate">
					<option value="A+">A+</option>
					<option value="A">A</option>
					<option value="B+">B+</option>
					<option value="B">B</option>
					<option value="C+">C+</option>
					<option value="C">C</option>
					<option value="D+">D+</option>
					<option value="D">D</option>
					<option value="F">F</option>
				</select>

	            <input type="submit" value="완료">
			</form>
		</div>
	</div>
</body>
</html>