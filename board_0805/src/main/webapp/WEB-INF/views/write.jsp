<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>write</title>
</head>
<body>
	
	<form method="post" action="write_ok">
	<table width="600" border="1">
		<tr>
			<th> 제 목 </th>
			<td> <input type="text" name="title"> </td>
		</tr>
		<tr>
			<th> 이 름 </th>
			<td> <input type="text" name="name"> </td>
		</tr>
		<tr>
			<th> 비밀번호 </th>
			<td> <input type="password" name="pwd"> </td>
		</tr>
		<tr>
			<th> 내 용 </th>
			<td> <textarea rows="8" cols="35" name="content"></textarea> </td>
		</tr>
	</table><br>
	<input type="submit" value="submit"><p>
	<a href="list">목록으로</a>
	</form>
	
</body>
</html>