<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>성적 계산</title>
</head>
<body>
	
	<table width="800" align="center" border="1">
		<tr>
			<th>이 름</th>
			<th>국어점수</th>
			<th>영어점수</th>
			<th>수학점수</th>
			<th>총 점</th>
			<th>평 균</th>
		</tr>
		<tr>
			<th>${sung.name }</th>
			<th>${sung.kor }</th>
			<th>${sung.eng }</th>
			<th>${sung.math }</th>
			<th>${sung.kor + sung.eng + sung.math}</th>
			<th>${(sung.kor + sung.eng + sung.math)/3}</th>
		</tr>
	</table>
	
</body>
</html>