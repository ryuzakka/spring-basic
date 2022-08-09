<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>gongji/list</title>
</head>
<body>
	
	<h2>공지게시판</h2>
	
	<a href="write">글쓰기</a>
	<table width="500" border="1">
		<tr>
			<td>구 분</td>
			<td>제 목</td>
			<td>작성일</td>
		</tr>
		<c:forEach items="${list}" var="gongji">
			<tr>
				<td>${gongji.gubun}</td>
				<td>${gongji.title}</td>
				<td>${gongji.writeday}</td>
			</tr>
		</c:forEach>
	</table>
	<p><a href="javascript:history.back()">go back</a>
	
</body>
</html>