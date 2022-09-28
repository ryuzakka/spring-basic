<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
	section #form-container {
		width:700px;
		margin:46px auto;
	}
	section #form-container > fieldset {
		margin-bottom:40px;
	}
	section #form-container legend { font-weight:bold; }
	section #form-container #menu-info-field {
		/* margin:auto; */
		padding:20px 30px;
	}
	section #form-container #menu-option-field #type-field > label {
		margin-left:6px;
		margin-right:30px;
	}
	
	section #listBtn input[type="submit"] {
		width:100%;
		border-radius:10px;
		border:0px;
		/* background:#f4f4f1; */
		background:#006633;
		opacity:.7;
		/* color:#222; */
		color:white;
		font-size:14px;
		padding:15px 0 18px 0;
		margin:20px auto;
		text-align:center;
	}
	section #listBtn input[type="submit"]:hover {
		/* background:#006633; */
		opacity:1;
		color:white;
		text-decoration:underline;
	}
	section #listBtn {
		text-align:center;
	}
	section #listBtn a {
		text-decoration:none;
		color:#555555;
		font-size:12px;
	}
	section #listBtn a:hover {
		text-decoration:underline;
	}
</style>

</head>
<body>

<section>
	<h2>메뉴 등록하기</h2>
	
	<!-- form start -->
	<form name="menuInput" method="post" action="menu_write_ok" enctype="multipart/form-data">
	
	<div id="form-container">	<!-- form-container start -->
		<!-- 카테고리 선택 -->
		<fieldset style="padding:20px 0 30px 0;">
			<legend style="font-weight:bold;">카테고리 선택</legend>
			<c:forEach items="${cate}" var="category">
				<input type="radio" name="cate" id="${category.catename}" value="${category.cate2}" /><label for="${category.catename}">${category.catename}</label>
			</c:forEach>
		</fieldset>
		<p>
		
		<!-- 메뉴 기본정보 -->
		<fieldset id="menu-info-field" style="background:#f6f5ef;border:none;">
			<legend>메뉴 기본정보</legend>
			
			<!-- 메뉴명 작성 -->
			<label for="menu-name">메뉴명</label>
			<input type="text" name="menu-name" id="menu-name" /><p>
			
			<!-- 사진 등록 -->
			<input type="file" name="menu-img" id="menu-img-file" /><br>
			<img id="menu-img" width="250" />
		</fieldset>
		<p>
		
		<!-- 메뉴 상세정보 start -->
		<fieldset id="menu-option-field" style="border:3px solid #f6f5ef;margin:auto;padding:20px 30px;">
			<legend>메뉴 상세정보</legend>
			
			<!-- Type 선택 -->
			<fieldset id="type-field" style="background:#f6f5ef;border:none;margin-bottom:30px;">
				<legend>Type</legend>
				<input type="radio" name="type" id="hot" value="1" /><label for="hot">Hot</label>
				<input type="radio" name="type" id="ice" value="2" /><label for="ice">Ice</label>
			</fieldset>
			
			<!-- Size 선택 -->
			<fieldset style="background:#f6f5ef;border:none;">
				<legend>Size</legend>
				<div style="text-align:left;padding-left:170px;">
					<p>
					<input type="checkbox" name="size" id="short" value="1" onclick="sizeOnClick(1,'short-price')" />
						<label for="short">Short</label>
						<input type="text" name="short-price" id="short-price" placeholder="Short 가격" disabled />
					</p><p>
					<input type="checkbox" name="size" id="tall" value="2" onclick="sizeOnClick(2,'tall-price')" />
						<label for="tall">Tall</label>
						<input type="text" name="tall-price" id="tall-price" placeholder="Tall 가격" disabled />
					</p><p>
					<input type="checkbox" name="size" id="grande" value="3" onclick="sizeOnClick(3,'grande-price')" />
						<label for="grande">Grande</label>
						<input type="text" name="grande-price" id="grande-price" placeholder="Grande 가격" disabled />
					</p><p>
					<input type="checkbox" name="size" id="venti" value="4" onclick="sizeOnClick(4,'venti-price')" />
						<label for="venti">Venti</label>
						<input type="text" name="venti-price" id="venti-price" placeholder="Venti 가격" disabled />
					</p>
				</div>
			</fieldset>
			<p>
		
		</fieldset>
		<!-- 메뉴 상세정보 end -->
		
		<!-- 버튼 -->
		<div id="listBtn">
			<input type="submit" value="등록하기"> <br>
			<a href="menu">목록</a>
		</div>
	</div>	<!-- form-container end -->
	</form>	<!-- form end -->
	
	
</section>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		
		/* var sizeOnChange = document.menuInput.size;
		sizeOnChange.onchange = function(e) {
			var checked = e.target.checked;
			if(checked){ console.log(e.target.value); }
		} */
		
		// 메뉴이미지 등록 => 표시
		var img = document.querySelector('#menu-img-file');
		img.onchange = function(e) {
			var menuimg = e.target.files;
			//console.log(thumbnail);
			var fileReader = new FileReader();
			fileReader.readAsDataURL(menuimg[0]);
			fileReader.onload = function(e) {
				document.getElementById('menu-img').src = e.target.result;
			}
		}
		
		// size 체크박스
		/* var sizeCheck = document.menuInput.size;
		console.log(sizeCheck);
		
		sizeCheck.onchange = function() {
			//console.log(sizeCheck.value);
			var str = "";
			for(i of sizeCheck) {
				if(sizeCheck[i].checked == true) {					
					str += i + ",";	// i 가 value
				}
			}
		} */
	});
	function sizeOnClick(n, price) {
		var sizeChecked = document.menuInput.size[n-1].checked;
		var priceTag = document.getElementById(price);
		console.log(sizeChecked);
		
		if(sizeChecked) {			
			priceTag.disabled = false;
			console.log(priceTag);
		} else {			
			priceTag.disabled = true;
		}
	}
</script>

</body>
</html>