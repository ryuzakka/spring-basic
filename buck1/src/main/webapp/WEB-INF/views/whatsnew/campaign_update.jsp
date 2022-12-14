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
	section input[type='submit']:hover , input[type='button']:hover {
		text-decoration:underline;
	}
</style>
<script>
	window.onload = function() {
		// DB에 저장된 카테고리 값으로 체크 활성화  
		var cate = ${camp.category};
		console.log(cate);
		document.campUpForm.category[cate].checked = true;
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
	<h1>이벤트</h1>
	
	<div id="container">
	
		<form name="campUpForm" method="post" action="campaign_update_ok" enctype="multipart/form-data">
			<input type="hidden" name="id" value="${camp.id}" />
			<fieldset style="width:600px;text-align:left;margin:auto;font-size:13px;">
				<input type="radio" name="category" id="0" value="0"><label for="0">선택 없음</label>
				<input type="radio" name="category" id="1" value="1"><label for="1">스타벅스 카드</label>
				<input type="radio" name="category" id="2" value="2"><label for="2">스타벅스 리워드</label>
				<input type="radio" name="category" id="3" value="3"><label for="3">온라인</label>
				<p>
				<input type="date" name="startdate" value="${camp.startdate}" />
				<input type="date" name="enddate" value="${camp.enddate}" />
			</fieldset>
			
			<div id="dbImg" style="display:inline-block;width:600px;text-align:left;margin-left:auto;">
				<fieldset style="width:250px;text-align:left;">
					<legend>기존 썸네일 이미지</legend>
					<img src="${pageContext.request.contextPath}/resources/campaignimg/${camp.thumbnail}" width="200" />
					<span>${camp.thumbnail}</span><p>
				</fieldset>
				<div>
					<fieldset style="display:inline-block;width:550px;text-align:left;margin:auto;">
						<legend>기존 내용</legend>
						<div style="width:550px;margin:auto;overflow:auto;white-space:nowrap">
							<div style="display:inline-block;vertical-align:top;">
								<img src="${pageContext.request.contextPath}/resources/campaignimg/${camp.content}" width="250" /><br>
								<span>${camp.content}</span>
							</div>
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
					<td> <input type="text" name="title" id="title" size="63" value="${camp.title}" required /> </td>
				</tr>
				<tr>
					<th style="vertical-align:top;padding-top:11px;"> <label for="content">내 용</label> </th>
					<td>
						<input type="file" name="content" id="content" /><br>
						<img id="contents" width="500" />
					</td>
				</tr>
			</table>
			
			<div style="display:inline-block;margin-top:20px;">
				<input type="submit" value="수정완료" />
				<input type="button" onclick="javascript:location='campaign_list'" value="목록" />
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
			var fileReader = new FileReader();
			fileReader.readAsDataURL(e.target.files[0]);
			fileReader.onload = function(e) {
				//console.log(e.target.result);
				document.getElementById('contents').src = e.target.result;
			}
		}
		
	});
</script>

</body>
</html>