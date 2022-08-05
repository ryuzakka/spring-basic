<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>content</title>
	<script>
		function pwdInput() {
			document.getElementById('pwdform').style.display = "block";
		}
	</script>
</head>
<body>
	
	<table width="600" border="1">
		<tr>
			<th> 제 목 </th>
			<td> ${content.title} </td>
		</tr>
		<tr>
			<th> 이 름 </th>
			<td> ${content.name} </td>
		</tr>
		<tr>
			<th> 내 용 </th>
			<td> ${content.content} </td>
		</tr>
		<tr>
			<th> 조회수 </th>
			<td> ${content.readnum} </td>
		</tr>
		<tr>
			<th> 작성일 </th>
			<td> ${content.writeday} </td>
		</tr>
	</table>
	<a href="list">목록으로</a><p>
	<a href="update?id=${content.id}"><input type="button" value="Update"></a><p>
	<a href="javascript:pwdInput()"><input type="button" value="Delete"></a>
	<c:if test="${param.err == 1}">
		<span style="color:red;font-size:13px;">비밀번호 틀림</span>
		<div id="pwdform">
	</c:if>
	<c:if test="${param.err == null}">
		<div id="pwdform" style="display:none;">
	</c:if>
	<form method="post" action="delete">
		<input type="hidden" name="id" value="${content.id}"><p>
		<input type="password" name="pwd" placeholder="비밀번호 입력"><p>
		<input type="submit" value="submit">
	</form>
	</div>
	
</body>
</html>