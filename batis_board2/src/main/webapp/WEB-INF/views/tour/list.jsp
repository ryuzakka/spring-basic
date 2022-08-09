<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>tour/list</title>
</head>
<body>
	
	<h2>여행후기 게시판</h2>
	
	<a href="write">글쓰기</a>
	<table width="1100" border="1">
		<tr>
			<td>제 목</td>
			<td>작성자</td>
			<td>조회수</td>
			<td>작성일</td>
			<td>첨부파일</td>
		</tr>
		<c:forEach items="${list}" var="tour">
			<tr>
				<td>${tour.title}</td>
				<td>${tour.userid}</td>
				<td>${tour.readnum}</td>
				<td>${tour.writeday}</td>
				<td>${tour.fname}</td>
			</tr>
		</c:forEach>
	</table>
	<p><a href="javascript:history.back()">go back</a>
	
</body>
</html>