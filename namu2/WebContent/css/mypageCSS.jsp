<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.rectangle {
    display: flex;
    flex-wrap: wrap;
}

.rectangle>div {
    width: 30%; /* 각 항목이 2개씩 나오도록 설정 */
    box-sizing: border-box;
    border: 1px solid transparent; /* 테두리 설정 변경 */
    padding: 10px;
    margin: 10 auto;
}

.rectangle>div>div {
    margin-bottom: 10px; /* 각 항목 사이 간격 설정 */
    
}

.rectangle>div>div:last-child {
    margin-bottom: 0; /* 마지막 항목의 하단 간격 제거 */
}

.rectangle>div>div:last-child>a {
    display: inline-block; /* 수정 버튼을 인라인 블록 요소로 만들어 줄을 차지하도록 설정 */
    margin-top: 10px; /* 수정 버튼과 다음 박스칸 사이 간격 설정 */
    float: right; /* 우측으로 이동시킴 */
    background-color: grey; /* 버튼 배경색 */
    color: #fff; /* 글자색 */
    padding: 5px 10px; /* 안쪽 여백 */
    border: none; /* 테두리 제거 */
    border-radius: 3px; /* 둥근 테두리 */
    text-decoration: none; /* 밑줄 제거 */
}

.rectangle>div>div:last-child>a:hover {
    background-color: #349525; /* 호버 시 배경색 변경 */
}

#staffStatusLeft {
	margin-right: 0px !important;
	border-right: none !important;
}

#staffStatusRight {
	margin-left: 0px !important;
	border-left: none !important;
}

#studentStatusLeft {
	margin-right: 0px !important;
	border-right: none !important;
}

#studentStatusRight {
	margin-left: 0px !important;
	border-left: none !important;
}

#professorStatusLeft {
	margin-right: 0px !important;
	border-right: none !important;
}

#professorStatusRight {
	margin-left: 0px !important;
	border-left: none !important;
}
</style>