<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>content</title>
<script>
	function del() {
		var form = document.getElementById('deldiv')
		form.style.display = "block";
		
		document.delform.pwd.value = "";
	}
</script>
</head>
<body>
	
	<h2>상세글</h2>
	
	<table width="600" border="1">
		<tr>
			<td> 작성자 </td>
			<td> ${view.userid } </td>
		</tr>
		<tr>
			<td> 제 목 </td>
			<td> ${view.title } </td>
		</tr>
		<tr>
			<td> 내 용 </td>
			<td> ${view.content } </td>
		</tr>
		<tr>
			<td> 조회수 </td>
			<td> ${view.readnum } </td>
		</tr>
		<tr>
			<td> 작성일 </td>
			<td> ${view.writeday } </td>
		</tr>
	</table>
	<p>
	<a href="list">목록</a><p>
	<a href="update?id=${view.id }">수정</a>
	<a href="javascript:del()">삭제</a>
	<p>
	
	<div id="deldiv" style="display:none;">
	<form name="delform" method="post" action="delete">
		<input type="hidden" name="id" value="${view.id }">
		<input type="password" name="pwd" placeholder="비밀번호">
		<input type="submit" value="삭제">
	</form>
	</div>
	
</body>
</html>