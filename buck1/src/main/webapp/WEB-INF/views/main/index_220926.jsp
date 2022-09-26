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
		height:400px;
		border:1px solid red;
	}
	.main-banner .wrap { height:100%; }
	.main-banner .wrap .btn {
		position:absolute;
		z-index:99;
		top:350px;
		width:91%;
		display:flex;
		justify-content:space-between;
		padding:0px 50px;
	}
	.main-banner .wrap .btn div {}
	.main-banner .wrap .btn .arrow-prev {
		display:inline-block;
		width:80px;
		height:110px;
		cursor:pointer;
	}
	.main-banner .wrap .btn .arrow-next {
		display:inline-block;
		width:80px;
		height:110px;
		cursor:pointer;
	}
	.main-banner .wrap .btn div img {
		width:80px;
		height:110px;
	}
	
	.main-banner .wrap .img-wrap {
		width:100%;
		height:100%;
		overflow:hidden;
		position:relative;
		margin:0px auto;
	}
	.main-banner .wrap .img-wrap ul {
		width:7680px;
		position:absolute;
		top:0px;
		left:0px;
		font-size:0px;
		padding:0px;
		text-align:left;
	}
	.main-banner .wrap .img-wrap ul li {
		list-style:none;
		display:inline-block;
		width:100%;
		vertical-align:top;
	}
	
	.line-banner {
		width:100%;
		height:62px;
		background:#ddd;
	}
	.line-banner .notice {}
	.line-banner .news {}
	.line-banner .campaign {}
	.line-banner .title {}
	.line-banner .list {}
	.line-banner .view-more {}
</style>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(function(){
		$(document).ready(function(){
			var imgs;
			var img_count;
			var img_position = 1;
			
			imgs = $(".img-wrap ul");
			img_count = imgs.children().length;
			
			$(".arrow-prev").click(function(){
				if(img_position > 1) {
					imgs.animate({
						left:'+=1900px'
					});
					img_position--;
				}
			})
			$(".arrow-next").click(function(){
				if(img_count > img_position) {
					imgs.animate({
						left:'-=1900px'
					});
					img_position++;
				}
			})
			
		});
	});
</script>

<main>
	
	<!-- 메인배너 (hero) -->
	<section class="main-banner">
		<div class="wrap">
			<div class="btn">
				<div class="arrow-prev">
					<img src="${pageContext.request.contextPath}/resources/images/arrow_l.png">
				</div>
				<div class="arrow-next">
					<img src="${pageContext.request.contextPath}/resources/images/arrow_r.png">
				</div>
			</div>
			
			<div class="img-wrap">
				<ul>
					<li><img alt="" src="${pageContext.request.contextPath}/resources/main/main_banner01.PNG" /></li>
					<li><img alt="" src="${pageContext.request.contextPath}/resources/main/main_banner02.PNG" /></li>
					<li><img alt="" src="${pageContext.request.contextPath}/resources/main/main_banner03.PNG" /></li>
					<li><img alt="" src="${pageContext.request.contextPath}/resources/main/main_banner04.jpg" /></li>
				</ul>
			</div>
		</div>
	</section>
	
	<!-- 띠배너 -->
	<section class="line-banner">
		<div class="notice">
			<div class="title"></div>
			<ul class="list">
				<%-- <c:forEach>
					<li></li>
				</c:forEach> --%>
			</ul>
			<div class="view-more">더보기</div>
		</div>
		<div class="news">
			<div class="title"></div>
			<ul class="list">
				<%-- <c:forEach>
					<li></li>
				</c:forEach> --%>
			</ul>
			<div class="view-more">더보기</div>
		</div>
		<div class="campaign">
			<div class="title"></div>
			<ul class="list">
				<%-- <c:forEach>
					<li></li>
				</c:forEach> --%>
			</ul>
			<div class="view-more">더보기</div>
		</div>
	</section>
	
</main>

<div style="display:none;"><a href="main">error404</a></div>