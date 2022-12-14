<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		text-align:center;
	}
	section h2 {
		/* font-size:2em; */
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
	section table thead tr th {
		/* font-size:14px; */
		border-top:1px solid black;
		border-bottom:1px solid black;
		padding-top:17px;
		padding-bottom:17px;
	}
	section table tbody tr td {
		text-align:center;
		/* padding:8px 0px; */
		padding-top:5px;
		padding-bottom:5px;
		border-bottom:1px solid #dddddd;
	}
	section table tbody tr td input[type='button'] {
		background:lightsalmon;
		color:white;
		border:none;
	}
	section table tbody tr td input[type='button']:hover {
		cursor:pointer;
		text-decoration:underline;
	}
</style>
<script>
	window.onload = () => {
		let selectBox = document.querySelector("#cate-select");
		let selectedCate = selectBox.selectedIndex;
		if(selectedCate == "") {			
			selectedCate = "0";
		}
	}
	
	function cateSelect(myvalue) {
		console.log(document.querySelector("#cate-select").selectedIndex);
		location = "menu?cateid=" + myvalue;
	}
	function stateChange(id) {
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4) {
				console.log(xhr.responseText.trim());
				location.reload();
			}
		}
		xhr.open("get", "menu_stateChange?id="+id);
		xhr.send();
	}
</script>
</head>
<body>

<section>
	<h2>?????? ??????</h2>
	
	<div style="display:inline-block;float:right;padding:0px 80px 20px 80px;">
		<button onclick="javascript:location='menu_write'">????????????</button>
	</div>
	
	<table align="center" border="0">
		<thead>
			<tr>
				<th width="180">
					<label for="cate-select">????????????</label>
					<p style="margin-top:9px;margin-bottom:0">
					<select id="cate-select" onchange="cateSelect(this.value)">
						<option>????????????</option>
						<optgroup label="Drink">
							<c:forEach items="${drink}" var="drink">
								<option value="${drink.cate2}">${drink.catename}</option>
							</c:forEach>
						</optgroup>
					</select>
				</th>
				<th width="380">?????????</th>
				<th>Type</th>
				<th>?????????</th>
				<th>??????</th>
				<th>??????</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${menu}" var="menu">
				<tr>
					<td>${menu.catename}</td>
					<td>${menu.name}</td>
					<td>${menu.typename}</td>
					<td>${menu.sizename}</td>
					<td><fmt:formatNumber pattern="###,###" value="${menu.price}" /></td>
					<td>
						${menu.statename}
						<c:if test="${menu.state == 1}">
							<input type="button" value="??????" onclick="stateChange(${menu.id})" />
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
</section>

</body>
</html>