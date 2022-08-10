<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>starbucks</title>
<!-- <link rel="stylesheet" type="text/css" href="/css/bucks.css" /> -->
<script>
	function view(n) {
		document.getElementsByClassName('drop-menu-title')[n].style.color = "#669900";
		document.getElementsByClassName('drop-menu')[n].style.visibility = "visible";
	}
	function hide(n) {
		document.getElementsByClassName('drop-menu-title')[n].style.color = "#555555";
		document.getElementsByClassName('drop-menu')[n].style.visibility = "hidden";
	}
</script>
<style>
	body, div {
		vertical-align:baseline;
		margin:0px;
		padding:0px;
		border:0px;
	}
	#wrap {
		width:100%;
		position:relative;
		overflow-x:hidden;
	}
	#wrap #gnb {
		width:100%;
		height:120px;
		background:#f6f5ef;
		margin:0;
	}
	#gnb #first {
		width:1000px;
		height:120px;
		position:relative;
		margin:0px auto;
	}
	#gnb #first #left {
		position:absolute;
		left:0px;
		width:75px;
		height:75px;
		cursor:pointer;
		padding-top:23px;
	}
	#gnb #first #nav-member {
		text-align:right;
		margin-right:42px;
		padding-top:10px;
	}
	
	#gnb #first #nav-member > #admin, #user {
		margin:0 0 22px 0;
	}
	#gnb #first #nav-member #admin li {
		list-style:none;
		display:inline-block;
		text-align:right;
		width:96px;
	}
	#gnb #first #nav-member #user li {
		list-style:none;
		display:inline-block;
		text-align:center;
		width:90px;
	}
	#gnb #first #nav-member #guest {
		margin:0 0 32px 0;
	}
	#gnb #first #nav-member #guest li {
		list-style:none;
		display:inline-block;
		text-align:center;
		width:70px;
	}
	#gnb #first #nav-member ul li a {
		text-decoration:none;
		color:#555555;
		font-size:13px;
	}
	
	#gnb #first #nav-menu {
		text-align:center;
		/* margin-top:32px; */
	}
	#gnb #first #nav-menu #nav-menu-list {
		margin:0px;
	}
	#gnb #first #nav-menu #nav-menu-list #top-menu {
		list-style:none;
		display:inline-block;
		position:relative;
		width:170px;
	}
	#gnb #first #nav-menu #nav-menu-list #top-menu div:hover {
		color:#669900;
		text-decoration:underline;
	}
	#gnb #first #nav-menu #nav-menu-list #top-menu .drop-menu {
		position:absolute;
		list-style:none;
		width:170px;
		height:auto;
		padding:9px 0px;
		line-height:40px;
		visibility:hidden;
		background:#2C2A29;
		color:white;
	}
	#gnb #first #nav-menu #nav-menu-list #top-menu .drop-menu a {
		text-decoration:none;
		color:white;
		cursor:pointer;
	}
	#gnb #first #nav-menu #nav-menu-list #top-menu .drop-menu a:hover {
		color:#669900;
	}

</style>
</head>
<body>
<div id="wrap">
	<div id="gnb">
		<div id="first">
			<div id="left">
				<a href="../main/index"><img src="/img/sb_logo.png"></a>
			</div>
			<div id="nav-member">
				<c:if test="${userid == null}">
					<!-- <div>회원서비스</div> -->
					<ul id="guest">
						<li><a href="../member/signin">Sign In</a></li>
						<li><a href="/member/signup">Sign Up</a></li>
					</ul>
				</c:if>
				<c:if test="${userid != null}">
					<c:if test="${userid != 'admin'}">
						<div>반갑습니다 ${userid}님</div>
						<ul id="user">
							<li><a href="">회원정보</a></li>
							<li><a href="">장바구니</a></li>
							<li><a href="">나의 주문</a></li>
							<li><a href="">나의 리워드</a></li>
							<li><a href="">Gift 확인</a></li>
							<li><a href="">로그아웃</a></li>
						</ul>
					</c:if>
					<c:if test="${userid == 'admin'}">
						<div>관리자모드</div>
						<ul id="admin">
							<li><a href="">주문관리</a></li>
							<li><a href="">Gift관리</a></li>
							<li><a href="">회원관리</a></li>
							<li><a href="">새소식관리</a></li>
							<li><a href="">신상품관리</a></li>
							<li><a href="">이벤트관리</a></li>
							<li><a href="/member/logout.jsp">로그아웃</a></li>
						</ul>
					</c:if>
				</c:if>
			</div>
			
			<div id="nav-menu">
				<ul id="nav-menu-list">
					<li id="top-menu" onmouseover="view(0)" onmouseout="hide(0)">
						<div class="drop-menu-title">MENU</div>
						<ul class="drop-menu">
							<li><a href="../menu/drink_list.jsp">음료</a></li>
							<li><a href="">푸드</a></li>
						</ul>
					</li>
					<li id="top-menu" onmouseover="view(1)" onmouseout="hide(1)">
						<div class="drop-menu-title">STORE</div>
						<ul class="drop-menu">
							<li><a href="">매장찾기</a></li>
							<li><a href="">지역검색</a></li>
						</ul>
					</li>
					<li id="top-menu" onmouseover="view(2)" onmouseout="hide(2)">
						<div class="drop-menu-title">REWARDS</div>
						<ul class="drop-menu">
							<li><a href="">리워드 소개</a></li>
							<li><a href="">e-Gift 소개</a></li>
						</ul>
					</li>
					<li id="top-menu" onmouseover="view(3)" onmouseout="hide(3)">
						<div class="drop-menu-title">WHAT'S NEW</div>
						<ul class="drop-menu">
							<li><a href="">새소식</a></li>
							<li><a href="">신상품</a></li>
							<li><a href="">이벤트</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>