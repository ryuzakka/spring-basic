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
	section button {
		padding:12px 0;
		border:none;
		border-bottom:1px solid #DDD;
		border-radius:3px;
		width:70px;
		text-align:center;
	}
	section button:hover {
		color:white;
		background:#006633;
		text-decoration:underline;
	}
	section main {
		width:1100px;
		margin:auto;
	}
	section main a {
		color:black;
		text-decoration:none;
		cursor:pointer;
	}
	section main a:hover {
		text-decoration:underline;
	}
	section main table {
		width:100%;
		border-spacing:0px;
		font-size:16px;
	}
	section main table thead tr th {
		font-size:14px;
		border-top:1px solid black;
		border-bottom:1px solid black;
		padding-top:17px;
		padding-bottom:17px;
	}
	section main table tbody tr:hover {
		text-decoration:underline;
		cursor:pointer;
	}
	section main table tbody tr td {
		padding-top:20px;
		padding-bottom:20px;
		border-bottom:1px solid #dddddd;
	}
	section main table tbody tr td:nth-child(3) {
		text-align:left;
		padding-left:20px;
	}
	section main button {
		margin:30px auto;
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
</head>
<body>
<!-- 
	[공지사항] 
	목록: 번호 / 제목 / 날짜 / 조회수
	상세: 제목 / 내용 / 윗글  /아랫글
	[이벤트]
	목록: 카테고리 / 썸네일 / 제목 / 기간(시작일-종료일)
	상세: 제목 / 이미지 / 진행이벤트(롤링)
	[뉴스]
	목록: 카테고리 / 번호 / 썸네일 / 제목 / 등록일 / 공지여부
	상세: 제목 / 이미지 / 윗글 / 아랫글
-->
	
<section>
	<h1> 공지사항 </h1>
	
	<div class="container">
		<div id="searchArea">
			<form name="search" method="get" action="notice_list" onsubmit="return check(this)">
				<fieldset>
					<input type="hidden" name="page" value="1">
					<input type="search" name="keyword" value="${keyword}" placeholder="검색어를 입력해 주세요." size="30">
					<input type="submit" value="검색">
				</fieldset>
			</form>
		</div>
		
		<c:if test="${userid == 'admin'}">
			<div style="display:inline-block;float:right;padding:0px 80px 20px 80px;">
				<button onclick="javascript:location='notice_write'">글쓰기</button>
			</div>
		</c:if>
		
		<main>
			<table align="center" border="0">
				<thead>
					<th width="60"> 번호 </th>
					<th> 제목 </th>
					<th width="120"> 날짜 </th>
					<th width="90"> 조회수 </th>
				</thead>
				<tbody>
				<c:forEach items="${list}" var="list">
					<tr onclick="javascript:location='notice_viewcnt?id=${list.id}'">
						<td> ${list.rnum} </td>
						<td style="padding-left:12px;text-align:left;"> ${list.title} </td>
						<td> ${list.writeday} </td>
						<td> ${list.viewcnt} </td>
					</tr>
				</c:forEach>
				<c:if test="${total eq 0}">
					<tr><td colspan="4"><span>조회된 결과가 없습니다.</span></td></tr>
				</c:if>
				</tbody>
			</table>
			
		</main>
		
		<!-- 페이징 : 일반게시글 10개씩 1페이지 / 페이지는 10페이지씩 노출 -->
		<div id="pager">
			<!-- 처음으로 이동 -->
			<c:if test="${page != 1}">
				<a href="notice_list?page=1&keyword=${keyword}"><input type="button" value="1st"></a>
			</c:if>
			
			<!-- 이전 10 페이지 -->
			<c:if test="${pstart > 10}">
				<a href="notice_list?page=${pstart-1}&keyword=${keyword}"><input type="button" value="Prev"></a>
			</c:if>
			
			<!-- 이전 1 페이지 -->
			<c:if test="${page != 1}">
				<a href="notice_list?page=${page-1}&keyword=${keyword}"><input type="button" value="&lt;"></a>
			</c:if>
			
			<c:if test="${pend >= total}">
				<c:set var="pend" value="${total}" />
			</c:if>
			<c:forEach var="i" begin="${pstart}" end="${pend}">
				<c:if test="${i == page}"><span style="color:#036;font-weight:bold;">${i}</span></c:if>
				<c:if test="${i != page}"><a href="notice_list?page=${i}&keyword=${keyword}">${i}</a></c:if>
			</c:forEach>
			
			<!-- 다음 1 페이지 -->
			<c:if test="${page < total}">
				<a href="notice_list?page=${page+1}&keyword=${keyword}"><input type="button" value="&gt;"></a>
			</c:if>
			
			<!-- 다음 10 페이지 -->
			<c:if test="${pend < total}">
				<a href="notice_list?page=${pend+1}&keyword=${keyword}"><input type="button" value="Next"></a>
			</c:if>
			
			<!-- 끝으로 이동 -->
			<c:if test="${page < total}">
				<a href="notice_list?page=${total}&keyword=${keyword}"><input type="button" value="Last"></a>
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