<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${userid == null}">
	<c:redirect url="../member/signin?err=3" />
</c:if>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
	section {
		width:500px;
		margin:55px auto;
	}
	section h2 {
		text-align:center;
		font-size:2em;
	}
	section .section {
		margin-bottom:45px;
	}
	section .section h4 {
		margin-bottom:10px;
	}
	section #payment, #coupon, #eGift, #receipts {
		border-bottom:2px solid lightgrey;
/* 		padding-bottom:13px; */
	}
	section #paymentList {
		width:120px;
	}
	section #payment .selectedPayment {
		margin-top:16px;
		/* padding-bottom:13px; */
	}
	section #payment .selectedPayment div {
		display:inline-block;
	}
	section #payment .selectedPayment div:nth-child(2) {
		vertical-align:bottom;
		padding-bottom:9px;
	}
	section #payment .selectedPayment img {
		width:110px;
		vertical-align:middle;
	}
	section #payment .selectedPayment .pay-title {
		font-size:13px;
		font-weight:bold;
	}
	section #payment .selectedPayment .pay-con {
		font-size:16px;
	}
	section .order {
		margin-bottom:20px;
	}
	section .order .menu-list {
		padding:0px;
		/* border:1px solid green; */
	}
	section .order .menu-list .items {
		list-style:none;
		padding:7px 18px;
		margin:4px 8px;
		height:60px;
		background:#f6f5ef;
	}
	section .order .menu-list .items div {
		display:inline-block;
	}
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
	section #receipts .receiptType {
		margin:18px 30px;
	}
	section #receipts .receiptType #receiptNumber {
		margin-left:8px;
	}
	section #costfield .finalCost {
		margin-bottom:12px;
	}
	section #costfield .finalCost hr {
		width:360px;
		margin:16px 53px;
	}
	section #costfield .finalCost dl {
		margin:10px auto;
		width:300px;
	}
	section #costfield .finalCost dl dt {
		display:inline-block;
		width:114px;
		text-align:left;
	}
	section #costfield .finalCost dl dd {
		display:inline-block;
		width:154px;
		margin:0px;
		text-align:right;
	}
	section #payBtn {
		margin:0px auto 40px auto;
		text-align:center;
	}
	section #payBtn input[type='button'] {
		width:300px;
		border-radius:10px;
		border:0px;
		background:#f4f4f1;
		color:#222;
		font-size:16px;
		margin-top:15px;
		padding:15px 0 18px 0;
		vertical-align:center;
	}
	section #payBtn input[type='submit'] {
		width:300px;
		border-radius:10px;
		border:0px;
		background:#006633;
		color:white;
		font-size:16px;
		margin-top:15px;
		padding:15px 0 18px 0;
		vertical-align:center;
	}
	section #payBtn input[type='submit']:hover {
		text-decoration:underline;
	}
</style>

<script>
	function paymentType(val) {
		document.getElementById('starbucksCard').style.display = "none";
		document.getElementById('creditCard').style.display = "none";
		document.getElementById('ssgPay').style.display = "none";
		document.getElementById(val).style.display = "block";
		
		document.getElementsByClassName('starbucksCard')[0].style.display = "none";
		document.getElementsByClassName('creditCard')[0].style.display = "none";
		document.getElementsByClassName('ssgPay')[0].style.display = "none";
		document.getElementsByClassName(val)[0].style.display = "block";
		
		if(val == 'creditCard') {
			document.form.receiptNumber.value = "";
			document.form.receipt[0].checked = true;
			document.form.receipt[1].disabled = true;
			document.form.receipt[2].disabled = true;
			receiptChange("신청안함");
		} else {
			document.form.receiptNumber.value = "";
			document.form.receipt[0].checked = true;
			document.form.receipt[1].disabled = false;
			document.form.receipt[2].disabled = false;
			receiptChange("신청안함");
		}
	}
	function rechargePopup() {
		var position = "left=200,top=80,width=570,height=630";
		var popup = window.open("popup_recharge","starbucks card recharge",position);
	}
	function receiptChange(myValue) {
		//console.log(n);
		const receiptType = document.querySelector('.receiptType');
		//let receiptName = myValue;
		
		if(myValue != "신청안함") {
			receiptType.style.display = "block";
			receiptType.querySelector('label').innerText = myValue;
			receiptType.querySelector('input').value = "";
		} else {
			receiptType.style.display = "none";
			receiptType.querySelector('input').value = "";
		}
	}
</script>

</head>
<body>
	
	<!-- 
		1. 결제 수단
		2. 쿠폰/할인 => 추후 추가사항
		3. 현금영수증
		4. 주문내역  => 상품이미지+상품명+타입+사이즈  (수량정보 없이 1개씩 노출)
		5. 주문금액 / 할인금액 / 최종 결제 금액
	 -->

