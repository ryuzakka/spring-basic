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
		width:900px;
		height:auto;
		margin:80px auto 50px auto;
		text-align:center;
	}
	section table {
		width:90%;
		border-spacing:0px;
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
</head>
<body>

<section>
	<h1>매장 정보</h1>
	
	<table align="center" border="1">
		<tr>
			<td> 매장이름 </td>
			<td> 매장위치 </td>
			<td> 매장상태 </td>
			<td> 매장사진 </td>
		</tr>
		<c:forEach items="${store}" var="store">
			<tr>
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
</section>

</body>
</html>