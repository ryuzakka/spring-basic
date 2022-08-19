<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list</title>
<script>
	function check(my) {
		if( (my.sel.selectedIndex != 0) && (my.sword.value.trim().length != 0) )
			return true;
		else
			return false;
	}
	
	function init() {
		<c:if test="${sel != 'id'}">
			document.search.sel.value = "${sel}";
		</c:if>
	}
</script>
</head>
<body>
	
	<h2>자유게시판</h2>
	
	<a href="write">글쓰기</a><p>
	
	<div>
		<form name="search" method="get" action="list" onsubmit="return check(this)">
			<input type="hidden" name="page" value="1">
			<select name="sel">
				<option> 선 택 </option>
				<option value="title"> 제 목 </option>
				<option value="content"> 내 용 </option>
				<option value="name"> 작성자 </option>
			</select>
			<input type="text" name="sword" value="${sword }">
			<input type="submit" value="search">
		</form>
	</div>
	
	<table width="700" border="1">
		<tr>
			<td> 번 호 </td>
			<td> 제 목 </td>
			<td> 작성자 </td>
			<td> 조회수 </td>
			<td> 작성일 </td>
		</tr>
		<c:forEach items="${list }" var="list">
			<tr>
				<td> ${list.id } </td>
				<td> ${list.title } </td>
				<td> ${list.name } </td>
				<td> ${list.readcnt } </td>
				<td> ${list.writeday } </td>
			</tr>
		</c:forEach>
	</table>
	
	<div>
		
		<c:if test="${pstart > 10}">
			<a href="list?page=${pstart-1}&sel=${sel}&sword=${sword}"><input type="button" value="&lt;"></a>
		</c:if>
		
		<c:forEach var="i" begin="${pstart}" end="${pend}">
			<c:if test="${i == page}">${i}</c:if>
			<c:if test="${i != page}"><a href="list?page=${i}&sel=${sel}&sword=${sword}">${i}</a></c:if>
		</c:forEach>
		
		<c:if test="${pend < total}">
			<a href="list?page=${pend+1}&sel=${sel}&sword=${sword}"><input type="button" value="&gt;"></a>
		</c:if>
	</div>
	
</body>
</html>