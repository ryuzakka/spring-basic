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
	<table width="500" border="1">
		<tr>
			<td>제 목</td>
			<td>작성자</td>
			<td>조회수</td>
			<td>작성일</td>
			<c:forEach items="${list}" var="list">
				<tr>
					<td><a href="readnum?id=${list.id}">${list.title}</a></td>
					<td>${list.userid }</td>
					<td>${list.readnum }</td>
					<td>${list.writeday }</td>
				</tr>
			</c:forEach>
		</tr>
	</table>
	
</body>
</html>