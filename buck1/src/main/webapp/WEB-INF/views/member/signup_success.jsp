<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 회원가입 완료 -->

<style>
	#section {
		width:800px;
		height:auto;
		margin-top:85px;
		margin:auto;
		padding-bottom:85px;
		text-align:left;
	}
	#section h2 {
		margin:102px 0px 71px 0px;
	}
	#section #intro {
		margin:0 0 70px 0;
	}
	#section #intro #logo {
		margin-bottom:17px;
	}
	#section #intro #welcome h3 {
		margin:12px 0 6px 0;
	}
	#section #login-form input[type='button'] {
		width:300px;
		border-radius:10px;
		border:0px;
		background:##f4f4f1;
		color:#222;
		font-size:18px;
		padding:15px 0 18px 0;
		vertical-align:center;
	}
	#section #login-form input[type='button']:hover {
		background:#006633;
		color:white;
	}
</style>
<div id="section">
	
	<h2>STARBUCK</h2>
	
	<div id="intro">
		<div id="logo">
			<img src="${pageContext.request.contextPath}/resources/images/sb_logo.png" alt="starbucks">
		</div>
		<div id="welcome">
			<h3>안녕하세요. 스타벅스입니다.</h3>
			<span>스타벅스의 회원이 되신 것을 진심으로 축하드립니다.</span>
		</div>
	</div>
	
	<div id="login-form">
		<input type="button" onclick="javascript:location='signin'" value="로그인 페이지로 이동"><p>
		<input type="button" onclick="javascript:location='../main/index'" value="홈으로">
	</div>
	
	
</div>
