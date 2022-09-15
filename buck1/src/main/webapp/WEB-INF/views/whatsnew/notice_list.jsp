<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	<h2> 공지사항 </h2>
	
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
		
		<main>
			<table align="center" border="1">
				<thead>
					<th> 번호 </th>
					<th> 제목 </th>
					<th> 날짜 </th>
					<th> 조회수 </th>
				</thead>
				<tbody>
				<c:forEach items="${list}" var="list">
					<tr>
						<td> ${list.id} </td>
						<td><a href="notice_viewcnt?id=${list.id}"> ${list.title} </a></td>
						<td> ${list.writeday} </td>
						<td> ${list.viewcnt} </td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			
			<c:if test="${userid == 'admin'}">
				<button onclick="javascript:location='notice_write'">글쓰기</button>
			</c:if>
		</main>
		
		<!-- 페이징 : 일반게시글 10개씩 1페이지 / 페이지는 10페이지씩 노출 -->
		<div id="pager">
			<!-- 처음으로 이동 -->
			<c:if test="${page != 1}">
				<a href="notice_list?page=1&keyword=${keyword}"><input type="button" value="처음"></a>
			</c:if>
			
			<!-- 이전 10 페이지 -->
			<c:if test="${pstart > 10}">
				<a href="notice_list?page=${pstart-1}&keyword=${keyword}"><input type="button" value="이전"></a>
			</c:if>
			
			<!-- 이전 1 페이지 -->
			<c:if test="${page != 1}">
				<a href="notice_list?page=${page-1}&keyword=${keyword}"><input type="button" value="&lt;"></a>
			</c:if>
			
			<c:if test="${pend >= total}">
				<c:set var="pend" value="${total}" />
			</c:if>
			<c:forEach var="i" begin="${pstart}" end="${pend}">
				<c:if test="${i == page}">${i}</c:if>
				<c:if test="${i != page}"><a href="notice_list?page=${i}&keyword=${keyword}">${i}</a></c:if>
			</c:forEach>
			
			<!-- 다음 1 페이지 -->
			<c:if test="${page < total}">
				<a href="notice_list?page=${page+1}&keyword=${keyword}"><input type="button" value="&gt;"></a>
			</c:if>
			
			<!-- 다음 10 페이지 -->
			<c:if test="${pend < total}">
				<a href="notice_list?page=${pend+1}&keyword=${keyword}"><input type="button" value="다음"></a>
			</c:if>
			
			<!-- 끝으로 이동 -->
			<c:if test="${page < total}">
				<a href="notice_list?page=${total}&keyword=${keyword}"><input type="button" value="끝"></a>
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