<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>성적입력</title>
</head>
<body>
	
	<h2>이름과 성적을 입력하세요.</h2>
	<form method="post" action="sungview">
		<input type="text" name="name" placeholder="이름"><p>
		<input type="text" name="kor" placeholder="국어"><p>
		<input type="text" name="eng" placeholder="영어"><p>
		<input type="text" name="math" placeholder="수학"><p>
		<input type="submit" value="SEND"><p>
	</form>
	
</body>
</html>