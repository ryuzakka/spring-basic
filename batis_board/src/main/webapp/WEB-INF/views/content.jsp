<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>content</title>
<script>
	function show() {
		document.getElementById('pwdinput').style.display = "block";
	}
</script>
</head>
<body>

	<h2>글 상세</h2>
	
	<table width="400" border="1">
		<tr>
			<td>제 목</td>
			<td>${view.title}</td>
		</tr>
		<tr>
			<td>이 름</td>
			<td>${view.name}</td>
		</tr>
		<tr>
			<td>내 용</td>
			<td>${view.content}</td>
		</tr>
		<tr>
			<td>조회수</td>
			<td>${view.readnum}</td>
		</tr>
		<tr>
			<td>작성일</td>
			<td>${view.writeday}</td>
		</tr>
	</table>
	<p>
	<a href="update?id=${view.id}">수정</a>
	<a href="javascript:show()">삭제</a>
	</p>
	
	<div id="pwdinput" style="display:none;">
	<form method="post" action="delete">
		<input type="hidden" name="id" value="${view.id}">
		<input type="password" name="pwd">
		<input type="submit" value="비밀번호 확인">
	</form>
	</div>
	<c:if test="${err == 1}"><div style="color:red;font-size:12px">비밀번호 틀림</div></c:if>
	
	<p><a href="list"><input type="button" value="목록"></a></p>
	
	
</body>
</html>