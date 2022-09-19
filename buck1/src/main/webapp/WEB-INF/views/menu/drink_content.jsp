<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<style>
	#section {
		width:auto;
		height:auto;
		margin:30px auto 80px auto;
		text-align:center;
	}
	#section h2 {
		display:inline-block;
		width:1000px;
		text-align:left;
		/* margin-left:80px; */
		font-size:30px;
	}
	#section .container {
		width:1000px;
		margin:0 auto;
		padding:35px 0 45px 0;
		border:1px solid darkgreen;
		display:flex;
		flex-flow:row wrap;
		justify-content:space-evenly;
	}
	#section .container .img {
		width:450px;
		height:100%;
	}
	#section .container .desc {
		width:450px;
	}
	#section .container .desc .menuName {
		text-align:left;
		font-size:18px;
		font-weight:bolder;
		margin-bottom:22px;
	}
	#section .container .desc table {
		width:450px;
		border-spacing:0px;
	}
	#section .container .desc table tr:first-child td {
		padding:5px 0;
	}
	#section .container .desc table tr td {
		padding:20px 0 20px 0;
	}
	
	#section .container .desc input[type='button'] {
		margin:43px 0 0 0;
		padding:12px 0;
		width:450px;
		border-radius:10px;
		background:#006633;
		color:white;
	}
</style>
<script>
	
	function userCheck(user,menu) {
		if(user == "") {
			//confirm('login gogo');
			var position = "left=200,top=80,width=500,height=580";
			var loginSon = window.open("popup_login?menu="+menu,"login",position);
			//console.log(menu);
		} else {
			location = 'drink_order?name=' + menu;
		}
	}
</script>

<div id="section">
	
	<h2>${category}</h2>
	<div class="container">
		<div class="img">
			<img src="${pageContext.request.contextPath}/resources/images/${param.name}.jpg" alt="">
		</div>
		<div class="desc">
			<div class="menuName">${param.name}</div>
			<table border="1">
				<tr>
					<td><strong>Type</strong></td>
					<td><strong>Size</strong></td>
					<td><strong>Price</strong></td>
				</tr>
				<c:forEach items="${info}" var="drink">
					<tr>
						<td>
							<c:if test="${drink.type == 1}">
								<span style="color:red;">Hot</span>
							</c:if>
							<c:if test="${drink.type == 2}">
								<span style="color:blue;">Ice</span>
							</c:if>
						</td>
						<td>
							<c:choose>
								<c:when test="${drink.size == 1}">Short</c:when>
								<c:when test="${drink.size == 2}">Tall</c:when>
								<c:when test="${drink.size == 3}">Grande</c:when>
								<c:when test="${drink.size == 4}">Venti</c:when>
							</c:choose>
						</td>
						<td><fmt:formatNumber value="${drink.price}" type="number" /></td>
					</tr>
				</c:forEach>
			</table>
			<p><input type="button" onclick="userCheck('${userid}','${param.name}')" value="주문하기"></p>
		</div>
	</div>
	
</div>

