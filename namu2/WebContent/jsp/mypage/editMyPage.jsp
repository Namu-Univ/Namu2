<%@page import="com.namuuniv.vo.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>내정보 변경</title>
    <link href="${pageContext.request.contextPath }/css/frame.css" rel="stylesheet" type="text/css">
    <style>
        .input-field {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
    </style>     
</head>
<body>
    <div>
<jsp:include page="../../partials/navTop.jsp"></jsp:include>
        <div class="mid">
        <jsp:include page="../../partials/sideNav.jsp"></jsp:include>    
            <div class="maintop">정보수정</div>
            <!-- Page content -->
            <div class="main">
                <form action="editMyPage" method="post">
                    <label for="name">이름:</label>
                    <input type="text" id="name" name="name" value="${vo.name}" class="input-field" placeholder="${vo.name}" required><br>

                    <label for="address">주소:</label>
                    <input type="text" id="address" name="address" value="${vo.address}" class="input-field" placeholder="${vo.address}" required><br>

                    <label for="tel">전화번호:</label>
                    <input type="text" id="tel" name="tel" value="${vo.tel}" class="input-field" placeholder="${vo.tel}" required><br>

                    <input type="submit" value="수정">
                </form>
            </div>
        </div>
    </div>
</body>
</html>
