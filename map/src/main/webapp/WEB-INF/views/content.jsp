<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<main>
		<table width="600" border="1">
			<tr>
				<th>제목</th>
				<td>${title}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${name}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${content}</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${readnum}</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${writeday}</td>
			</tr>
		</table>
		<p>
		<a href="list">list</a>
	</main>
	
</body>
</html>