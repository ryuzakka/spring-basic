<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${userid == null}">
	<%-- <c:redirect url="../common/warning/member_only.jsp" /> --%>
</c:if>


<style>
	#section {
		width:auto;
		height:auto;
		margin:30px auto 80px auto;
		text-align:center;
	}
	#section h2 {
		margin:60px 0px 71px 0px;
	}
	#section #intro {
		margin:0 0 70px 0;
	}
	#section #intro #logo {
		margin-bottom:17px;
	}
	#section #intro #welcome h3 {
		margin:12px 0 6px 0;
	}
	#section #container table {
		border-spacing:0px;
		border:1px solid lightgreen;
	}
	#section #container table .arrowBtn {
		display:inline-block;
		width:20px;
		height:30px;
	}
	#section #container table .arrowBtn img {
		width:40%;
		height:48%;
	}
	#section #bill {
		margin:40px auto 20px auto;
	}
	#section #bill #pay {
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
	#section #bill #pay:hover {
		background:#006633;
		color:white;
		text-decoration:underline;
	}
	
</style>
<script>
	function delrow(cartid) {
		var xhr = new XMLHttpRequest();
		xhr.open("get", "delete?id="+cartid);
		xhr.send();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4) {
				window.location.reload();
			}
		}
	}
	function unitMinus(cartId,cartUnit) {
		if(cartUnit > 1) {
			var xhr = new XMLHttpRequest();
			xhr.open("get", "unit_minus?id="+cartId);
			xhr.send();
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4) {
					console.log("unit_minus ok");
					window.location.reload();
				}
			}
		}
	}
	function unitPlus(cartId,cartUnit) {
		if(cartUnit < 20) {
			var xhr = new XMLHttpRequest();
			xhr.open("get", "unit_plus?id="+cartId);
			xhr.send();
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4) {
					console.log("unit_minus ok");
					window.location.reload();
				}
			}
		}
	}
	function storeOpen() {
		var position = "left=200,top=80,width=570,height=580";
		var popup = window.open("popup_store","select store",position);
	}
	
</script>
<div id="section">
	
	<!-- <h2>STARBUCKS</h2> -->
	
	<div id="intro">
		<div id="logo"><img src="${pageContext.request.contextPath}/resources/images/logo.jpg" alt="starbucks"></div>
		<div id="welcome">
			<h3>${userid}님의 장바구니</h3>
			<span>구매하시려면 결제를 진행해주세요.</span>
		</div>
	</div>
	
	<form method="post" action="cart_order">
		<div id="container">
			<table width="1000" align="center" border="1">
				<tr>
					<td>이미지</td>
					<!-- <td>상품코드</td> -->
					<td>상품명</td>
					<td>상품타입</td>
					<td>상품사이즈</td>
					<td>주문수량</td>
					<td>단품금액</td>
					<td>합계금액</td>
					<!-- <td>매장번호</td> -->
					<td>담은날짜</td>
					<td></td>
				</tr>
				<c:set var="unit" value="0" />
				<c:set var="cost" value="0" />
				<c:forEach items="${list}" var="cart">
					<tr>
						<input type="hidden" name="cartid" value="${cart.id}">
						<input type="hidden" name="prod_code" value="${cart.code}">
						<input type="hidden" name="prod_unit" value="${cart.unit}">
						<td><img width="100" src="${pageContext.request.contextPath}/resources/images/${cart.name}.jpg"></td>
						<%-- <td>${cart.code }</td> --%>
						<td>${cart.name }</td>
						<td>
							<c:if test="${cart.type == 1}"><span style="color:red;">Hot</span></c:if>
							<c:if test="${cart.type == 2}"><span style="color:blue;">Ice</span></c:if>
						</td>
						<td><c:choose>
							<c:when test="${cart.size == 1}">Short</c:when>
							<c:when test="${cart.size == 2}">Tall</c:when>
							<c:when test="${cart.size == 3}">Grande</c:when>
							<c:when test="${cart.size == 4}">Venti</c:when>
						</c:choose></td>
						<td>
							<div class="arrowBtn" onclick="unitMinus(${cart.id},${cart.unit})">
								<img src="${pageContext.request.contextPath}/resources/images/arrow_l.png">
							</div>
							<span id="productUnit">${cart.unit}</span>
							<div class="arrowBtn" onclick="unitPlus(${cart.id},${cart.unit})">
								<img src="${pageContext.request.contextPath}/resources/images/arrow_r.png">
							</div>
						</td>
						<td><fmt:formatNumber value="${cart.prod_cost}"/>원</td>
						<td><fmt:formatNumber value="${cart.total_cost}"/>원</td>
						<%-- <td>${cart.store_id }</td> --%>
						<td>${cart.writeday }</td>
						<td><input type="button" onclick="delrow(${cart.id})" value="삭제"></td>
					</tr>
					<c:set var="unit" value="${unit + cart.unit}" />
					<c:set var="cost" value="${cost + cart.total_cost}" />
				</c:forEach>
			</table>
		</div>
		
		<div id="store" style="display:none;border:none;margin-top:35px;padding:0px;">
			<input type="hidden" name="storeid" id="storeid" value="" />
			<fieldset style="display:inline-block;border:1px solid #f6f5ef;">
				<legend style="width:50%;height:30px;padding-top:7px;background:#f6f5ef;">선택 매장</legend>
				<div style="display:block;width:200px;margin:auto"><img src="" width="200px"/></div>
				<dl style="display:inline-block;text-align:center;vertical-align:top;margin-top:14px;">
					<dt style="font-weight:bold;"></dt>
					<dd style="margin:0px;padding:0px;"></dd>
				</dl><br>
				<input type="button" onclick="storeOpen()" value="다시선택하기" />
			</fieldset>
		</div>
	
		<div id="bill">
			<%-- <div>
				<div>총 상품수량 : <fmt:formatNumber value="${unit}"/></div>
				<div>총 결제금액 : <fmt:formatNumber value="${cost}"/>원</div>
				
			</div> --%>
			
			<fieldset style="display:inline-block;width:300px;border:1px solid #f6f5ef;">
				<legend style="width:50%;height:30px;padding-top:7px;background:#f6f5ef;">결제할 내역</legend>
				<dl style="display:inline-block;text-align:center;vertical-align:top;margin-top:14px;">
					<dt style="font-weight:bold;">총 상품수량</dt>
					<dd style="margin:0px;padding:0px;"><fmt:formatNumber value="${unit}"/></dd>
					<dt style="font-weight:bold;margin-top:10px;">총 결제금액</dt>
					<dd style="margin:0px;padding:0px;"><fmt:formatNumber value="${cost}"/>원</dd>
				</dl>
			</fieldset>
			<input type="hidden" name="cost" value="${cost}">
			<p><input type="button" id="pay" onclick="storeOpen()" value="주문할 매장 선택하기"></p>
		</div>
		
	</form>
</div>

<script>
</script>