<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Stanbucks</title>
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
			/* overflow-x:hidden; */
			z-index:99;
		}
		#wrap #gnb {
			width:100%;
			height:100%;
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
			/* height:75px; */
			cursor:pointer;
			padding-top:23px;
		}
		#gnb #first #nav-member {
			text-align:right;
			margin-right:42px;
			padding-top:10px;
		}
		
		#gnb #first #nav-member > #guest, #admin, #user {
			margin:0 0 32px 0;
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
		/* #gnb #first #nav-member #guest {
			margin:0 0 32px 0;
		} */
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
		
		/*  */
		
		/* h1, h2, h3, h4, h5, h6 {
			text-align:center;
		} */
		
		section h1 {
			font-size:2em;
		}
		
		/*  */
		
		
		#footer {
			position:relative;
			width:100%;
			font-size:12px;
			background:#2C2A29;
			text-align:center;
		}
		#footer .copyright {
			width:1200px;
			margin:auto;
			padding:60px 0px;
			color:#CCCCCC;
		}
		#footer .copyright a {
			text-decoration:none;
			color:#CCCCCC;
			padding:0 10px;
		}
		#footer .copyright a:hover {
			text-decoration:underline;
		}
		#footer .copyright .copy_menu {
			color:#999999;
			padding:25px 0 5px 0;
		}
		#footer .copyright .copy_menu li {
			list-style:none;
			line-height:1.3;
			display:inline-block;
			margin:0px 7px;
		}
		#footer .copyright .en {
			color:#999999;	
		}
	</style>
	
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
	
<decorator:head/>
</head>
<body>

	<div id="wrap">
		<div id="gnb">
			<div id="first">
				<div id="left">
					<a href="../main/index">
						<img src="${pageContext.request.contextPath}/resources/images/sb_logo.png">
					</a>
				</div>
				<div id="nav-member">
					<c:if test="${userid == null}">
						<!-- <div>???????????????</div> -->
						<ul id="guest">
							<li><a href="../member/signin">Sign In</a></li>
							<li><a href="../member/signup">Sign Up</a></li>
						</ul>
					</c:if>
					<c:if test="${userid != null}">
						<c:if test="${userid != 'admin'}">
							<!-- <div>??????????????? ${nick}???</div> -->
							<ul id="user">
								<li><span style="font-size:12px;font-weight:bold;">${nick}???</span></li>
								<li><a href="../member/info">????????????</a></li>
								<li><a href="../cart/list">????????????</a></li>
								<li><a href="../member/myorder">?????? ??????</a></li>
								<li><a href="../member/sbcard_charge">?????? ??????</a></li>
								<!-- <li><a href="">Gift ??????</a></li> -->
								<li><a href="../member/logout">????????????</a></li>
							</ul>
						</c:if>
						<c:if test="${userid == 'admin'}">
							<div>???????????????</div>
							<ul id="admin">
								<li><a href="../admin/order">????????????</a></li>
								<li><a href="../admin/menu?cateid=01">????????????</a></li>
								<li><a href="../admin_store/store_list">????????????</a></li>
								<li><a href="../admin/member">????????????</a></li>
								<li><a href="../whatsnew/notice_list">????????????</a></li>
								<li><a href="../whatsnew/news_list">????????????</a></li>
								<li><a href="../admin/campaign">???????????????</a></li>
								<li><a href="../member/logout">????????????</a></li>
							</ul>
						</c:if>
					</c:if>
				</div>
				
				<div id="nav-menu">
					<ul id="nav-menu-list">
						<li id="top-menu" onmouseover="view(0)" onmouseout="hide(0)">
							<div class="drop-menu-title">MENU</div>
							<ul class="drop-menu">
								<li><a href="../menu/drink_list">??????</a></li>
								<li><a href="../menu/drink_list?cate2=01">???????????????</a></li>
								<li><a href="../menu/drink_list?cate2=02">????????????</a></li>
								<li><a href="../menu/drink_list?cate2=03">???????????????</a></li>
								<li><a href="../menu/drink_list?cate2=04">????????????</a></li>
								<li><a href="../menu/drink_list?cate2=05">?????????</a></li>
								<li><a href="../menu/drink_list?cate2=06">???(?????????)</a></li>
								<!-- <li><a href="">??????</a></li> -->
							</ul>
						</li>
						<li id="top-menu" onmouseover="view(1)" onmouseout="hide(1)">
							<div class="drop-menu-title">STORE</div>
							<ul class="drop-menu">
								<li><a href="../store/store_map">????????????</a></li>
								<li><a href="../store/store_info">????????????</a></li>
							</ul>
						</li>
						<li id="top-menu" onmouseover="view(2)" onmouseout="hide(2)">
							<div class="drop-menu-title">REWARDS</div>
							<ul class="drop-menu">
								<li><a href="https://www.starbucks.co.kr/msr/msreward/about.do" target="_blank">????????? ??????</a></li>
								<li><a href="https://www.starbucks.co.kr/msr/sceGift/egift_information.do" target="_blank">e-Gift ??????</a></li>
							</ul>
						</li>
						<li id="top-menu" onmouseover="view(3)" onmouseout="hide(3)">
							<div class="drop-menu-title">WHAT'S NEW</div>
							<ul class="drop-menu">
								<li><a href="../whatsnew/notice_list">????????????</a></li>
								<li><a href="../whatsnew/news_list">??????</a></li>
								<li><a href="../whatsnew/campaign_list">?????????</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

<decorator:body/>

	<footer>
		<div id="footer">
			<div class="copyright">
				<a class="c_00b050" href="/footer/etc/privacy.do">????????????????????????</a>
				<a href="/footer/etc/rules_vod.do" class="mbn">???????????????????????? ???????????? ??????</a>
				<a href="/footer/etc/rules.do">???????????? ????????????</a>
				<a href="/footer/etc/rules_loc.do" class="mbn">???????????? ????????????</a>
				<a href="/footer/etc/rules_msr.do" class="mbn">???????????? ?????? ????????????</a>
				<a href="/footer/etc/rules_non.do" class="mbn">????????? ????????????</a>
				<span class="br">
				<a href="/footer/etc/rules_mdp.do">My DT Pass ????????? ????????????</a></span> <!-- 20200914 mdp ?????? -->
				<a href="/footer/etc/hotline.do" class="last">???????????? ?????????</a></span>
				<br>
				<ul class="copy_menu">
					<li>????????????????????? : 201-81-21515</li>
					<li>???????????? ???????????????????????? ???????????? : ??? ???????????? ??????</li>
					<li>TEL : 1522-3232</li>
					<li>???????????? ????????? : ?????????</li>
				</ul>
				<span class="en">??? 2022 Starbucks Coffee Company. All Rights Reserved.</span>
			</div>
		</div>
	</footer>