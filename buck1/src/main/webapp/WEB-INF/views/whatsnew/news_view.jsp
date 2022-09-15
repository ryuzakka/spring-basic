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
		float:center;
	}
	section #container {
		width:1100px;
		margin:auto;
	}
	section #container header {
		/* width:1100px; */
		margin:auto;
		border:1px solid #dddddd;
		padding:12px 0px 12px 20px;
		text-align:left;
		font-weight:bold;
		font-size:20px;
	}
	section #container article {
		/* width:1100px; */
		margin:auto;
		padding:60px 30px 20px 30px;
	}
	section .btn {
		display:block;
		margin:20px auto;
		padding:12px 10px;
		border:none;
		border-radius:3px;
		width:1000px;
		text-align:right;
	}
	section .btn .update {
		display:inline-block;
		background:#006633;
		color:white;
		width:70px;
		text-align:center;
		margin:0px;
	}
	section .btn .delete {
		display:inline-block;
		background:#666666;
		color:white;
		width:70px;
		text-align:center;
		margin:0px;
	}
	section .btn .list {
		display:inline-block;
		background:#dddddd;
		width:70px;
		text-align:center;
		margin:0px;
	}
</style>
<script>
	function delCheck(id) {
		var chk = confirm('삭제하시겠습니까?');
		if(chk) {
			location = 'news_delete?id='+id;
		}
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
	
	<div id="container">
		
		<header>${news.title}</header>
		
		<article>
			<c:forEach items="${imgs}" var="imgs">
				<img src="${pageContext.request.contextPath}/resources/newsimg/${imgs}" width="1000" /><br>
			</c:forEach>
		</article>
		
		<div class="btn">
			<c:if test="${userid == 'admin'}">
				<%-- <input type="button" onclick="javascript:location='news_update?id=${news.id}'" value="수정" /> --%>
				<button class="btn update" onclick="javascript:location='news_update?id=${news.id}'"> 수 정 </button>
				
				<%-- <input type="button" onclick="delCheck(${news.id})" value="삭제" /> --%>
				<button class="btn delete" onclick="delCheck(${news.id})"> 삭 제 </button>
			</c:if>
			<!-- <input type="button" onclick="javascript:location='news_list'" value="목록" /> -->
			<button class="btn list" onclick="javascript:location='news_list'"> 목 록 </button>
		</div>
		
	</div>
</section>
	
</body>
</html>