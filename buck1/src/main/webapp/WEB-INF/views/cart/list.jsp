<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:if test="${userid == null}">
	<%-- <c:redirect url="../common/warning/member_only.jsp" /> --%>
</c:if>
<c:import url="/common/top" />

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
</style>
<script>
	function delrow(cartid) {
		
		var xhr = new XMLHttpRequest();
		xhr.open("get", "cart_delete?id="+cartid);
		xhr.send();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4) {
				window.location.reload();
			}
		}
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
	
	<form method="get" action="">
		<div id="container">
			<table width="1000" align="center" border="1">
				<tr>
					<td>이미지</td>
					<td>상품코드</td>
					<td>상품명</td>
					<td>상품타입</td>
					<td>상품사이즈</td>
					<td>주문수량</td>
					<td>단품금액</td>
					<td>총 금액</td>
					<td>매장번호</td>
					<td>담은날짜</td>
					<td></td>
				</tr>
				<c:forEach items="${list}" var="cart">
					<tr>
						<input type="hidden" name="cartid" value="${cart.id}">
						<input type="hidden" name="prod_code" value="${cart.code}">
						<input type="hidden" name="prod_unit" value="${cart.unit}">
						<td><img width="100" src="${pageContext.request.contextPath}/resources/images/${cart.name}.jpg"></td>
						<td>${cart.code }</td>
						<td>${cart.name }</td>
						<td>${cart.type }</td>
						<td>${cart.size }</td>
						<td>${cart.unit }</td>
						<td>${cart.prod_cost }</td>
						<td>${cart.total_cost }</td>
						<td>${cart.store_id }</td>
						<td>${cart.writeday }</td>
						<td><input type="button" onclick="delrow(${cart.id})" value="삭제"></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		
	
		<div>
			<div>
				<div></div>
				<div></div>
			</div>
			<input type="submit" value="결제하기">
		</div>
	</form>
	
</div>
<c:import url="/common/bottom" />