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
		width:600px;
		height:auto;
		margin:80px auto 50px auto;
		text-align:center;
	}
	section table {
		width:90%;
		border-spacing:0px;
		margin:30px auto 40px auto;
	}
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

	<h2>공지사항</h2>
	
	<div class="container">
		<form method="post" action="notice_update_ok">
			<input type="hidden" name="id" value="${notice.id}" />
			<table align="center" border="1">
				<tr>
					<th> <label for="title">제 목</label> </th>
					<td> <input type="text" name="title" id="title" value="${notice.title}" size="63" required /> </td>
				</tr>
				<tr>
					<th> <label for="content">내 용</label> </th>
					<td> <textarea rows="15" cols="65" name="content" id="content">${notice.content}</textarea> </td>
				</tr>
			</table>
			
			<div>
				<input type="submit" value="작성완료" />
				<button onclick="javascript:location='notice_list'">목록</button>
			</div>
		</form>
	</div>
	
</section>
	
</body>
</html>