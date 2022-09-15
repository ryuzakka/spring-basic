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
		margin:80px auto 50px auto;
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
	}
	section main {
		width:1100px;
		margin:auto;
	}
	section main table {
		width:100%;
		border-spacing:0px;
		font-size:13px;
	}
	section main table thead tr th {
		font-size:14px;
		border-top:1px solid black;
		border-bottom:1px solid black;
		padding-top:17px;
		padding-bottom:17px;
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
	<h1> 뉴 스 </h1>
	
	<div class="container">
		<div id="searchArea">
			<form name="search" method="get" action="news_list" onsubmit="return check(this)">
				<fieldset>
					<input type="hidden" name="page" value="1">
					<input type="search" name="keyword" value="${keyword}" placeholder="검색어를 입력해 주세요." size="30">
					<input type="submit" value="검색">
				</fieldset>
			</form>
		</div>
		
		<c:if test="${userid == 'admin'}">
			<div style="display:inline-block;float:right;padding:0px 80px 20px 80px;">
				<button onclick="javascript:location='news_write'">글쓰기</button>
			</div>
		</c:if>
		
		<main>
			<table align="center" border="0">
				<thead>
					<!-- <th> 번호 </th> -->
					<th width="270"> 이미지 </th>
					<th width="145"> 구분 </th>
					<th width="530"> 제목 </th>
					<th width="104"> 등록일 </th>
				</thead>
				<tbody>
				<c:forEach items="${rank}" var="rank">
					<tr>
						<%-- <td> ${rank.id} </td> --%>
						<td> <img src="${pageContext.request.contextPath}/resources/newsimg/${rank.thumbnail}" width="260" /> </td>
						<td>
							<c:if test="${rank.category == 1}">상품 출시</c:if>
							<c:if test="${rank.category == 2}">스타벅스와 문화</c:if>
							<c:if test="${rank.category == 3}">스타벅스 사회공헌</c:if>
							<c:if test="${rank.category == 4}">스타벅스 카드 출시</c:if>
						</td>
						<td><a href="news_viewcnt?id=${rank.id}"> <img src="${pageContext.request.contextPath}/resources/images/icon_whats_new_pin.png" width="16" />${rank.title} </a></td>
						<td> ${rank.writeday} </td>
					</tr>
				</c:forEach>
				<c:forEach items="${list}" var="list">
					<tr>
						<%-- <td> ${list.id} </td> --%>
						<td> <img src="${pageContext.request.contextPath}/resources/newsimg/${list.thumbnail}" width="260" /> </td>
						<td>
							<c:if test="${list.category == 1}">상품 출시</c:if>
							<c:if test="${list.category == 2}">스타벅스와 문화</c:if>
							<c:if test="${list.category == 3}">스타벅스 사회공헌</c:if>
							<c:if test="${list.category == 4}">스타벅스 카드 출시</c:if>
						</td>
						<td><a href="news_viewcnt?id=${list.id}"> ${list.title} </a></td>
						<td> ${list.writeday} </td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</main>
		
		<!-- 페이징 : 일반게시글 10개씩 1페이지 / 페이지는 10페이지씩 노출 -->
		<div id="pager">
			<!-- 처음으로 이동 -->
			<c:if test="${page != 1}">
				<a href="news_list?page=1&keyword=${keyword}"><input type="button" value="처음"></a>
			</c:if>
			
			<!-- 이전 10 페이지 -->
			<c:if test="${pstart > 10}">
				<a href="news_list?page=${pstart-1}&keyword=${keyword}"><input type="button" value="이전"></a>
			</c:if>
			
			<!-- 이전 1 페이지 -->
			<c:if test="${page != 1}">
				<a href="news_list?page=${page-1}&keyword=${keyword}"><input type="button" value="&lt;"></a>
			</c:if>
			
			<c:if test="${pend >= total}">
				<c:set var="pend" value="${total}" />
			</c:if>
			<c:forEach var="i" begin="${pstart}" end="${pend}">
				<c:if test="${i == page}">${i}</c:if>
				<c:if test="${i != page}"><a href="news_list?page=${i}&keyword=${keyword}">${i}</a></c:if>
			</c:forEach>
			
			<!-- 다음 1 페이지 -->
			<c:if test="${page < total}">
				<a href="news_list?page=${page+1}&keyword=${keyword}"><input type="button" value="&gt;"></a>
			</c:if>
			
			<!-- 다음 10 페이지 -->
			<c:if test="${pend < total}">
				<a href="news_list?page=${pend+1}&keyword=${keyword}"><input type="button" value="다음"></a>
			</c:if>
			
			<!-- 끝으로 이동 -->
			<c:if test="${page < total}">
				<a href="news_list?page=${total}&keyword=${keyword}"><input type="button" value="끝"></a>
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