<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${userid != 'admin'}">
	<c:redirect url="/member/signin" />
</c:if>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>store list</title>
<style>
	section {
		width:900px;
		margin:70px auto;
	}
	section h2 {
		text-align:center;
	}
	section table {
		width:90%;
		border-spacing:0px;
		font-size:14px;
	}
	section table caption {
		text-align:right;
		padding: 8px 10px;
	}
	section table caption a {
		text-decoration:none;
		color:#006633;
		font-size:14px;
		font-weight:600;
	}
	section table tr td:nth-child(2) {
		text-align:left;
		padding-left:10px;
	}
	section table tr:first-child td {
		font-weight:600;
		text-align:center;
	}
	section table tr td {
		text-align:center;
		padding:8px 0px;
	}
	section table tr td img {
		display:block;
		width:120px;
		margin:auto;
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
	<h2>매장 목록</h2>
	
	
	<table align="center" border="1">
		<caption><a href="store_write">매장추가</a></caption>
		<tr>
			<td> 매장이름 </td>
			<td> 매장위치 </td>
			<td> 매장상태 </td>
			<td> 매장사진 </td>
		</tr>
		<c:forEach items="${list}" var="store">
			<tr>
				<td onclick="javascript:location='store_update?id=${store.id}'" style="cursor: pointer;"> ${store.storename} </td>
				<td onclick="javascript:location='store_update?id=${store.id}'" style="cursor: pointer;"> ${store.addr1} (${store.addr2}) </td>
				<td>
					<c:if test="${store.state == 0}">등록중</c:if>
					<c:if test="${store.state == 1}">오픈대기중</c:if>
					<c:if test="${store.state == 2}">운영중</c:if>
					<c:if test="${store.state == 4}">임시 휴점</c:if>
					<c:if test="${store.state == 7}">리뉴얼 준비중</c:if>
					<c:if test="${store.state == 8}">보수공사중</c:if>
					<c:if test="${store.state == 9}">폐점</c:if>
					<p>
					<select id="state" name="state" onchange="stateChange(this.value, ${store.id})">
						<option>- 상태변경 -</option>
						<option value="0">등록중</option>
						<option value="1">오픈대기중</option>
						<option value="2">운영중</option>
						<option value="4">임시 휴점</option>
						<option value="7">리뉴얼 준비중</option>
						<option value="8">보수공사중</option>
						<option value="9">폐점</option>
						<option value="-1" style="color:salmon;">목록에서 삭제</option>
					</select>
				</td>
				<td onclick="javascript:location='store_update?id=${store.id}'" style="cursor: pointer;">
					<c:if test="${store.storeimg != null}">
						<img src="${pageContext.request.contextPath}/resources/storeimg/${store.storeimg}">
					</c:if>
				</td>
			</tr>		
		</c:forEach>
	</table>
</section>
	
</body>
</html>