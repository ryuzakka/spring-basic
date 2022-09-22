<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
	section {
		width:auto;
		height:auto;
		margin:60px auto 80px auto;
		text-align:center;
	}
	section h2 {
		font-size:2em;
	}
	section .order {
		margin-bottom:20px;
	}
	section .order .menu-list {
		padding:0px;
		/* border:1px solid green; */
		text-align:left;
	}
	section .order .menu-list .items {
		list-style:none;
		padding:7px 8px 7px 22px;
		margin:4px 8px;
		height:60px;
		background:#f6f5ef;
	}
	section .order .menu-list .items div {
		display:inline-block;
	}
	section .order .menu-list .items div input[type='button'] {
		width:50px;
		height:50px;
		border:none;
		border-radius:50%;
		background:#006633;
		color:white;
		font-size:9px;
	}
	section .order .menu-list .items div input[type='button']:hover {}
	section .order .menu-list .items dl {
		display:inline-block;
		margin:0px;
		padding-top:8px;
		vertical-align:top;
	}
	section .order .menu-list .items dl dd {
		display:inline-block;
		vertical-align:top;
		margin:5px 3px 0px 3px;
		font-size:11px;
	}
</style>

</head>
<body>

<section>
	
	
	
	
	<!-- 주문확인 -->
	<div class="order">
		
		<h2>나의 주문</h2>
		
		<c:forEach items="${store}" var="store">
			<c:if test="${store.state < 4}">
			<!-- <div style="display:block;margin:20px auto;"> -->
			<fieldset style="display:block;width:440px;border:1px solid #999999;margin:35px auto 40px auto;text-align:center;">
				<legend style="width:50%;height:30px;padding-top:7px;background:#f6f5ef;"> 주문번호 : ${store.order_code}</legend>
				<!-- 주문매장 -->
				<div id="store" style="display:inline-block;border:none;margin-top:15px;padding:0px;">
					<!-- <legend style="width:50%;height:30px;padding-top:7px;background:#f6f5ef;">선택 매장</legend> -->
					<div style="display:inline-block;width:340px;margin:auto"><img src="${pageContext.request.contextPath}/resources/storeimg/${store.storeimg}" width="100%"/></div>
					<dl style="display:inline-block;width:340px;text-align:left;vertical-align:top;margin-top:14px;">
						<dt style="font-weight:bold;">${store.storename}</dt>
						<dd style="margin:0px;padding:0px;">${store.addr1}</dd>
					</dl>
				</div>
				<!-- 주문내역 -->
				<ul class="menu-list">
					<c:forEach items="${order}" var="order">
						<c:if test="${order.order_code eq store.order_code}">
							<li class="items">
								<!-- 주문 상품 리스트 -->
								<div>
									<img 
										src="${pageContext.request.contextPath}/resources/images/${order.name}.jpg" 
										alt="상품이미지"
										height="60" />
								</div>
								<dl>
									<dt>${order.name}</dt>
									<dd>
										<c:if test="${order.type == 1}"><span style="color:red;">Hot</span></c:if>
										<c:if test="${order.type == 2}"><span style="color:blue;">Ice</span></c:if>
									</dd>
									<dd>|</dd>
									<dd>
										<c:if test="${order.size == 1}">Short</c:if>
										<c:if test="${order.size == 2}">Tall</c:if>
										<c:if test="${order.size == 3}">Grande</c:if>
										<c:if test="${order.size == 4}">Venti</c:if>
									</dd>
									<dd>|</dd>
									<dd>수량 : ${order.unit}</dd>
								</dl>
								<!-- 주문 상태 -->
								<div style="vertical-align:top;float:right;margin-top:5px;padding-right:6px;">
									<c:set var="status" value="" />
									<c:choose>
										<c:when test="${order.state == 1}"><c:set var="status" value="주문접수" /></c:when>
										<c:when test="${order.state == 2}"><c:set var="status" value="주문확인" /></c:when>
										<c:when test="${order.state == 3}"><c:set var="status" value="준비완료" /></c:when>
										<%-- <c:when test="${order.state == 4}"><c:set var="status" value="수령완료" /></c:when> --%>
									</c:choose>
									<input type="button" value="${status}" />
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
				
				
			</fieldset>
			</c:if>
		</c:forEach>
	</div>
	
</section>

</body>
</html>