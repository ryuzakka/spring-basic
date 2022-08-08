<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>update</title>
</head>
<body>
	
	<h2>글 수정</h2>
	
	<form method="post" action="update_ok">
		<input type="hidden" name="id" value="${view.id}">
	<table width="500" border="1">
		<tr>
			<td> 제 목 </td>
			<td> <input type="text" name="title" value="${view.title}"> </td>
		</tr>
		<tr>
			<td> 이 름 </td>
			<td> ${view.name} </td>
		</tr>
		<tr>
			<td> 비밀번호 </td>
			<td>
				<input type="password" name="pwd">
				<c:if test="${param.err == 1}"><div style="color:red;font-size:13px;">비밀번호 틀림</div></c:if>
			</td>
		</tr>
		<tr>
			<td> 내 용 </td>
			<td> <textarea rows="6" cols="40" name="content">${view.content}</textarea> </td>
		</tr>
	</table>
	<input type="submit" value="update">
	</form>
	
</body>
</html>