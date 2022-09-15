<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	section {
		width:1200px;
		height:auto;
		margin:80px auto 70px auto;
		text-align:center;
	}
	section h1 {
		font-size:2em;
	}
	section #searchArea {
		width:600px;
		margin:40px auto;
	}
	section #searchArea fieldset {
		border:none;
		background:#f6f5ef;
		padding:24px 0;
	}
	section #searchArea input[type='search'] {
		padding:12px 0;
		border:none;
		border-bottom:1px solid #DDD;
		border-radius:3px;
		width:70%;
		text-align:center;
	}
	section #searchArea input[type='submit'] {
		width:20%;
		border-radius:10px;
		border:0px;
		background:#006633;
		color:white;
		padding:13px 0 13px 0;
		vertical-align:center;
	}
	section #searchArea input[type='submit']:hover {
		text-decoration:underline;
	}
	
	section table {
		width:100%;
		border-spacing:0px;
		font-size:14px;
	}
	section table thead tr th {
		font-size:16px;
		border-top:1px solid black;
		border-bottom:1px solid black;
		padding-top:17px;
		padding-bottom:17px;
	}
	section table tbody tr td {
		padding-top:10px;
		padding-bottom:10px;
		border-bottom:1px solid #dddddd;
	}
	
	section #pager {
		margin-top:35px;
	}
	section #pager a {
		text-decoration:none;
		color:black;
	}
	section #pager a:hover {
		text-decoration:underline;
		color:#036;
		cursor:pointer;
	}
	section #pager input {
		border:none;
		padding:8px;
	}
	section #pager input:hover {
		text-decoration:underline;
	}
</style>
<script>
	function check(my) {
		var len = my.keyword.value.trim().length;
		//console.log(len);
		len != 0 ? true : false;
	}
</script>
</head>
<body>

<section>
	<h1>회원정보</h1>
	<div id="container">
		
		<div id="searchArea">
			<form name="search" method="get" action="member" onsubmit="return check(this)">
				<fieldset>
					<input type="hidden" name="page" value="1">
					<input type="search" name="keyword" value="${keyword}" placeholder="검색어를 입력해 주세요." size="30">
					<input type="submit" value="검색">
				</fieldset>
			</form>
		</div>
		
		<table align="center" border="0">
			<thead>
				<tr>
					<th>ID</th>
					<th>이름</th>
					<th>닉네임</th>
					<th>생년월일</th>
					<th>연락처</th>
					<th>이메일</th>
					<th>상태</th>
					<th>가입일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${member}" var="list">
				<c:if test="${list.userid ne 'admin'}">
					<tr>
						<td>${list.userid}</td>
						<td>${list.username}</td>
						<td>${list.nickname}</td>
						<td>${list.birth}</td>
						<td>${list.phone}</td>
						<td>${list.email}</td>
						<td>
							<c:if test="${list.state == 0}"><span style="color:#006633;">정상</span></c:if>
							<c:if test="${list.state == 9}"><span style="color:red;">탈퇴</span></c:if>
						</td>
						<td>${list.writeday}</td>
					</tr>
				</c:if>
				</c:forEach>
			</tbody>
		</table>
		
		<!-- 페이징 : 일반게시글 10개씩 1페이지 / 페이지는 10페이지씩 노출 -->
		<div id="pager">
			<!-- 처음으로 이동 -->
			<c:if test="${page != 1}">
				<a href="member?page=1&keyword=${keyword}"><input type="button" value="1st"></a>
			</c:if>
			
			<!-- 이전 10 페이지 -->
			<c:if test="${pstart > 10}">
				<a href="member?page=${pstart-1}&keyword=${keyword}"><input type="button" value="Prev"></a>
			</c:if>
			
			<!-- 이전 1 페이지 -->
			<c:if test="${page != 1}">
				<a href="member?page=${page-1}&keyword=${keyword}"><input type="button" value="&lt;"></a>
			</c:if>
			
			<c:if test="${pend >= total}">
				<c:set var="pend" value="${total}" />
			</c:if>
			<c:forEach var="i" begin="${pstart}" end="${pend}">
				<c:if test="${i == page}"><span style="color:#036;font-weight:bold;">${i}</span></c:if>
				<c:if test="${i != page}"><a href="member?page=${i}&keyword=${keyword}">${i}</a></c:if>
			</c:forEach>
			
			<!-- 다음 1 페이지 -->
			<c:if test="${page < total}">
				<a href="member?page=${page+1}&keyword=${keyword}"><input type="button" value="&gt;"></a>
			</c:if>
			
			<!-- 다음 10 페이지 -->
			<c:if test="${pend < total}">
				<a href="member?page=${pend+1}&keyword=${keyword}"><input type="button" value="Next"></a>
			</c:if>
			
			<!-- 끝으로 이동 -->
			<c:if test="${page < total}">
				<a href="member?page=${total}&keyword=${keyword}"><input type="button" value="Last"></a>
			</c:if>
		</div>
		
		<!-- 페이징 파라메터 값 확인용 -->
		<div style="display:none;">
			page:${page}<br>
			pstart:${pstart}<br>
			pend:${pend}<br>
			total:${total}<br>
			keyword:${keyword}<br>
		</div>
		
	</div>
</section>
	
</body>
</html>