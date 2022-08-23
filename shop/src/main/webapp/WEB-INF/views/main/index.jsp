<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>index</title>
	<style>
		body {
			margin:0px;
		}
		#message {
			width:1000px;
			height:33px;
			background:#EEE;
		}
		header {
			width:1000px;
			height:50px;
			background:#EEA
		}
		nav {
			
		}
		section {
			width:1000px;
			height:300px;
			background:salmon;
		}
		section #ar1 {
			width:1300px;
			height:300px;
			background:#EEB;
		}
		section #ar2 {
			width:1000px;
			height:200px;
			background:#EEF;
		}
		section #ar3 {
			width:1000px;
			height:200px;
			background:#B2CCFF;
		}
		section #ar4 {
			width:1000px;
			height:200px;
			background:#EEC;
		}
		section #ar5 {
			width:1000px;
			height:200px;
			background:#EEF;
		}
		footer {
		
		}
	</style>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script>
		$(function() {
			$("#message #right").click(function() {
				$("#message").slideUp(600);
			});
		});
	</script>
</head>
<body>
	
	<div id="message">						<!-- 간단메세지 -->
		<div id="left"> 사이트 회원가입 이벤트 : </div>
		<div id="right"> X </div>
	</div>
	<header>header</header>					<!-- 로고, 로그인, 회원가입 -->
	<nav>nav</nav>							<!-- 메뉴 및 링크 -->
	<section>								<!-- 현재페이지의 필요한 내용 --> <!-- article은 section내의 하나의 항목 -->
		<article id="ar1">article1</article>	<!-- 그림 슬라이드 -->
		<article id="ar2">article2</article>	<!-- 최신 상품 -->
		<article id="ar3">article3</article>	<!-- 인기 상품 -->
		<article id="ar4">article4</article>	<!-- 특가 상품 -->
		<article id="ar5">article5</article>	<!-- 이벤트 상품 -->
	</section>
	<footer>footer</footer>					<!-- 사이트 관련 정보 -->
	
</body>
</html>