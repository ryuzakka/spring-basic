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
	
	<form method="post" action="update_ok">
		<input type="hidden" name="id" value="${content.id}">
	<table width="600" border="1">
		<tr>
			<th> 제 목 </th>
			<td> <input type="text" name="title" value="${content.title}"> </td>
		</tr>
		<tr>
			<th> 이 름 </th>
			<td> <input type="text" name="name" value="${content.name}"> </td>
		</tr>
		<tr>
			<th> 비밀번호 </th>
			<td>
				<input type="password" name="pwd" placeholder="기존 비밀번호 입력"><br>
				<c:if test="${param.err == 1}"><span style="color:red;font-size:13px;">비밀번호 틀림</span></c:if>
			</td>
		</tr>
		<tr>
			<th> 내 용 </th>
			<td> <textarea rows="8" cols="35" name="content">${content.content}</textarea> </td>
		</tr>
	</table><br>
	<input type="submit" value="submit"><p>
	</form>
	
</body>
</html>