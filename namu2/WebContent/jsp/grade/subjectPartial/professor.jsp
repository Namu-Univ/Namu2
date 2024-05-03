<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../../../css/subjectCss.jsp"/>
<script>
	function remSubName(subId, subName, year, semester) {
	    document.getElementById('subIdInput').value = subId;
	    document.getElementById('subNameInput').value = subName;
	    document.getElementById('yearInput').value = year;
	    document.getElementById('semesterInput').value = semester;
	    document.getElementById('form').submit();
	}
</script>
<div class="maintop">내 강의</div>
<div class="main">
	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th class="year">연도</th>
				<th class="semester">학기</th>
				<th class="deptName">학과</th>
				<th class="subName">강의명</th>
				<th class="room">강의실</th>
				<th class="grade">이수학점</th>
				<th>강의시간</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${proSub}" var="proSub">
				<form id="form" action="enrollStu" method="POST">
				    <input type="hidden" name="subId" id="subIdInput">
				    <input type="hidden" name="subName" id="subNameInput">
				    <input type="hidden" name="year" id="yearInput">
				    <input type="hidden" name="semester" id="semesterInput">
				</form>
				<tr onclick="remSubName('${proSub.subId }', '${proSub.subName}', '${proSub.year}', '${proSub.semester}')">
					<td>${proSub.subId }</td>
					<td>${proSub.year }</td>
					<td>${proSub.semester }</td>
					<td>${proSub.deptName}</td>
					<td>${proSub.subName }</td>
					<td>${proSub.room }</td>
					<td>${proSub.grades }</td>
					<td>${proSub.time }</td>
				</tr>
	
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<td colspan = "8">
					<div class="paging">
					<c:if test="{pvo.beginPage == 1}">
						<span class="disable">&laquo;</span>
					</c:if>
					<c:if test="{pvo.beginPage != 1}">
						<a href="subject?cPage=${pvo.beginPage - 1}">&laquo;</a>
					</c:if>
						<c:if test="${pvo.nowBlock == 1}">
							<span class="disabled">&laquo;</span>
						</c:if>
						
						<c:forEach var="page" begin="${pvo.beginPage}" end="${pvo.endPage}">
							<c:choose>
								<c:when test="${page == pvo.nowPage}">
									<span>${page}</span>
								</c:when>
								<c:otherwise>
									<a href="subject?cPage=${page}">${page}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<c:if test="${pvo.endPage < pvo.totalPage}">
							<a href="subject?cPage=${pvo.endPage + 1}">&raquo;</a>
						</c:if>
						<c:if test="${pvo.endPage >= pvo.totalPage}">
							<span class="disable">&raquo;</span>
						</c:if>
					</div>
				</td>
			</tr>
		</tfoot>
	</table>
</div>