<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list</title>
</head>
<body>
	
	<h2>자유게시판</h2>
	
	<p><a href="write">글쓰기</a></p>
	<table width="800" border="1">
		<tr>
			<td>제 목</td>
			<td>조회수</td>
			<td>작성일</td>
		</tr>
		<c:forEach items="${list }" var="board">
			<tr>
				<td><a href="readnum?id=${board.id}">${board.title }</a></td>
				<td>${board.readnum }</td>
				<td>${board.writeday }</td>
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>