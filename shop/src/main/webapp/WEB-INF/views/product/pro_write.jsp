<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품추가</title>
<script>
	//var dae, jung, so;
	function selectDae(daecode) {
		//dae = daecode;
		var xhr = new XMLHttpRequest();
		xhr.open("get", "getjung?daecode="+daecode);
		xhr.send();
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4) {
				console.log(decodeURI(xhr.responseText.trim()));
				document.getElementsByName('jung')[0].innerHTML = decodeURI(xhr.responseText.trim());
			}
		}
	}
	function selectJung(jungcode) {
		//jung = jungcode;
		//console.log(daecode + " " + jungcode);
		var dae = document.getElementsByName('dae')[0].value;
		var xhr = new XMLHttpRequest();
		var param = "daecode="+dae+"&jungcode="+jungcode;
		xhr.open("get", "getso?"+param);
		xhr.send();
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4) {
				console.log(decodeURI(xhr.responseText.trim()));
				document.getElementsByName('so')[0].innerHTML = decodeURI(xhr.responseText.trim());
			}
		}
	}
	function selectSo(socode) {
		var dae = document.getElementsByName('dae')[0].value;
		var jung = document.getElementsByName('jung')[0].value;
		var daejungso = "p"+dae+jung+socode;
		
		//document.inpro.pcode.value = daejungso;
		var xhr = new XMLHttpRequest();
		xhr.open("get", "getpcode?djs="+daejungso);
		xhr.send();
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4) {
				console.log(xhr.responseText.trim());
				document.inpro.pcode.value = xhr.responseText.trim();
			}
		}
	}
</script>
</head>
<body>
	
	<h2>추가 상품등록</h2>
	
	<form name="inpro" method="post" action="pro_write_ok" enctype="multipart/form-data">
		<table width="700" border="1">
			<tr>
				<td> 상품 코드 </td>
				<td> <!-- 대,중,소 -->
					<!-- 
						option태그의 길이 => length
						option태그에 나타낼 글자 => text
						option태그에 값을 서버로 => value
					 -->
					<select name="dae" onchange="selectDae(this.value)">
						<option>- 대분류 -</option>
						 <c:forEach items="${dae}" var="dae">
							<option value="${dae.code}">${dae.title}</option>
						 </c:forEach>
					</select>
					<select name="jung" onchange="selectJung(this.value)">
						<option>- 중분류 -</option>
					</select>
					<select name="so" onchange="selectSo(this.value)">
						<option>- 소분류 -</option>
					</select>
					<input type="text" name="pcode" readonly>
				</td>
			</tr>
			<tr>
				<td> 대표 이미지 </td>
				<td> <input type="file" name="pimg"> </td>
			</tr>
			<tr>
				<td> 상품상세 이미지 </td>
				<td> <input type="file" name="cimg"> </td>
			</tr>
			<tr>
				<td> 상품 제목 </td>
				<td> <input type="text" name="title"> </td>
			</tr>
			<tr>
				<td> 상품 가격 </td>
				<td> <input type="text" name="price"> </td>
			</tr>
			<tr>
				<td> 상품 제조사 </td>
				<td> <input type="text" name="made"> </td>
			</tr>
			<tr>
				<td> 상품 할인율 </td>
				<td> <input type="text" name="halin"> </td>
			</tr>
			<tr>
				<td> 적립금 </td>
				<td> <input type="text" name="juk"> </td>
			</tr>
			<tr>
				<td> 상품수량 </td>
				<td> <input type="text" name="su"> </td>
			</tr>
			<tr>
				<td> 배송비 </td>
				<td> <input type="text" name="baesong" value="0"> </td>
			</tr>
			<tr>
				<td> 배송일 </td>
				<td> <input type="text" name="baeday" value="2"> </td>
			</tr>
		</table>
		<p><input type="submit" value="상품등록"></p>
	</form>
	
</body>
</html>