<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${userid == null}">
	<c:redirect url="../member/signin?err=3" />
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
			<h3>${userid}?????? ????????????</h3>
			<span>?????????????????? ????????? ??????????????????.</span>
		</div>
	</div>
	
	<form method="post" action="cart_order">
		<div id="container">
			<table width="1000" align="center" border="1">
				<tr>
					<td>?????????</td>
					<!-- <td>????????????</td> -->
					<td>?????????</td>
					<td>????????????</td>
					<td>???????????????</td>
					<td>????????????</td>
					<td>????????????</td>
					<td>????????????</td>
					<!-- <td>????????????</td> -->
					<td>????????????</td>
					<td></td>
				</tr>
				<c:set var="unit" value="0" />
				<c:set var="cost" value="0" />
				<c:forEach items="${list}" var="cart">
					<tr>
						<input type="hidden" name="cartid" value="${cart.id}">
						<input type="hidden" name="prod_code" value="${cart.code}">
						<input type="hidden" name="prod_unit" value="${cart.unit}">
						<td><img width="100" src="${pageContext.request.contextPath}/resources/menuimg/${cart.name}.jpg"></td>
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
						<td><fmt:formatNumber value="${cart.prod_cost}"/>???</td>
						<td><fmt:formatNumber value="${cart.total_cost}"/>???</td>
						<%-- <td>${cart.store_id }</td> --%>
						<td>${cart.writeday }</td>
						<td><input type="button" onclick="delrow(${cart.id})" value="??????"></td>
					</tr>
					<c:set var="unit" value="${unit + cart.unit}" />
					<c:set var="cost" value="${cost + cart.total_cost}" />
				</c:forEach>
			</table>
		</div>
		
		<!-- ?????? ?????? -->
		<div id="store" style="display:none;border:none;margin-top:35px;padding:0px;">
			<input type="hidden" name="store_id" id="storeid" value="" />
			<fieldset style="display:inline-block;border:1px solid #f6f5ef;">
				<legend style="width:50%;height:30px;padding-top:7px;background:#f6f5ef;">?????? ??????</legend>
				<div style="display:block;width:200px;margin:auto"><img src="" width="200px"/></div>
				<dl style="display:inline-block;text-align:center;vertical-align:top;margin-top:14px;">
					<dt style="font-weight:bold;"></dt>
					<dd style="margin:0px;padding:0px;"></dd>
				</dl><br>
				<input type="button" onclick="storeOpen()" value="??????????????????" />
			</fieldset>
		</div>
	
		<div id="bill">
			<%-- <div>
				<div>??? ???????????? : <fmt:formatNumber value="${unit}"/></div>
				<div>??? ???????????? : <fmt:formatNumber value="${cost}"/>???</div>
				
			</div> --%>
			
			<fieldset style="display:inline-block;width:300px;border:1px solid #f6f5ef;">
				<legend style="width:50%;height:30px;padding-top:7px;background:#f6f5ef;">????????? ??????</legend>
				<dl style="display:inline-block;text-align:center;vertical-align:top;margin-top:14px;">
					<dt style="font-weight:bold;">??? ????????????</dt>
					<dd style="margin:0px;padding:0px;"><fmt:formatNumber value="${unit}"/></dd>
					<dt style="font-weight:bold;margin-top:10px;">??? ????????????</dt>
					<dd style="margin:0px;padding:0px;"><fmt:formatNumber value="${cost}"/>???</dd>
				</dl>
			</fieldset>
			<input type="hidden" name="cost" value="${cost}">
			<p><input type="button" id="pay" onclick="storeOpen()" value="????????? ?????? ????????????"></p>
		</div>
		
	</form>
</div>

<script>
</script>