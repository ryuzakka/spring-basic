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
		<input type="hidden" name="cate1" value="01" />
		<fieldset style="padding:20px 0 30px 0;">
			<legend style="font-weight:bold;">카테고리 선택</legend>
			<c:forEach items="${cate}" var="category">
				<input type="radio" name="cate2" id="${category.catename}" value="${category.cate2}" /><label for="${category.catename}">${category.catename}</label>
			</c:forEach>
		</fieldset>
		<p>
		
		<!-- 메뉴 기본정보 -->
		<fieldset id="menu-info-field" style="background:#f6f5ef;border:none;">
			<legend>메뉴 기본정보</legend>
			
			<!-- 메뉴명 작성 -->
			<label for="menu-name">메뉴명</label>
			<input type="text" name="menu_name" id="menu-name" /><p>
			
			<!-- 사진 등록 -->
			<input type="file" name="menu_img" id="menu-img-file" /><br>
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
					<input type="hidden" name="sizeArray" />
					<p>
					<input type="checkbox" name="size" id="short" value="1" onclick="sizeOnClick(event)" />
					<!-- <input type="checkbox" name="size" id="short" value="1" onclick="sizeOnClick(1,'price1')" /> -->
						<label for="short">Short</label>
						<input type="text" name="price1" id="price1" placeholder="Short 가격" disabled />
					</p><p>
					<input type="checkbox" name="size" id="tall" value="2" onclick="sizeOnClick(event)" />
					<!-- <input type="checkbox" name="size" id="tall" value="2" onclick="sizeOnClick(2,'price2')" /> -->
						<label for="tall">Tall</label>
						<input type="text" name="price2" id="price2" placeholder="Tall 가격" disabled />
					</p><p>
					<input type="checkbox" name="size" id="grande" value="3" onclick="sizeOnClick(event)" />
					<!-- <input type="checkbox" name="size" id="grande" value="3" onclick="sizeOnClick(3,'price3')" /> -->
						<label for="grande">Grande</label>
						<input type="text" name="price3" id="price3" placeholder="Grande 가격" disabled />
					</p><p>
					<input type="checkbox" name="size" id="venti" value="4" onclick="sizeOnClick(event)" />
					<!-- <input type="checkbox" name="size" id="venti" value="4" onclick="sizeOnClick(4,'price4')" /> -->
						<label for="venti">Venti</label>
						<input type="text" name="price4" id="price4" placeholder="Venti 가격" disabled />
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
		
	});
	
	const sizeArr = new Array();
	function sizeOnClick(e) {
		var num = "price" + e.target.value;
		
		if(e.target.checked) {
			// 선택된 size의 가격input tag의 disabled 없애기
			document.getElementById(num).disabled = false;
			
			// 선택된 size의 값을 배열에 추가 
			sizeArr.push(e.target.value);
			
			// 중복제거
			sizeArr.filter((element, index) => {
			    return sizeArr.indexOf(element) === index;
			});
		} else {
			// 선택된 size의 가격 input tag의 disabled 다시 추가
			document.getElementById(num).disabled = true;
			
			// 선택된 size의 값을 배열에서 삭제 
			for(i=0; i<sizeArr.length; i++) {
				if(sizeArr[i] === e.target.value) {
					sizeArr.splice(i,1);
					i--;
				}
			}
		}
		
		document.menuInput.sizeArray.value = sizeArr;
		console.log(document.menuInput.sizeArray.value);
	}
</script>

</body>
</html>