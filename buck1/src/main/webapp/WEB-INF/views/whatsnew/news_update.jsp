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
		height:auto;
		margin:80px auto 50px auto;
		text-align:center;
	}
	section #dbImg fieldset {
		border:1px solid #DDD;
	}
	section table {
		width:600px;
		border-spacing:0px;
		margin:30px auto 40px auto;
	}
	section table tr th {
		border-bottom:1px solid #dddddd;		
	}
	section table tr td {
		padding:10px 0px;
		text-align:left;
		padding-left:20px;
		border-bottom:1px solid #dddddd;
	}
	section input[type='submit'] {
		padding:12px 0;
		border:none;
		color:white;
		background:#006633;
		border-bottom:1px solid #dddddd;
		border-radius:3px;
		width:70px;
		text-align:center;
	}
	section input[type='button'] {
		padding:12px 0;
		border:none;
		border-bottom:1px solid #DDD;
		border-radius:3px;
		width:70px;
		text-align:center;
	}
</style>
<script>
	window.onload = function() {
		// DB에 저장된 카테고리 값으로 체크 활성화  
		var cate = ${news.category};
		console.log(cate);
		document.newsUpform.category[cate-1].checked = true;
		
		// DB에 저장된 상단고정(rank) 값으로 체크 활성화
		var notice = ${news.rank};
		var checkbox = document.newsUpform.rank;
		notice == 1 ? checkbox.checked = true : checkbox.checked = false;
	}
</script>
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

	<h1>뉴 스</h1>
	
	<div class="container">
		<form name="newsUpform" method="post" action="news_update_ok" enctype="multipart/form-data">
			<input type="hidden" name="id" value="${news.id}" />
			<fieldset style="width:600px;text-align:left;margin:auto;font-size:13px;">
				<p>
				<input type="radio" name="category" id="1" value="1"><label for="1">상품 출시</label>
				<input type="radio" name="category" id="2" value="2"><label for="2">스타벅스와 문화</label>
				<input type="radio" name="category" id="3" value="3"><label for="3">스타벅스 사회공헌</label>
				<input type="radio" name="category" id="4" value="4"><label for="4">스타벅스 카드 출시</label>
				</p>
				<input type="checkbox" name="rank" id="rank" value="${news.rank}" /><label for="rank">공지(상단 고정)</label><p>
				<!-- <input type="file" name="thumbnail" id="thumbnail" /><br>
				<img id="thumbEx" width="300" align="center" /><p> -->
			</fieldset><p>
			
			<div id="dbImg" style="display:inline-block;width:600px;text-align:left;margin-left:auto;">
				<fieldset style="width:250px;text-align:left;">
					<legend>기존 썸네일 이미지</legend>
					<img src="${pageContext.request.contextPath}/resources/newsimg/${news.thumbnail}" width="200" />
					<span>${news.thumbnail}</span><p>
				</fieldset>
				<div>
					<fieldset style="display:inline-block;width:550px;text-align:left;margin:auto;">
						<legend>기존 내용</legend>
						<div style="width:550px;margin:auto;overflow:auto;white-space:nowrap">
							<c:forEach items="${imgs}" var="imgs">
								<div style="display:inline-block;vertical-align:top;">
									<img src="${pageContext.request.contextPath}/resources/newsimg/${imgs}" width="250" /><br>
									<span>${imgs}</span>
								</div>
							</c:forEach>
						</div>
					</fieldset>
				</div>
			</div>
			
			<table align="center" border="0">
				<tr>
					<th width="50"> 썸네일 </th>
					<td>
						<input type="file" name="thumbnail" id="thumbnail" /><br>
						<img id="thumbEx" width="300" />
					</td>
				</tr>
				<tr>
					<th> <label for="title">제 목</label> </th>
					<%-- <td> <input type="text" name="title" id="title" value="${news.title}" size="63" required /> </td> --%>
					<td> <input type="text" name="title" value="${news.title}" size="63" /> </td>
				</tr>
				<tr>
					<th style="vertical-align:top;padding-top:11px;"> <label for="content">내 용</label> </th>
					<td>
						<input type="file" name="content" id="content" multiple />
						<input type="hidden" name="wholecontent" id="wholecontent" />
						<div id="contents" width="500"></div>
					</td>
				</tr>
			</table>
			
			<div>
				<input type="submit" value="작성완료" />
				<input type="button" onclick="javascript:location='news_list'" value="목록" />
			</div>
		</form>
	</div>
	
</section>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(function(){
		/* 썸네일 표시 */
		var thumb = document.getElementById('thumbnail');
		thumb.onchange = function(e) {
			var thumbnail = e.target.files;
			console.log(thumbnail);
			var fileReader = new FileReader();
			fileReader.readAsDataURL(e.target.files[0]);
			fileReader.onload = function(e) {
				document.getElementById('thumbEx').src = e.target.result;
			}
		}
		
		/* 내용 이미지 표시 */
		var con = document.getElementById('content');
		con.onchange = function(e) {
			document.getElementById('contents').innerHTML = "";
			var files = e.target.files;
			console.log('files',files);
			//console.log(files[0]);
			//fileReader.readAsDataURL(e.target.files[0]);
			var str = "";
			var imgList = "";
			//console.log(files.length);
			for(var i=0; i<files.length; i++) {
				imgList += e.target.files[i].name + ",";
				var fileReader2 = new FileReader();
				fileReader2.readAsDataURL(e.target.files[i]);
				fileReader2.onload = function(e) {
					//console.log(e.target.result);
					document.getElementById('contents').innerHTML += '<img width="500" src="'+ e.target.result +'" /><br>';
				}
			}
			//console.log('e.target.files[i].name',imgList);
			document.getElementById('wholecontent').value = imgList;
		}
		
		/* 공지 체크 처리 */
		var checkbox = document.newsUpform.rank;
		checkbox.onchange = function() {
			checkbox.checked == true ? checkbox.value = 1 : checkbox.value = 0;
			//console.log(checkbox.value);
		}
	});
</script>

</body>
</html>