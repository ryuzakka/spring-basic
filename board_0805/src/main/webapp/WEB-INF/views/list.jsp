<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>board/list</title>
</head>
<body>
	
	<h2>게시판</h2>
	
	<table width="600" border="1">
		<tr>
			<th> 제 목 </th>
			<th> 조회수 </th>
			<th> 작성일 </th>
		</tr>
		<c:forEach items="${list}" var="board">
			<tr>
				<td> ${board.title} </td>
				<td> ${board.readnum} </td>
				<td> ${board.writeday} </td>
			</tr>
		</c:forEach>
	</table>
	
	
</body>
</html>