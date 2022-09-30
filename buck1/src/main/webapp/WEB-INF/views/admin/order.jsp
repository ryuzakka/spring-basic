<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${userid != 'admin'}">
	<c:redirect url="../error/error404" />
</c:if>

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
		/* font-size:2em; */
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
	section #container ol .order-list .state-progress {
		display:none;
		margin:8px 260px 8px 15px;
		padding:10px 0px 10px 33px;
		border:0px solid #006633;
	}
	section #container ol .order-list .state-progress button {
		display:inline-block;
		width:60px;
		height:60px;
		border:none;
		border-radius:50%;
		font-size:17px;
		margin-left:43px;
		margin-right:25px;
	}
	section #container ol .order-list .state-progress button:hover {
		background:#006633;
		color:white;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(function(){
		
		// 주문목록 hover 효과
		$(".order-list").mouseenter(function(){
			$(this).css("background","#dddddd");
		});
		$(".order-list").mouseleave(function(){
			$(this).css("background","white");
		});
		
		// 주문목록 click 이벤트
		$(".order-list").click(function(){
			$(this).find(".product").stop().slideToggle();
			$(this).find(".state-progress").stop().slideToggle();
		});
		
		// 상태변경 AJAX 처리
		$(".o-state").click(function(){
			let code = $(this).parent().find(".o-code").val();
			let state = $(this).val();
			
			$.ajax({
				url: 'orderProgress',
				type: 'post',
				async: true,
				data: {
					'orderCode': code,
					'state': state
				},
				dataType: 'text',
				complete: function(response) {
					console.log(response);
					//alert(code + "," + state);
					location.reload();
				}
			});
		});
		
	});
</script>
</head>

<body>
<section>
	<h2>주문 관리</h2>
	
	<div id="container">
		
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
											<%-- <input type="hidden" name="oCode" class="oCode" value="${item.order_code}" />
											<select name="orderState" class="orderState">
												<option value="1">주문상태 변경</option>
												<option value="2">주문확인</option>
												<option value="3">제조완료</option>
												<option value="4">수령완료</option>
											</select> --%>
										</dd>
									</div>
									<div style="width:80px;">
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
					
					<!-- 주문 상태 변경 -->
					<fieldset class="state-progress">
						<input type="hidden" name="o-code" class="o-code" value="${order.order_code}" />
						<button type="button" class="o-state" value="2">주문확인</button>
						<button type="button" class="o-state" value="3">제조완료</button>
						<button type="button" class="o-state" value="4">수령완료</button>
					</fieldset>
				</li>
			</c:forEach>
		</ol>
		
	</div>
</section>

</body>
</html>