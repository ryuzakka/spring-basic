<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<title>Insert title here</title>
</head>

<body>
<section>
	<h2>주문 관리</h2>
	
	<div id="container">
		<table align="center" border="0">
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
		</table>
		
		<!--  -->
		<!--  -->
		
		<ol>
			<c:set var="cnt" value="" />
			<c:forEach items="${order}" var="order">
				<li class="oNode">
				<c:set var="cnt" value="${cnt = order.cnt}" />
					<c:forEach items="${items}" var="item">
					<c:if test="${order.order_code == item.order_code}">
						<c:if test="${cnt == order.cnt}">
							<dl>
								<dt>주문번호</dt>
								<dt>주문자</dt>
								<dt>주문매장</dt>
								<dt>주문상태</dt>
								<dt>주문시간</dt><br>
								<dd>
									${item.order_code}
									<div style="display:inline-block;width:16px;height:16px;border:none;border-radius:50%;background:#006633;color:white;font-size:12px;text-align:center;">${order.cnt}</div>
								</dd>
								<dd>${item.nickname}</dd>
								<dd>${item.storename}</dd>
								<dd>
									<c:if test="${item.state == 1}">접수 대기중</c:if>
									<c:if test="${item.state == 2}">주문확인</c:if>
									<c:if test="${item.state == 3}">제조완료</c:if>
									<c:if test="${item.state == 4}">수령완료</c:if>
								</dd>
								<dd>${item.writetime}</dd>
							</dl>
						</c:if>
						<%-- <c:if test="${item.order_code == order.order_code}"> --%>
						<dl class="option">
							<dt>메뉴명</dt>
							<dd>${item.name}</dd>
							<dt>사이즈</dt>
							<dd>
								<c:choose>
									<c:when test="${item.size == 1}">Short</c:when>
									<c:when test="${item.size == 2}">Tall</c:when>
									<c:when test="${item.size == 3}">Grande</c:when>
									<c:when test="${item.size == 4}">Venti</c:when>
								</c:choose>
							</dd>
							<dt>수량</dt>
							<dd>${item.unit}</dd>
						</dl>
						<%-- </c:if> --%>
						<c:set var="cnt" value="${cnt = cnt-1}" />
					</c:if>
					</c:forEach>
				</li>
			<%-- <c:set var="cnt" value="${cnt = 1}" /> --%>
			</c:forEach>
		</ol>
		
		<!--  -->
		<!--  -->
		
		<%-- <ol>
			<li>
			<c:set var="orderCode" value="" />
			<c:forEach items="${order}" var="order">
				<ul><li style="display:inline-block;">
				<dl class="oNode">
				<c:if test="${orderCode != order.order_code}">
					<dt>주문번호</dt>
					<dt>주문자</dt>
					<dt>주문매장</dt>
					<dt>주문상태</dt><br>
					<dd>${order.order_code}</dd>
					<dd>${order.nickname}</dd>
					<dd>${order.storename}</dd>
					<dt>주문시간</dt>
					<dd>
						<c:if test="${order.state == 1}">접수 대기중</c:if>
						<c:if test="${order.state == 2}">주문확인</c:if>
						<c:if test="${order.state == 3}">제조완료</c:if>
						<c:if test="${order.state == 4}">수령완료</c:if>
					</dd>
					<dd>${order.writetime}</dd>
				</c:if>
					<c:forEach items="${items}" var="item">
					<c:if test="${item.order_code = order.order_code}">
						<dl class="option">
							<caption>주문정보</caption>
							<dt>메뉴명</dt>
							<dd>${order.name}</dd>
							<dt>사이즈</dt>
							<dd>
								<c:choose>
									<c:when test="${order.size == 1}">Short</c:when>
									<c:when test="${order.size == 2}">Tall</c:when>
									<c:when test="${order.size == 3}">Grande</c:when>
									<c:when test="${order.size == 4}">Venti</c:when>
								</c:choose>
							</dd>
							<dt>수량</dt>
							<dd>${order.unit}</dd>
						</dl>
					</c:if>
					</c:forEach>
				</dl>
			
				<dl class="oNode">dl
					<dd class="option">${order.order_code}</dd>
					<dd class="option">${order.nickname}</dd>
					<dd class="option">${order.storename}</dd>
					<dd class="option">
						<c:if test="${order.state == 1}">접수 대기중</c:if>
						<c:if test="${order.state == 2}">주문확인</c:if>
						<c:if test="${order.state == 3}">제조완료</c:if>
						<c:if test="${order.state == 4}">수령완료</c:if>
					</dd>
					<dd class="option">${order.writetime}</dd>
				</dl>
			</li>
			</ul>
			<c:set var="orderCode" value="${order.order_code}"></c:set>
			</c:forEach>
			</li>
		</ol> --%>

	</div>
</section>
<style>
	dt, dd {		
		display:inline-block;
	}
	.oNode dt, dd {
		display:inline-block;
	}
	.option {
		display:none;
	}
</style>
<script>
	$(function(){
		$(".oNode").mouseenter(function(){
			$(this).css("background","yellow");
		});
		$(".oNode").mouseleave(function(){
			$(this).css("background","white");
		});
		$(".oNode").click(function(){
			$(this).find(".option").stop().slideToggle();
		});
	});
</script>
</body>
</html>