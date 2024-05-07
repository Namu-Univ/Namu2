<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div style="margin: 0px auto; border: solid 1px;" id="studentStatusLeft">
	<div>학번</div>
	<div>학과명</div>
	<div>이름</div>
	<div>생년월일</div>
	<div>성별</div>
	<div>주소</div>
	<div>전화번호</div>
	<div>학년</div>
	<div>학기</div>
	<div>입학일</div>
	<div>졸업일</div>
</div>
                
<div style="margin: 0px auto; border: solid 1px;" id="studentStatusRight">
	<div>${vo.id}</div>
	<div>${vo.deptName}</div>
	<div>${vo.name}</div>
	<div>${vo.birthDate}</div>
	<div>${vo.gender}</div>
	<div>${vo.address}</div>
	<div>${vo.tel}</div>
	<div>${vo.grade}</div>
	<div>${vo.semester}</div>
	<div>${vo.entranceDate}</div>
	<div>${vo.graduationDate}</div>
	<!-- 수정 버튼 -->
	<div>
		<a href="editMyPage">수정</a>
	</div>
</div>