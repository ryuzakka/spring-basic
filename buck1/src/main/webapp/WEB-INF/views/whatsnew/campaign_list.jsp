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
	section h1 {
		font-size:2em;
	}
	section .container {
		width:1200px;
		margin:auto;
	}
	section #searchArea {
		width:600px;
		margin:40px auto;
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
	section #searchArea input[type='submit']:hover {
		text-decoration:underline;
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
	section main {
		width:1100px;
		margin:auto;
	}
	section main ul {
		width:1100px;
		margin:auto;
		padding:19px 0px;
		/* border:1px solid green; */
		display:flex;
		flex-flow:row wrap;
		/* justify-content:space-between; */
		justify-content:left;
	}
	section main ul li {
		list-style:none;
		/* margin:16px 0px 12px 0px; */
		margin-bottom:20px;
	}
	section main ul li a {
		text-decoration:none;
		cursor:pointer;
		color:black;
	}
	section main ul li a:hover {
		text-decoration:underline;
		color:#063;
	}
	section main ul li div {
		width:260px;
	}
	section main ul li dl {}
	section main ul li dl dt {
		margin:auto;
		font-size:16px;
	}
	section main ul li dl dd {
		margin:auto;
		font-size:12px;
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
	<h1>이벤트</h1>
	
	<div class="container">
		<div id="searchArea">
			<form name="search" method="get" action="campaign_list" onsubmit="return check(this)">
				<fieldset>
					<input type="search" name="keyword" value="${keyword}" placeholder="검색어를 입력해 주세요." size="30">
					<input type="submit" value="검색">
				</fieldset>
			</form>
		</div>
		
		<c:if test="${userid == 'admin'}">
			<div style="display:inline-block;float:right;padding:0px 50px 0px 0px;">
				<button onclick="javascript:location='campaign_write'">글쓰기</button>
			</div>
		</c:if>
		
		<main>
			<ul>
				<c:forEach items="${list}" var="camp">
					<li>
						<a href="campaign_viewcnt?id=${camp.id}">
							<div><img src="${pageContext.request.contextPath}/resources/campaignimg/${camp.thumbnail}" width="260" /></div>
							<dl>
								<dt>${camp.title}</dt>
								<dd>${camp.startdate} ~ ${camp.enddate}</dd>
							</dl>
						</a>
					</li>
				</c:forEach>
				<c:if test="${total eq 0}">
					<li style="margin:60px auto;"><span>조회된 결과가 없습니다.</span></li>
				</c:if>
			</ul>
		</main>
		
	</div>
	
</section>

</body>
</html>