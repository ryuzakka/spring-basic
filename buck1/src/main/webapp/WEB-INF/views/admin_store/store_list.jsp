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
<title>store list</title>
<style>
	section {
		width:1200px;
		margin:70px auto;
		text-align:center;
	}
	section h2 {
		text-align:center;
	}
	section #searchArea {
		width:600px;
		/* margin:60px auto; */
		margin:40px auto;
		/* padding-left:133px; */
	}
	section #searchArea fieldset {
		border:none;
		background:#f6f5ef;
		padding:24px 0;
	}
	section #searchArea input[type='search'] {
		padding:12px 0;
		border:none;
		border-bottom:1px solid #DDD;
		border-radius:3px;
		width:70%;
		text-align:center;
	}
	section #searchArea input[type='submit'] {
		width:20%;
		border-radius:10px;
		border:0px;
		background:#006633;
		color:white;
		padding:13px 0 13px 0;
		vertical-align:center;
	}
	section button {
		padding:12px 0;
		border:none;
		border-bottom:1px solid #DDD;
		border-radius:3px;
		width:70px;
		text-align:center;
	}
	section button:hover {
		color:white;
		background:#006633;
		text-decoration:underline;
	}
	section table {
		width:90%;
		border-spacing:0px;
		font-size:14px;
	}
	/* section table caption {
		text-align:right;
		padding: 8px 10px;
	}
	section table caption a {
		text-decoration:none;
		color:#006633;
		font-size:14px;
		font-weight:600;
	} */
	section table thead tr th {
		/* font-size:14px; */
		border-top:1px solid black;
		border-bottom:1px solid black;
		padding-top:17px;
		padding-bottom:17px;
	}
	section table tbody tr td:nth-child(2) {
		text-align:left;
		padding-left:10px;
	}
	section table tbody tr td {
		text-align:center;
		/* padding:8px 0px; */
		padding-top:5px;
		padding-bottom:5px;
		border-bottom:1px solid #dddddd;
	}
	section table tr td img {
		display:block;
		width:120px;
		margin:auto;
	}
	
	section #pager {
		margin-top:35px;
	}
	section #pager a {
		text-decoration:none;
		color:black;
	}
	section #pager a:hover {
		text-decoration:underline;
		color:#036;
		cursor:pointer;
	}
	section #pager input {
		border:none;
		padding:8px;
	}
	section #pager input:hover {
		text-decoration:underline;
	}
</style>
<script>
	function stateChange(n, id) {
		var xhr = new XMLHttpRequest();
		xhr.open("get", "store_state?state="+n+"&id="+id);
		xhr.send();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4) {
				console.log("state change success");
				window.location.reload();
			}
		}
	}
</script>
</head>
<body>
	
<section>
	<h2>?????? ??????</h2>
	
	<div id="searchArea">
		<form name="search" method="get" action="store_info" onsubmit="return check(this)">
			<fieldset>
				<!-- <legend> ????????? ?????? </legend> -->
				<input type="hidden" name="page" value="1">
				<input type="search" name="keyword" list="rec" value="${keyword}" placeholder="????????? ?????? (????????? ?????? ?????????)" size="30">
				<datalist id="rec">
					<option value="?????????">?????????</option>
					<option value="?????????">?????????</option>
					<option value="?????????">?????????</option>
					<option value="?????????">?????????</option>
					<option value="?????????">?????????</option>
				</datalist>
				<input type="submit" value="??????">
			</fieldset>
		</form>
	</div>
	
	<div style="display:inline-block;float:right;padding:0px 80px 20px 80px;">
		<button onclick="javascript:location='store_write'">????????????</button>
	</div>
	
	<table align="center" border="0">
		<%-- <caption><a href="store_write">????????????</a></caption> --%>
		<thead>
			<tr>
				<th> No. </th>
				<th style="text-align:left;padding-left:10px;"> ???????????? </th>
				<th style="text-align:left;padding-left:10px;"> ???????????? </th>
				<th> ???????????? </th>
				<th> ???????????? </th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="store">
				<tr>
					<td> ${store.rnum} </td>
					<td onclick="javascript:location='store_update?id=${store.id}'" style="cursor: pointer;"> ${store.storename} </td>
					<td onclick="javascript:location='store_update?id=${store.id}'" style="cursor: pointer;text-align:left;padding-left:10px;"> ${store.addr1} (${store.addr2}) </td>
					<td>
						<c:if test="${store.state == 0}">?????????</c:if>
						<c:if test="${store.state == 1}">???????????????</c:if>
						<c:if test="${store.state == 2}">?????????</c:if>
						<c:if test="${store.state == 4}">?????? ??????</c:if>
						<c:if test="${store.state == 7}">????????? ?????????</c:if>
						<c:if test="${store.state == 8}">???????????????</c:if>
						<c:if test="${store.state == 9}">??????</c:if>
						<br>
						<select id="state" name="state" onchange="stateChange(this.value, ${store.id})">
							<option>- ???????????? -</option>
							<option value="0">?????????</option>
							<option value="1">???????????????</option>
							<option value="2">?????????</option>
							<option value="4">?????? ??????</option>
							<option value="7">????????? ?????????</option>
							<option value="8">???????????????</option>
							<option value="9">??????</option>
							<option value="-1" style="color:salmon;">???????????? ??????</option>
						</select>
					</td>
					<td onclick="javascript:location='store_update?id=${store.id}'" style="cursor: pointer;">
						<c:if test="${store.storeimg != null}">
							<img src="${pageContext.request.contextPath}/resources/storeimg/${store.storeimg}">
						</c:if>
					</td>
				</tr>		
			</c:forEach>
		</tbody>
	</table>
	
	<div id="pager">
		<!-- ???????????? ?????? -->
		<c:if test="${page != 1}">
			<a href="store_list?page=1&keyword=${keyword}"><input type="button" value="1st"></a>
		</c:if>
		
		<!-- ?????? 10 ????????? -->
		<c:if test="${pstart > 10}">
			<a href="store_list?page=${pstart-1}&keyword=${keyword}"><input type="button" value="Prev"></a>
		</c:if>
		
		<!-- ?????? 1 ????????? -->
		<c:if test="${page != 1}">
			<a href="store_list?page=${page-1}&keyword=${keyword}"><input type="button" value="&lt;"></a>
		</c:if>
		
		<c:if test="${pend >= total}">
			<c:set var="pend" value="${total}" />
		</c:if>
		<c:forEach var="i" begin="${pstart}" end="${pend}">
			<c:if test="${i == page}"><span style="color:#036;font-weight:bold;">${i}</span></c:if>
			<c:if test="${i != page}"><a href="store_list?page=${i}&keyword=${keyword}">${i}</a></c:if>
		</c:forEach>
		
		<!-- ?????? 1 ????????? -->
		<c:if test="${page < total}">
			<a href="store_list?page=${page+1}&keyword=${keyword}"><input type="button" value="&gt;"></a>
		</c:if>
		
		<!-- ?????? 10 ????????? -->
		<c:if test="${pend < total}">
			<a href="store_list?page=${pend+1}&keyword=${keyword}"><input type="button" value="Next"></a>
		</c:if>
		
		<!-- ????????? ?????? -->
		<c:if test="${page < total}">
			<a href="store_list?page=${total}&keyword=${keyword}"><input type="button" value="Last"></a>
		</c:if>
	</div>
	
	<div style="display:none;">
		page:${page}<br>
		pstart:${pstart}<br>
		pend:${pend}<br>
		total:${total}<br>
		keyword:${keyword}<br>
	</div>
	
</section>
	
</body>
</html>