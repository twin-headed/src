<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한줄 메모</title>
<%@ include file="../include/header.jsp" %>
<script>
// 페이지 로딩이 끝나면 memo_list() 함수를 자동으로 호출한다.
$(function(){
	memo_list();
});

// 리스트
function memo_list() {
	$.ajax({
		type: "post",
		url: "/memo_list.do", /* 컨트롤러 - /memo_list.do 호출 */
		success: function(data) {
			$("#memoList").html(data);
		}
	});
}

</script>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>한줄 메모</h2>

<div id="memoList">
<!-- 결과 출력위치 -->
</div>

</body>
</html>