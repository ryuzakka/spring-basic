<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#store {
		/* position:absolute;
		top:220px;
		left:450px; */
		width:550px;
		height:550px;
		margin:auto;
		/* border:0px;
		border-radius:4px; */
		font-size:13px;
		/* background:pink; */
	}
	#store h2 {
		margin:20px auto;
		text-align:center;
	}
	#store #searchArea {
		width:500px;
		/* margin:60px auto; */
		margin:8px auto;
		/* padding-left:133px; */
	}
	#store #searchArea fieldset {
		border:none;
		background:#f6f5ef;
		padding:14px 18px;
	}
	#store #searchArea input[type='search'] {
		padding:12px 0;
		border:none;
		border-bottom:1px solid #DDD;
		border-radius:3px;
		width:70%;
		text-align:center;
		margin-right:26px;
	}
	#store #searchArea input[type='submit'] {
		width:20%;
		border-radius:10px;
		border:0px;
		background:#006633;
		color:white;
		padding:13px 0 13px 0;
		vertical-align:center;
	}
	#store .list {
		width:90%;
		height:380px;
		overflow-y:auto;
		list-style:none;
		padding:10px 0px;
		/* text-align:right; */
		margin:0px 0px 0px 28px;
	}
	#store .list .list-item {
		display:block;
		height:90px;
		text-align:left;
		/* margin:8px 0px; */
		margin-bottom:10px;
	}
	#store .list .list-item:hover {
		border:1px solid #006633;
		cursor:pointer;
	}
	.on {
		border:1px solid #006633;
	}
	#store .list .list-item .imgContainer {
		width:120px;
		height:90px;
		overflow:hidden;
	}
	#store .list div {
		display:inline-block;
	}
	#store .list dl {
		display:inline-block;
		text-align:left;
		vertical-align:top;
		margin-top:24px;
	}
	#store .list dl > dt, dd {
		text-align:left;
		margin:0px;
	}
</style>
</head>
<body>

	<div id="store">
		<h2>매장 선택</h2>
		<div id="searchArea">
			<form name="search" method="get" action="popup_store" onsubmit="return check(this)">
				<fieldset>
					<!-- <legend> 키워드 검색 </legend> -->
					<input type="search" name="keyword" id="keyword" list="rec" value="${keyword}" placeholder="키워드 검색 (매장명 또는 지역명)" size="30">
					<datalist id="rec">
						<option value="대화동">대화동</option>
						<option value="주엽동">주엽동</option>
						<option value="일산동">일산동</option>
						<option value="덕이동">덕이동</option>
						<option value="탄현동">탄현동</option>
					</datalist>
					<input type="submit" value="검색">
				</fieldset>
			</form>
		</div>
		
		<ul class="list">
			<c:forEach items="${store}" var="store">
				<li class="list-item" onclick="selectStore(this,${store.id})">
					<div class="imgContainer">
						<c:if test="${store.storeimg != null}">
							<img src="${pageContext.request.contextPath}/resources/storeimg/${store.storeimg}" height="90">
						</c:if>
					</div>
					<dl>
						<dt>${store.storename} (${store.addr2})</dt>
						<dd>${store.addr1}</dd>
					</dl>
				</li>
			</c:forEach>
		</ul>
		
		<!-- <input type="button" onclick="choiceComplete()" value="선택완료" /> -->
	</div>
	
<script>
	function check(my) {
		var len = my.keyword.value.trim().length;
		//console.log(len);
		len != 0 ? true : false;
	}
	function selectStore(my,id) {
		/* let stores = document.querySelectorAll('.list-item');
		for(var i=0; i<stores.length; i++) {
			if(stores[i].classList.contains("on"))
				stores[i].classList.remove("on");
		}
		my.classList.add("on"); */
		opener.document.getElementById('storeid').value = id;
		opener.document.querySelector('#pay').type = "submit";
		opener.document.querySelector('#pay').value = "결제하기";
		opener.document.querySelector('#pay').onclick = "";
		self.close();
	}
</script>

</body>
</html>