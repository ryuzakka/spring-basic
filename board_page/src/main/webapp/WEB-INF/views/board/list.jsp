<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>board/list</title>
<script>
	function move(my) {
		location = "list?pcnt=" + my.value;
	}
	
	window.onload = function() {
		document.getElementById('pcnt').value = "${pcnt}";	// 선택한 글 갯수 유지해줌
	}
</script>
</head>
<body>
	
	<h2>list</h2>
	
	<a href="write">글쓰기</a><p>
	<table>
		<caption><h3>
			<select id="pcnt" onchange="move(this)" >
				<option value="10">10</option>
				<option value="20">20</option>
				<option value="30">30</option>
				<option value="50">50</option>
			</select>
		</h3></caption>
		<tr>
			<td>제 목</td>
			<td>작성자</td>
			<td>조회수</td>
			<td>작성일</td>
		</tr>
	<c:forEach items="${list}" var="board">
		<tr>
			<td><a href="readnum?id=${board.id}">${board.title}</a></td>
			<td>${board.name}</td>
			<td>${board.readcnt}</td>
			<td>${board.writeday}</td>
		</tr>
	</c:forEach>
	</table>


	<div>
		<!-- 10페이지 이전 -->
		<c:if test="${page > 10}"><a href="list?page=${pstart-1}&pcnt=${pcnt}">◀</a></c:if>
		
		<!-- 페이지 이전 -->
		<c:if test="${page != 1}"><a href="list?page=${page-1}&pcnt=${pcnt}">◁</a></c:if>
		
		<c:if test="${pend >= total}">
			<c:set var="pend" value="${total}" />
		</c:if>
		<c:forEach var="i" begin="${pstart}" end="${pend}">
			<c:if test="${i == page}"><span style="color:salmon">${i}</span></c:if>
			<c:if test="${i != page}"><a href="list?page=${i}&pcnt=${pcnt}">${i}</a></c:if>
		</c:forEach>
		
		<c:if test="${pend < total}">
			<!-- 페이지 다음 -->
			<a href="list?page=${page+1}&pcnt=${pcnt}">▷</a>
			
			<!-- 10페이지 다음 -->
			<a href="list?page=${pend+1}&pcnt=${pcnt}">▶</a>
		</c:if>
		
	</div>
	
</body>
</html>