<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	section {
		width:800px;
		height:auto;
		margin-top:85px;
		margin:auto;
		padding-bottom:85px;
		text-align:center;
	}
	section h2,h3 {
		/* text-align:left; */
		margin:102px 0 71px 0;
	}
	
	#welcome { margin:0 0 70px 0; }
	#welcome #logo { margin-bottom:17px; }
	#welcome #message h3 { margin:12px 0 6px 0; }
	
	#signin-form #support-btn {
		padding-left:0px;
		margin-bottom:40px;
	}
	#signin-form #support-btn li {
		list-style:none;
		display:inline-block;
		margin:0 7px;
	}
	#signin-form #support-btn a {
		text-decoration:none;
		color:#555555;
		font-size:12px;
	}
</style>
</head>

<body>
<section>
	
	<h2>STARBUCK</h2>
	
	<div id="welcome">
		<div id="logo">
			<img src="${pageContext.request.contextPath}/resources/images/sb_logo.png">
		</div>
		
		<div id="message">
			<h3>잘못된 접근입니다.</h3>
			<!-- <span>Error 404</span> -->
		</div>
		
		<div id="signin-form">
			<ul id="support-btn">
				<li><a href="javascript:window.history.back()">이전 페이지</a></li>
				<li>|</li>
				<li><a href="../main/index">홈으로</a></li>
			</ul>
		</div>
	</div>
	
</section>
</body>
</html>