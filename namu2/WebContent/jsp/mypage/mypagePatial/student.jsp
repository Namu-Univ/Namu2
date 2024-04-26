<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
	<div>ID</div>
	<div>학과 ID</div>
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
                
<div>
	<div>${vo.id}</div>
	<div>${vo.deptId}</div>
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