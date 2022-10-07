<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<main>
		<h2></h2>
		
		<a href="write">write</a>
		<table width="700" border="1">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>이름</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="list">
				<tr>
					<td><a href="readnum?id=${list.id}">${list.rnum}</a></td>
					<td><a href="readnum?id=${list.id}">${list.title}</a></td>
					<td>${list.name}</td>
					<td>${list.readnum}</td>
					<td>${list.writeday}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table> 
	</main>
	
</body>
</html>