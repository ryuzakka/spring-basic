<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
	function paymentType(val) {
		document.getElementById('starbucksCard').style.display = "none";
		document.getElementById('creditCard').style.display = "none";
		document.getElementById('ssgPay').style.display = "none";
		document.getElementById(val).style.display = "block";
	}
</script>
<style>
	h2 {
		text-align:center;
	}
	section {
		width:500px;
		margin:auto;
	}
	section #payment, #coupon, #eGift, #receipts {
		border-bottom:2px solid lightgrey;
		padding-bottom:13px;
	}
	section #payment .selectedPayment {
		margin-top:16px;
		/* padding-bottom:13px; */
	}
	section #payment .selectedPayment div {
		display:inline-block;
	}
	section #payment .selectedPayment div:nth-child(2) {
		vertical-align:top;
	}
	section #payment .selectedPayment img {
		width:110px;
		vertical-align:middle;
	}
	
</style>
</head>
<body>
	
	<!-- 
		1. 결제 수단
		2. 쿠폰/할인
		3. 현금영수증
		4. 주문내역  => 상품이미지+상품명+타입+사이즈  (수량정보 없이 1개씩 노출)
		5. 주문금액 / 할인금액 / 최종 결제 금액
	 -->

	<h2>결제하기</h2>
	<section>

	<form method="post" action="">
		<input type="hidden" name="cartId" value="${param.ids}">
		<input type="hidden" name="pCode" value="${param.codes}">
		<input type="hidden" name="pUnit" value="${param.units}">

		<!-- 결제수단 선택 -->
		<div id="payment">
			<h4>결제 수단</h4>
			<div>
				<select id="payment" name="payment" onchange="paymentType(this.value)">
					<option value="starbucksCard">스타벅스 카드</option>
					<option value="creditCard">신용카드</option>
					<option value="ssgPay">SSGPAY</option>
				</select>
			</div>
			<div id="starbucksCard" class="selectedPayment">
				<div><img src="${pageContext.request.contextPath}/resources/images/e_gold_card.png"></div>
				<div>
					<span>스타벅스 카드</span><br>
					<span>충전금액</span>
				</div>
			</div>
			<div id="creditCard" class="selectedPayment" style="display:none">
				<div><img src="${pageContext.request.contextPath}/resources/images/credit01.png"></div>
				<div>
					<span>신용카드</span><br>
					<span>??</span>
				</div>
			</div>
			<div id="ssgPay" class="selectedPayment" style="display:none">
				<div><img src="${pageContext.request.contextPath}/resources/images/ssgpay.png"></div>
				<div>SSGPAY</div>
			</div>
		</div>
		
		<!-- 할인수단 선택 -->
		<div id="discount">
			<div id="coupon">
				<h4>쿠폰</h4>
				<input type="radio" name="coupon" id="미사용" value="미사용" checked>
				<label for="미사용">미사용</label>
				<input type="radio" name="coupon" id="사용" value="사용">
				<label for="사용">사용</label>
				<select>
					<%-- <c:forEach var="" begin="" end=""> --%>
						<option value=""></option>
					<%-- </c:forEach> --%>
				</select>
			</div>
			<div id="eGift">
				<h4>eGift</h4>
				<input type="radio" name="gift" id="미사용" value="미사용" checked>
				<label for="미사용">미사용</label>
				<input type="radio" name="gift" id="사용" value="사용">
				<label for="사용">사용</label>
				<select>
					<%-- <c:forEach var="" begin="" end=""> --%>
						<option value=""></option>
					<%-- </c:forEach> --%>
				</select>
			</div>
		</div>
		
		<!-- 현금영수증 선택 -->
		<div id="receipts">
			<h4>현금영수증</h4>
			<input type="radio" name="receipt" id="신청안함" value="신청안함" checked>
			<label for="신청안함">신청안함</label>
			<input type="radio" name="receipt" id="개인소득공제" value="개인소득공제">
			<label for="개인소득공제">개인소득공제</label>
			<input type="radio" name="receipt" id="사업자증빙용" value="사업자증빙용">
			<label for="사업자증빙용">사업자증빙용</label>
			<div class="receiptType"></div>
			<div class="receiptType"></div>
		</div>
		
		<!-- 주문내역 -->
		<div id="orderList">
			<h4>주문내역</h4>
			<ul>
				<c:forEach items="${cart}" var="cart">
					<li>
						<img src="${pageContext.request.contextPath}/resources/images/${cart.name}.jpg" alt="상품이미지">
						<div>${cart.name}</div>
						<ul>
							<li>
								<c:if test="${cart.type == 1}">Hot</c:if>
								<c:if test="${cart.type == 2}">Ice</c:if>
							</li>
							<li>								
								<c:if test="${cart.size == 1}">Short</c:if>
								<c:if test="${cart.size == 2}">Tall</c:if>
								<c:if test="${cart.size == 3}">Grande</c:if>
								<c:if test="${cart.size == 4}">Venti</c:if>
							</li>
						</ul>
					</li>
				</c:forEach>
			</ul>
		</div>
		
		<!-- 결제금액 정보 -->
		<div id="finalCost">
			<table>
				<tr>
					<td>주문 금액</td>
					<td><fmt:formatNumber value="${param.cost}"/>원</td>
				</tr>
				<tr>
					<td>할인 금액</td>
					<td></td>
				</tr>
				<tr>
					<td>최종 결제 금액</td>
					<td></td>
				</tr>
			</table>
		</div>
		
		<div>
			<input type="submit" value="(최종결제금액)원 결제하기">
		</div>	
	</form>

	</section>
	
</body>
</html>