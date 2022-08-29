<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>pro_list</title>
<style>
	section {
		width:auto;
		height:auto;
		margin:80px auto 50px auto;
		text-align:center;
	}
	.list {
		width:900px;
		margin:auto;
		/* border:1px solid green; */
		display:flex;
		flex-flow:row wrap;
		justify-content:left;
	}
	.list .prod {
		width:285px;
		height:300px;
		display:inline-block;
		padding:30px 0 30px 13px;
	}
</style>
</head>
<body>
	
	<h2>상품 리스트</h2>
	
	<section>
		<div class="list">
			<c:forEach items="${list}" var="product">
				<div class="prod">${product.title}<p></div>
			</c:forEach>
		</div>
	</section>
	
	
	<%-- <table width="1800" border="1" align="center">
		<tr>
			<td>상품코드</td>
			<td>상품이미지</td>
			<td>상품명</td>
			<td>가격</td>
			<td>제조사</td>
			<td>할인율</td>
			<td>적립</td>
			<td>수량</td>
			<td>배송비</td>
			<td>배송소요일</td>
			<td>작성일</td>
		</tr>
		<c:forEach items="${list}" var="product">
			<tr>
				<td>${product.pcode}</td>
				<td><img src="${pageContext.request.contextPath}/resources/img/${product.pimg }" width="500"></td>
				<td>${product.title }</td>
				<td>${product.price }</td>
				<td>${product.made }</td>
				<td>${product.halin }</td>
				<td>${product.juk }</td>
				<td>${product.su }</td>
				<td>${product.baesong }</td>
				<td>${product.baeday }</td>
				<td>${product.writeday }</td>
			</tr>
		</c:forEach>
	</table> --%>
	
	
</body>
</html>