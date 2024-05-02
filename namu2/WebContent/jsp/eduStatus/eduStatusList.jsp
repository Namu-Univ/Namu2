<%@page import="com.namuuniv.vo.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 휴학 신청 목록 조회</title>
<jsp:include page="../../css/frameCss.jsp"/>
<style>

/* 테이블 스타일 */
table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: left;
}

th {
    background-color: #f2f2f2;
}

/* 사각형 모양의 디자인 추가 */
.rectangle {
    border: 1px solid #ddd; /* 선으로된 사각형 설정 */
    padding: 10px;
    margin-bottom: 10px;
}

.rectangle > div {
    margin-bottom: 5px;
}

.rectangle > div:last-child {
    margin-bottom: 0;
}

.rectangle > div > button {
    float: right;
    background-color: #007bff;
    color: #fff;
    padding: 5px 10px;
    border: none;
    border-radius: 3px;
    text-decoration: none;
}

.rectangle > div > button:hover {
    background-color: #0056b3;
}

/* 제목 스타일 */
header {
    text-align: left; /* 텍스트를 좌측으로 정렬 */
    margin-bottom: 20px;
    padding-left: 10px; /* 좌측 여백 추가 */
}

/* 구분선 스타일 */
.divider {
    border-top: 1px solid #008000;
    margin-bottom: 25px;
}

</style>
</head>
<body>
<jsp:include page="../../partials/navTop/staffNavTop.jsp"/>
<div class="mid">
    <jsp:include page="../../partials/sideNav/sideNav_staffEduStatus.jsp"/>
 	<div class="maintop">학적 관리</div>
    <div class="main">
       
        <table>
            <thead>
                <tr>
                    <th>NO</th>
                    <th>학번</th>
                    <th>상태</th>
                    <th>시작 연도</th>
                    <th>시작 학기</th>
                    <th>종료 연도</th>
                    <th>종료 학기</th>
<!--                     <th>승인 상태</th> -->
                    <th>신청일</th>
                    <th>확인하기</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="listData" items="${list}">
                    <tr>
                        <td class="rectangle">${listData.idx}</td>
                        <td class="rectangle">${listData.id}</td>
                        <td class="rectangle">${listData.status}</td>
                        <td class="rectangle">${listData.startYear}</td>
                        <td class="rectangle">${listData.startSemester}</td>
                        <td class="rectangle">${listData.finishYear}</td>
                        <td class="rectangle">${listData.finishSemester}</td>
<%--                         <td class="rectangle">${listData.approvalStatus}</td> --%>
                        <td class="rectangle">${listData.reporingDate}</td>
                        <td class="rectangle"><button class="checkData" type="button" onClick="location.href='eduStatus?type=check&idx=${listData.idx}'">확인하기</button></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
