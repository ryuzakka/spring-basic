<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 메인 -->

<style>
	main {
		width:auto;
		/* width:1900px; */
		height:auto;
		/* margin-top:85px; */
		/* padding-bottom:85px; */
		text-align:center;
	}
	.main-banner {
		width:100%;
		height:646px;
		border:1px solid red;
		background-image:url("${pageContext.request.contextPath}/resources/main/main_background.jpg");
		background-size:cover;
		-ms-overflow-style: none; /* IE and Edge */
	}
	.main-banner .wrap { height:100%; }
	
	.main-banner .wrap .img-wrap {
		/* width:100%; */
		/* height:100%; */
		width:1260px;
		display:flex;
		justify-content:space-between;
		/* overflow:hidden;
		position:relative; */
		margin:40px auto;
		
	}
	.main-banner .wrap .img-wrap .parts-wrap {
		display:inline-block;
		/* -webkit-transition:height 2s, background-color 2s, -webkit-transform 2s;
		transition:height 2s, background-color 2s, transform 2s; */
		/* transition:all ease 2s 0s; */
		opacity: 0;
		animation: fadeIn 1.5s forwards;
	}
	@keyframes firstFadeIn {
		from {opacity: 0;}
		to {opacity: 1;}
	}
	@keyframes secondFadeIn {
		from {opacity: 0;}
		to {opacity: 1;}
	}
	@keyframes thirdFadeIn {
		from {opacity: 0;}
		to {opacity: 1;}
	}
	.main-banner .wrap .img-wrap .parts-wrap a {
		display:block;
		font-size:15px;
		line-height:34px;
		width:129px;
		margin:0 auto;
		color:#12362c;
		border:2px solid #12362c;
		border-radius:5px;
		text-align:center;
		text-decoration:none;
	}
	.main-banner .wrap .img-wrap .parts-wrap a:hover {
		background:#12362c;
		color:white;
		text-decoration:underline;
	}
	
	/*  */
	.line-banner {
		width:100%;
		height:62px;
		background:#ddd;
		margin-bottom:200px;
		display:flex;
		justify-content:center;
	}
	.line-banner .notice {
		display:inline-block;
		width:33%;
		height:62px;
		vertical-align:center;
		/* overflow:hidden; */
		position:relative;
	}
	.line-banner .news {
		display:inline-block;
		width:33%;
		height:62px;
		vertical-align:center;
		/* overflow:hidden; */
		position:relative;
	}
	.line-banner .campaign {
		display:inline-block;
		width:33%;
		height:62px;
		vertical-align:center;
		/* overflow:hidden; */
		position:relative;
	}
	
	.line-banner .title {
		display:inline-block;
		width:18%;
		font-weight:bold;
		font-size:18px;
		float:left;
		margin-top:14px;
	}
	.line-banner > .notice-rolling { width:60%;position:relative;margin:0px;display:inline-block; overflow:hidden; }
	.line-banner > .news-rolling { width:60%;position:relative;margin:0px;display:inline-block; overflow:hidden; }
	.line-banner > .campaign-rolling { width:60%;position:relative;margin:0px;display:inline-block; overflow:hidden; }
	
	.line-banner .list {	/* ul */
		list-style:none;
		max-width:300px;
	}
	.line-banner .notice-rolling .list {
		position:absolute;
		top:0;
		left:0;
		height:100%;
		display:flex;
		text-align:left;
	}
	.line-banner .view-more {
		display:inline-block;
		width:10%;
		cursor:pointer;
		float:right;
		margin-top:14px;
	}
	.line-banner .view-more:hover {
		text-decoration:underline;
	}
</style>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	// Text Rolling
	/* $(function(){
		let h = 10;
		setInterval(function(){
			let ss = setInterval(function(){
				h--;
				$('.list').css("margin-top", h);
				if(h == -73) {
					clearInterval(ss);
					$('.list > li').eq(0).insertAfter($('.list > li').eq(5));
					$('.list').css("margin-top", "10px");
					h = 10;
				}
			},100);
		},1500);
	}); */
</script>

<main>
	
	<!-- 메인배너 (hero) -->
	<section class="main-banner">
		<div class="wrap">
			<div class="img-wrap">
				<div class="parts-wrap" style="margin-top:165px;margin-right:114px;animation: firstFadeIn 1.5s forwards;">
					<img src="${pageContext.request.contextPath}/resources/main/main_copy.png" />
					<p style="margin:48px auto;"><a href="" >자세히 보기</a></p>
				</div>
				<div class="parts-wrap" style="margin-top:28px;animation: firstFadeIn 1.5s forwards;animation-delay:0.5s;">
					<img src="${pageContext.request.contextPath}/resources/main/main_drink1.png" />
				</div>
				<div class="parts-wrap" style="margin-top:127px;animation: secondFadeIn 1.5s forwards;">
					<img src="${pageContext.request.contextPath}/resources/main/main_drink2.png" />
				</div>
				<div class="parts-wrap" style="animation: thirdFadeIn 1.5s forwards;animation-delay:1s">
					<img src="${pageContext.request.contextPath}/resources/main/main_drink3.png" />
				</div>
			</div>
		</div>
	</section>
	
	<!-- 띠배너 -->
	<section class="line-banner">
		<div class="notice">
			<div class="title">공지사항</div>
			<div class="notice-rolling">
				<ul class="list">
					<c:forEach items="${notice}" var="notice">
						<li><a href="">${notice.title}</a></li>
					</c:forEach>
				</ul>
			</div>
			<div class="view-more">더보기</div>
		</div>
		<div class="news">
			<div class="title">뉴스</div>
			<div class="news-rolling">
				<ul class="list">
					<c:forEach items="${news}" var="news">
						<li><a href="">${news.title}</a></li>
					</c:forEach>
				</ul>
			</div>
			<div class="view-more">더보기</div>
		</div>
		<div class="campaign">
			<div class="title">이벤트</div>
			<div class="campaign-rolling">
				<ul class="list">
					<c:forEach items="${campaign}" var="campaign">
						<li><a href="">${campaign.title}</a></li>
					</c:forEach>
				</ul>
			</div>
			<div class="view-more">더보기</div>
		</div>
	</section>
	
</main>

<div style="display:none;"><a href="main">error404</a></div>