<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../../../css/subjectCss.jsp"/>
<div class="maintop">내 강의</div>
	<div class="main">
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>연도</th>
					<th>학기</th>
					<th>강의명</th>
					<th>강의실</th>
					<th>이수학점</th>
					<th>강의시간</th>
					<th>성적</th>
				</tr>
			</thead>
			<tbody>
			    <c:choose>
			        <c:when test="${stuSub != 'null' && not empty stuSub}">
			            <c:forEach items="${stuSub}" var="stuSub">
			                <tr>
			                    <td>${stuSub.idx}</td>
			                    <td>${stuSub.year}</td>
			                    <td>${stuSub.semester}</td>
			                    <td>${stuSub.subName}</td>
			                    <td>${stuSub.room}</td>
			                    <td>${stuSub.grade}</td>
			                    <td>${stuSub.time}</td>
			                    <td>${stuSub.rate}</td>
			                </tr>
			            </c:forEach>
			        </c:when>
			        <c:otherwise>
			            <tr>
			                <td colspan="8">조회된 강의가 없습니다.</td>
			            </tr>
			        </c:otherwise>
			    </c:choose>
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