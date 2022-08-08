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
	<table width="500" border="1">
		<tr>
			<td> 제 목 </td>
			<td> <input type="text" name="title"> </td>
		</tr>
		<tr>
			<td> 이 름 </td>
			<td> <input type="text" name="name"> </td>
		</tr>
		<tr>
			<td> 비밀번호 </td>
			<td> <input type="password" name="pwd"> </td>
		</tr>
		<tr>
			<td> 내 용 </td>
			<td> <textarea rows="6" cols="40" name="content"></textarea> </td>
		</tr>
	</table>
	<input type="submit" value="upload">
	</form>
	
</body>
</html>