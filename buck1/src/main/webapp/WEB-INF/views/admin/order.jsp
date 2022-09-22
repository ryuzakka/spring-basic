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
		margin:70px auto;
		/* text-align:center; */
	}
	section h2 {
		font-size:2em;
		text-align:center;
	}
	section #container {
		width:800px;
		margin:auto;
	}
	section #container ol {
		margin-top:50px;
	}
	section #container ol .order-list {
		margin:20px auto;
		border-bottom:1px solid #dddddd;
	}
	section #container ol .order-list dl {
		margin:0px;
		padding:0px;
		display:flex;
		justify-content:space-between;
	}
	section #container ol .order-list .title > div {
		display:inline-block;
		/* border:1px solid #dddddd; */
		padding:0px 10px;
		margin:0px 6px;
	}
	section #container ol .order-list .title > div dt {		
		margin:0px;
		padding:0px;
		font-size:12px;
		font-style:italic;
	}
	section #container ol .order-list .title > div dd {	
		margin:0px;
		padding:4px 0px 0px 0px;
		font-size:15px;
		font-weight:bold;
	}
	section #container ol .order-list .title dd {
		/* margin:0px;
		padding:0px; */
	}
	section #container ol .order-list .title .product-cnt {
		display:inline-block;
		width:16px;
		height:16px;
		border:none;
		border-radius:50%;
		background:#006633;
		color:white;
		font-size:12px;
		text-align:center;
	}
	section #container ol .order-list .product {
		display:none;
		padding-left:20px;
		margin:8px 260px 8px 15px;
		/* margin-left:15px;
		margin-right:260px; */
		background:#f6f5ef;
	}
	section #container ol .order-list .product > div {
		display:inline-block;
		/* border:1px solid #dddddd; */
		padding:5px 10px;
/* 		margin:0px 6px; */
	}
	section #container ol .order-list .product dt {
		/* display:inline-block; */
		margin:0px;
		padding:0px;
		font-size:12px;
		font-style:italic;
	}
	section #container ol .order-list .product dd {
		/* display:inline-block; */
		margin:0px;
		padding:0px;
		font-size:15px;
		font-weight:bold;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(function(){
		$(".order-list").mouseenter(function(){
			$(this).css("background","#dddddd");
		});
		$(".order-list").mouseleave(function(){
			$(this).css("background","white");
		});
		$(".order-list").click(function(){
			$(this).find(".product").stop().slideToggle();
		});
	});
</script>
</head>

<body>
<section>
	<h2>주문 관리</h2>
	
	<div id="container">
		<%-- <table align="center" border="0">
			<thead>
				<tr>
					<th>주문번호</th>
					<th>주문자</th>
					<th>주문매장</th>
					<th>주문상태</th>
					<th>주문시간</th>
					<th>cnt</th>
				</tr>
			</thead>
			<tbody>
			<c:set var="count" value="" />
			<c:forEach items="${order}" var="order">
				<c:set var="count" value="${count = order.cnt}" />
				<c:forEach items="${items}" var="item">
					<c:if test="${item.order_code == order.order_code}">
					<tr class="oNode">
						<td>${order.order_code}</td>
						<td>${order.nickname}</td>
						<td>${order.storename}</td>
						<td>
							<c:if test="${order.state == 1}">접수 대기중</c:if>
							<c:if test="${order.state == 2}">주문확인</c:if>
							<c:if test="${order.state == 3}">제조완료</c:if>
							<c:if test="${order.state == 4}">수령완료</c:if>
						</td>
						<td>${order.writetime}</td>
						<td>${count}</td>
					</tr>
					<c:set var="count" value="${count = count - 1}" />
					</c:if>
				</c:forEach>
			</c:forEach>
			</tbody>
		</table> --%>
		
		<!--  -->
		<!--  -->
		
		<ol>
			<c:set var="cnt" value="" />
			<c:forEach items="${order}" var="order">
				<li class="order-list">
					<c:set var="cnt" value="${cnt = order.cnt}" />
					<c:forEach items="${items}" var="item">
						<c:if test="${order.order_code == item.order_code}">
							<c:if test="${cnt == order.cnt}">
								<dl class="title">
									<div style="width:168px;">
										<dt>주문번호</dt>
										<dd>
											${item.order_code}
											<div class="product-cnt">${order.cnt}</div>
										</dd>
									</div>
									<div style="width:100px;">
										<dt>주문자</dt>
										<dd>${item.nickname}</dd>
									</div>
									<div style="width:130px;">
										<dt>주문매장</dt>
										<dd>${item.storename}</dd>
									</div>
									<div style="width:100px;">
										<dt>주문상태</dt>
										<dd>
											<c:if test="${item.state == 1}">접수 대기중</c:if>
											<c:if test="${item.state == 2}">주문확인</c:if>
											<c:if test="${item.state == 3}">제조완료</c:if>
											<c:if test="${item.state == 4}">수령완료</c:if>
										</dd>
									</div>
									<div  style="width:80px;">
										<dt>주문시간</dt>
										<dd>${item.writetime}</dd>
									</div>
								</dl>
							</c:if>
							<dl class="product">
								<div style="width:260px;">
									<dt>메뉴명</dt>
									<dd>${item.name}</dd>
								</div>
								<div style="width:80px;">
									<dt>사이즈</dt>
									<dd>
										<c:choose>
											<c:when test="${item.size == 1}">Short</c:when>
											<c:when test="${item.size == 2}">Tall</c:when>
											<c:when test="${item.size == 3}">Grande</c:when>
											<c:when test="${item.size == 4}">Venti</c:when>
										</c:choose>
									</dd>
								</div>
								<div style="width:50px;">
									<dt>수량</dt>
									<dd>${item.unit}</dd>
								</div>
							</dl>
							<c:set var="cnt" value="${cnt = cnt-1}" />
						</c:if>
					</c:forEach>
				</li>
			</c:forEach>
		</ol>
		
		<!--  -->
		<!--  -->

	</div>
</section>

</body>
</html>