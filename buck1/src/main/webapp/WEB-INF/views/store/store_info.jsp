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
	section #searchArea {
		width:600px;
		/* margin:60px auto; */
		margin:40px auto;
		/* padding-left:133px; */
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
	section table {
		width:90%;
		border-spacing:0px;
		margin:30px auto 40px auto;
	}
	section table tr td:nth-child(2) {
		text-align:left;
		padding-left:10px;
	}
	section table tr:first-child td {
		font-weight:600;
		text-align:center;
	}
	section table tr td {
		text-align:center;
		padding:8px 0px;
	}
	section table tr td img {
		display:block;
		width:120px;
		margin:auto;
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
	<h1>매장 정보</h1>
	
	<div id="searchArea">
		<form name="search" method="get" action="store_info" onsubmit="return check(this)">
			<fieldset>
				<!-- <legend> 키워드 검색 </legend> -->
				<input type="hidden" name="page" value="1">
				<input type="search" name="keyword" list="rec" value="${keyword}" placeholder="키워드 검색 (매장명 또는 지역명)" size="30">
				<datalist id="rec">
					<option value="대화동">대화동</option>
					<option value="주엽동">주엽동</option>
					<option value="일산동">일산동</option>
					<option value="덕이동">덕이동</option>
					<option value="탄현동">탄현동</option>
				</datalist>
				<input type="submit" value="검색">
			</fieldset>
		</form>
	</div>
	
	<table align="center" border="1">
		<tr>
			<!-- <th> No. </th> -->
			<th> 매장이름 </th>
			<th> 매장위치 </th>
			<th> 매장상태 </th>
			<th> 매장사진 </th>
		</tr>
		<c:forEach items="${store}" var="store">
			<tr>
				<%-- <td> ${store.rnum} </td> --%>
				<td> ${store.storename} </td>
				<td> ${store.addr1} (${store.addr2}) </td>
				<td>
					<c:if test="${store.state == 0}">등록중</c:if>
					<c:if test="${store.state == 1}">오픈대기중</c:if>
					<c:if test="${store.state == 2}">운영중</c:if>
					<c:if test="${store.state == 4}">임시 휴점</c:if>
					<c:if test="${store.state == 7}">리뉴얼 준비중</c:if>
					<c:if test="${store.state == 8}">보수공사중</c:if>
					<c:if test="${store.state == 9}">폐점</c:if>
				</td>
				<td>
					<c:if test="${store.storeimg != null}">
						<img src="${pageContext.request.contextPath}/resources/storeimg/${store.storeimg}">
					</c:if>
				</td>
			</tr>		
		</c:forEach>
	</table>
	
	<div id="pager">
		<!-- 처음으로 이동 -->
		<c:if test="${page != 1}">
			<a href="store_info?page=1&keyword=${keyword}"><input type="button" value="처음"></a>
		</c:if>
		
		<!-- 이전 10 페이지 -->
		<c:if test="${pstart > 10}">
			<a href="store_info?page=${pstart-1}&keyword=${keyword}"><input type="button" value="이전"></a>
		</c:if>
		
		<!-- 이전 1 페이지 -->
		<c:if test="${page != 1}">
			<a href="store_info?page=${page-1}&keyword=${keyword}"><input type="button" value="&lt;"></a>
		</c:if>
		
		<c:if test="${pend >= total}">
			<c:set var="pend" value="${total}" />
		</c:if>
		<c:forEach var="i" begin="${pstart}" end="${pend}">
			<c:if test="${i == page}">${i}</c:if>
			<c:if test="${i != page}"><a href="store_info?page=${i}&keyword=${keyword}">${i}</a></c:if>
		</c:forEach>
		
		<!-- 다음 1 페이지 -->
		<c:if test="${page < total}">
			<a href="store_info?page=${page+1}&keyword=${keyword}"><input type="button" value="&gt;"></a>
		</c:if>
		
		<!-- 다음 10 페이지 -->
		<c:if test="${pend < total}">
			<a href="store_info?page=${pend+1}&keyword=${keyword}"><input type="button" value="다음"></a>
		</c:if>
		
		<!-- 끝으로 이동 -->
		<c:if test="${page < total}">
			<a href="store_info?page=${total}&keyword=${keyword}"><input type="button" value="끝"></a>
		</c:if>
	</div>
	
	<div style="display:none;">
		page:${page}<br>
		pstart:${pstart}<br>
		pend:${pend}<br>
		total:${total}<br>
		keyword:${keyword}<br>
	</div>
	
</section>

</body>
</html>