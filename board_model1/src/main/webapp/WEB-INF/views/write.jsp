<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>write</title>
</head>
<body>
	
	<h2>글쓰기</h2>
	
	<form method="post" action="write_ok">
		<table width="600" border="1">
			<tr>
				<td>작성자</td>
				<td><input type="text" name="userid"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<td>제 목</td>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<td>내 용</td>
				<td><textarea rows="4" cols="30" name="content"></textarea></td>
			</tr>
		</table>
		
		<p><input type="submit" value="submit"></p>
	</form>
	
</body>
</html>