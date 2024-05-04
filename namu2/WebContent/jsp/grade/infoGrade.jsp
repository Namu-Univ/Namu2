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
<jsp:include page="../../css/infoGradeCss.jsp"/>
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

<jsp:include page="../../partials/navTop/professorNavTop.jsp"></jsp:include>
    <div class="mid">
		<jsp:include page="../../partials/sideNav/sideNav_myLecture.jsp"/>
			<div class="maintop">성적 입력</div>
        		<div class="main">
        	<%
				EnrollStuVO vo = (EnrollStuVO)session.getAttribute("remStu");
        	%>
        		<div class="subTitle">
					<%=vo.getYear() %> - <%=vo.getSemester() %> <%=vo.getSubName() %>
        		</div>
        		<hr>		
				<form action="insertGrade" method="POST">
				    <table>
				    	<thead>
					    	<tr>
					    		<td class="left">학번</td>
					    		<td class="middle"><%=vo.getStuId()%></td>
					    		<td class="right"></td>
					    	</tr>
				    	</thead>
				    	<tbody>
					    	<tr>
					    		<td>이름</td>
					    		<td><%=vo.getStuName() %> </td>
					    	</tr>
					        <tr>
					            <td><label for="absent">결석</label></td>
					            <td><input type="number" id="absent" name="absent" min="0" max="15" step="1" value="0"></td>
					        </tr>
					        <tr>
					            <td><label for="mid">중간고사</label></td>
					            <td><input type="number" id="mid" name="mid" min="0" max="100" step="1" value="0"></td>
					        </tr>
					        <tr>
					            <td><label for="fin">기말고사</label></td>
					            <td><input type="number" id="fin" name="fin" min="0" max="100" step="1" value="0"></td>
					        </tr>
					        <tr class="empty"></tr>
					        <tr>
					            <td><label for="exScore">환산점수</label></td>
					            <td><input type="text" id="exScore" name="exScore" value="0" readonly="readonly"></td>
					            <td><button type="button" onclick="calcExScore()">환산</button></td>
					        </tr>
					        <tr>
					            <td>학점</td>
					            <td>
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
					            </td>
					        </tr>
				    	</tbody>
				    	<tfoot>
					    	<tr>
					    		<td></td>
					            <td><input type="submit" value="완료" class="submit"></td>
					        </tr>
				    	</tfoot>
				       
				    </table>
				</form>

			</div>
	</div>
</body>
</html>