<section>
	<h2>결제하기</h2>

	<form name="form" method="post" action="cart_order_ok">
		<input type="hidden" name="store_id" value="${store_id}" />

		<!-- 결제수단 선택 -->
		<div id="payment" class="section">
			<h4>결제 수단</h4>
			<div>
				<select id="paymentList" name="paymentList" onchange="paymentType(this.value)">
					<option value="starbucksCard">스타벅스 카드</option>
					<option value="creditCard">신용카드</option>
					<option value="ssgPay">SSGPAY</option>
				</select>
			</div>
			<div id="starbucksCard" class="selectedPayment">
				<div><img src="${pageContext.request.contextPath}/resources/images/e_gold_card.png"></div>
				<div>
					<span class="pay-title">스타벅스 카드</span><br>
					<div>
						<span class="pay-con">
							잔액&nbsp;
							<fmt:formatNumber type="number" maxFractionDigits="3" pattern="###,###원" value="${member.sbcard}" />
						</span>
						<span class="pay-con">
							
						</span>
						<input type="button" onclick="rechargePopup()" value="충전하기" />
					</div>
					
				</div>
			</div>
			<div id="creditCard" class="selectedPayment" style="display:none">
				<div><img src="${pageContext.request.contextPath}/resources/images/credit01.png"></div>
				<div>
					<span class="pay-title">신용카드</span><br>
					<span class="pay-con">1234-1234-1234-1234</span>
				</div>
			</div>
			<div id="ssgPay" class="selectedPayment" style="display:none">
				<div><img src="${pageContext.request.contextPath}/resources/images/ssgpay.png"></div>
				<div class="pay-title">SSGPAY</div>
			</div>
		</div>
		
		<!-- 할인수단 선택 -->
		<div id="discount" class="section" style="display:none;">
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
			<div id="eGift" style="display:none;">
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
		<div id="receipts" class="section">
			<h4>현금영수증</h4>
			<input type="radio" name="receipt" 
				id="신청안함" 
				value="신청안함"
				onchange="receiptChange(this.value)" 
				checked><label for="신청안함">신청안함</label>
			<input type="radio" name="receipt" 
				id="personnelReceipt"
				value="개인소득공제"
				onchange="receiptChange(this.value)"><label for="personnelReceipt">개인소득공제</label>
			<input type="radio" name="receipt" 
				id="corporateReceipt" 
				value="사업자증빙용"
				onchange="receiptChange(this.value)"><label for="corporateReceipt">사업자증빙용</label>
			<div class="receiptType" style="display:none;">
				<label for="receiptNumber"></label><input type="phone" name="receiptNumber" id="receiptNumber" />
			</div>
		</div>
		<p>
		
		<!-- 주문내역 -->
		<div class="order">
			<h4>주문내역</h4>
			<ul class="menu-list">
				<c:set var="totalUnit" value="" />
				<c:forEach items="${cart}" var="cart">
					<li class="items">
						<input type="hidden" name="cartid" value="${cart.id}" />
						<input type="hidden" name="prod_code" value="${cart.code}" />
						<input type="hidden" name="prod_unit" value="${cart.unit}" />
						<c:set var="totalUnit" value="${totalUnit = totalUnit + cart.unit}" />
						<div>
							<img 
								src="${pageContext.request.contextPath}/resources/menuimg/${cart.name}.jpg" 
								alt="상품이미지"
								height="60" />
						</div>
						<dl>
							<dt>${cart.name}</dt>
							<dd>
								<c:if test="${cart.type == 1}"><span style="color:red;">Hot</span></c:if>
								<c:if test="${cart.type == 2}"><span style="color:blue;">Ice</span></c:if>
							</dd>
							<dd>|</dd>
							<dd>
								<c:if test="${cart.size == 1}">Short</c:if>
								<c:if test="${cart.size == 2}">Tall</c:if>
								<c:if test="${cart.size == 3}">Grande</c:if>
								<c:if test="${cart.size == 4}">Venti</c:if>
							</dd>
							<dd>|</dd>
							<dd>${cart.prod_cost}</dd>
						</dl>
					</li>
				</c:forEach>
				<input type="hidden" name="total_unit" value="${totalUnit}" />
			</ul>
		</div>
		
		<!-- 결제금액 정보 -->
		<div id="costfield">
		
			<fieldset class="finalCost">
				<!-- <legend><b>총 결제 내용</b></legend> -->
				<dl>
					<dt>주문 금액</dt>
					<dd><fmt:formatNumber pattern="###,###" value="${param.cost}"/>원</dd>
				</dl>
				<dl>
					<dt>할인 금액</dt>
					<dd><fmt:formatNumber pattern="###,###" value=""/>원</dd>
				</dl>
				<hr>
				<dl>
					<dt>최종 결제 금액</dt>
					<dd><fmt:formatNumber pattern="###,###" value="${param.cost}"/>원</dd>
				</dl>
			</fieldset>
		</div>
		
		<div id="payBtn">
			<div class="starbucksCard">
				<c:if test="${member.sbcard >= param.cost}">
					<input type="hidden" name="payWithSbcard" value="${param.cost}" />
					<input type="submit" value="스타벅스 카드로 결제하기" />
				</c:if>
				<c:if test="${member.sbcard < param.cost}">
					<input type="button" value="금액이 부족합니다." />
				</c:if>
			</div>
			<div class="creditCard" style="display:none;">
				<input type="submit" value="신용카드로 결제하기" />
			</div>
			<div class="ssgPay" style="display:none;">
				<input type="submit" value="페이로 결제하기" />
			</div>
		</div>
	</form>

</section>
	
</body>
</html>