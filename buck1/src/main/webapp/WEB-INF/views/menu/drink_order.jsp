<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="/common/top" />

<style>
	#section {
		width:800px;
		height:auto;
		margin-top:85px;
		margin:auto;
		padding-bottom:85px;
		text-align:left;
	}
	#section h2 {
		margin:102px 0px 71px 0px;
	}
	#section #intro {
		margin:0 0 70px 0;
	}
	#section #intro #menuImg {
		margin-bottom:17px;
	}
	#section #intro #menuName h3 {
		margin:12px 0 6px 0;
	}
	#section #container {
		
	}
	#section #container input {
		padding:8px 0;
	}
	#section #container input[type="text"] {
		border:none;
		border-bottom:1px solid #DDD;
		width:300px;
	}
	#section #container input[type="password"] {
		border:none;
		border-bottom:1px solid #DDD;
		width:300px;
	}
	#section #container input[type='submit'] {
		width:300px;
		border-radius:10px;
		background:#006633;
		color:white;
	}
	#section #cost {
		font-size:20px;
	}
</style>
<script>
	var cnt = 1;
	var costPerUnit;
	function sizeChanged(prodname, size) {
		document.getElementById('unit').innerText = 1;
		document.orderSheet.unit.value = 1;
		var xhr = new XMLHttpRequest();
		xhr.open("get", "get_price?name="+prodname+"&size="+size);
		xhr.send();
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4) {
				var price = xhr.responseText.trim();
				document.getElementById('price').innerText = price;
				document.orderSheet.cost.value = price;
				document.orderSheet.pricePerUnit.value = price;
				costPerUnit = price;
				
			}
		}
	}
	function minus() {
		var unit = document.getElementById('unit');
		var price = document.orderSheet.cost;
		
		if(cnt > 1) {
			cnt -= 1;
		}
		unit.innerText = cnt;
		document.orderSheet.unit.value = cnt;
		
		price.value = costPerUnit*cnt;
		document.getElementById('price').innerText = costPerUnit*cnt;
	}
	function plus() {
		var unit = document.getElementById('unit');
		var price = document.orderSheet.cost;
		cnt += 1;
		unit.innerText = cnt;
		document.orderSheet.unit.value = cnt;
		
		price.value = costPerUnit*cnt;
		document.getElementById('price').innerText = costPerUnit*cnt;
	}
</script>
<div id="section">
	
	<h2>주문서 작성</h2>
	
	<div id="intro">
		<div id="menuImg"><img src="${pageContext.request.contextPath}/resources/images/${param.name}.jpg"></div>
		<div id="menuName">
			<h3>${param.name}</h3>
		</div>
	</div>
	
	<div id="container">
		<form name="orderSheet" method="post" action="drink_order_ok">
			<input type="hidden" name="name" value="${param.name}">
			<div id="sizeBtn">
				<span>사이즈 선택</span>
				<c:forEach items="${info}" var="drink">
					<input type="radio" name="size" onchange="sizeChanged('${drink.name}',${drink.size})" value="${drink.size}">
					<c:choose>
						<c:when test="${drink.size == 1}">Short</c:when>
						<c:when test="${drink.size == 2}">Tall</c:when>
						<c:when test="${drink.size == 3}">Grande</c:when>
						<c:when test="${drink.size == 4}">Venti</c:when>
					</c:choose>
				</c:forEach>
				<input type="hidden" name="pricePerUnit">
			</div>
			<div id="unitBtn">
				<span>수량 선택</span>
				<input type="hidden" name="unit" value="1">
				<input type="button" onclick="minus()" value=" - ">
				<span id="unit">1</span>
				<input type="button" onclick="plus()" value=" + ">
			</div>
			<div id="cost">
				<input type="hidden" name="cost" >
				<span id="price"></span> 원
			</div>
			<p><input type="submit" value="담 기"></p>
		</form>
	</div>
	
</div>

<c:import url="/common/bottom" />