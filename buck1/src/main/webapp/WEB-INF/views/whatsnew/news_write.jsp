<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
	
</style>
</head>
<body>
	
	<!-- 
		[공지사항] 
		목록: 번호 / 제목 / 날짜 / 조회수
		상세: 제목 / 내용 / 윗글  /아랫글
		[이벤트]
		목록: 카테고리 / 썸네일 / 제목 / 기간(시작일-종료일)
		상세: 제목 / 이미지 / 진행이벤트(롤링)
		[뉴스]
		목록: 카테고리 / 번호 / 썸네일 / 제목 / 등록일 / 공지여부
		상세: 제목 / 이미지 / 윗글 / 아랫글
	-->
	
<section>

	<h2>뉴스</h2>
	
	<form name="newsWriteForm" method="post" action="news_write_ok" enctype="multipart/form-data">
		<table align="center" border="1">
			<tr>
				<fieldset style="width:600px;text-align:left;margin:auto;">
					<p>
					<input type="radio" name="category" id="1" value="1"><label for="1">상품 출시</label>
					<input type="radio" name="category" id="2" value="2"><label for="2">스타벅스와 문화</label>
					<input type="radio" name="category" id="3" value="3"><label for="3">스타벅스 사회공헌</label>
					<input type="radio" name="category" id="4" value="4"><label for="4">스타벅스 카드 출시</label>
					</p>
					<input type="checkbox" name="rank" id="rank" /><label for="rank">상단 고정</label><p>
					<input type="file" name="thumbnail" id="thumbnail" /><br>
					<img id="thumbEx" />
				</fieldset>
			</tr>
			<tr>
				<th> <label for="title">제 목</label> </th>
				<td> <input type="text" name="title" id="title" size="63" required /> </td>
			</tr>
			<tr>
				<th rowspan="2"> <label for="content">내 용</label> </th>
				<td> <input type="file" name="content" id="content" multiple /> </td>
			</tr>
			<tr>
				<td>
					<div id="contents" width="500"></div>
					<!-- <img id="contents" /> -->
				</td>
			</tr>
		</table>
		
		<div>
			<input type="submit" value="작성완료" />
			<button onclick="javascript:location='news_list'">목록</button>
		</div>
	</form>
	
</section>

<script>
	$(function(){
		/* 썸네일 표시 */
		var thumb = document.getElementById('thumbnail');
		thumb.onchange = function(e) {
			var thumbnail = e.target.files;
			//console.log(thumbnail);
			var fileReader = new FileReader();
			fileReader.readAsDataURL(e.target.files[0]);
			fileReader.onload = function(e) {
				document.getElementById('thumbEx').src = e.target.result;
			}
		}
		
		/* 내용 이미지 표시 */
		var con = document.getElementById('content');
		con.onchange = function(e) {
			var files = e.target.files;
			//console.log(files);
			//console.log(files[0]);
			//fileReader.readAsDataURL(e.target.files[0]);
			var str = "";
			console.log(files.length);
			for(var i=0; i<files.length; i++) {				
				var fileReader2 = new FileReader();
				fileReader2.readAsDataURL(e.target.files[i]);
				fileReader2.onload = function(e) {
					//console.log(e.target.result);
					document.getElementById('contents').innerHTML += '<img width="500" src="'+ e.target.result +'" /><br>';
				}
			}
		}
		
		/* 공지 체크 처리 */
		var checkbox = document.newsWriteForm.rank;
		checkbox.onchange = function() {
			checkbox.checked == true ? checkbox.value = 1 : checkbox.value = 0;
			//console.log(checkbox.value);
		}
	});
</script>
	
</body>
</html>
