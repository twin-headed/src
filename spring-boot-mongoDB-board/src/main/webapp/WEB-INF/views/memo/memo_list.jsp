<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 주의 : taglib 추가안하면 결과 출력안됨 -->    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메모 목록</title>
</head>
<body>
<table border='1' style="width:700px">
	<tr>
		<td>NO</td>
		<td>이름</td>
		<td>메모</td>
		<td>날짜</td>
	</tr>
	<%-- var="개별변수" items="${집합변수}" --%>
	<c:forEach var="row" items="${map.items}" varStatus="status">
		<tr>
			<td>${status.count}</td>	<!-- 1번부터 출력순서대로 넘버링 -->
			<td>${row.writer}</td>
			<td>${row.memo}</td>
			<td>${row.post_date}</td>
		</tr>
	</c:forEach>
</table>

<!-- 실행  -->	
</body>
</html>