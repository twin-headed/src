<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
<%@ include file="../include/header.jsp" %>
<script>
$(function() {
	$("#btnUpdate").click(function(){
		$("#view_form").attr("action", "/memo_update.do");	// 컨트롤러 - /memo_update.do
		$("#view_form").submit();
	});
});

</script>
</head>
<body>

<%@ include file="../include/menu.jsp" %>
<h2>메모장</h2>

<form id="view_form" name="view_form" method="post">
	
	<input type="hidden" name="_id" value="${vo._id}">
	이름 <input name="writer" id="writer" value="${vo.writer}"><br>
	메모<input name="memo" id="memo" value="${vo.memo}" size="50">
	<br><br>
	
	<input type="button" id="btnUpdate" value="수정">
	<input type="button" id="btnDelete" value="삭제">
	<input type="button" id="btnList" value="목록" onclick="location.href='/memo.do'">
	
</form>
</body>
</html>