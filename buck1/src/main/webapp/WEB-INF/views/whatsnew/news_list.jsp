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
	<h2> 뉴스 </h2>
	
	<div class="container">
		<div id="searchArea">
			<form name="search" method="get" action="news_list" onsubmit="return check(this)">
				<fieldset>
					<!-- <legend> 키워드 검색 </legend> -->
					<input type="hidden" name="page" value="1">
					<input type="search" name="keyword" list="rec" value="${keyword}" placeholder="검색어를 입력해 주세요." size="30">
					<!-- <datalist id="rec">
						<option value="대화동">대화동</option>
						<option value="주엽동">주엽동</option>
						<option value="일산동">일산동</option>
						<option value="덕이동">덕이동</option>
						<option value="탄현동">탄현동</option>
					</datalist> -->
					<input type="submit" value="검색">
				</fieldset>
			</form>
		</div>
		
		<main>
			<table align="center" border="1">
				<thead>
					<!-- <th> 번호 </th> -->
					<th> 이미지 </th>
					<th> 구분 </th>
					<th> 제목 </th>
					<th> 등록일 </th>
				</thead>
				<tbody>
				<c:forEach items="${rank}" var="rank">
					<tr>
						<%-- <td> ${rank.id} </td> --%>
						<td> <img src="/resources/newsimg/${rank.id}" width="100" /> </td>
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
						<td> <img src="/resources/newsimg/${list.id}" width="100" /> </td>
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
			
			<c:if test="${userid == 'admin'}">
				<button onclick="javascript:location='news_write'">글쓰기</button>
			</c:if>
		</main>
	
	</div>
</section>
</body>
</html>