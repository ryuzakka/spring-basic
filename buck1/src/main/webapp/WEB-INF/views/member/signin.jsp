<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/common/top" />
<style>
	#section {
		width:800px;
		height:auto;
		margin-top:85px;
		margin:auto;
		padding-bottom:85px;
		text-align:left;
	}
	h2 {
		margin:102px 0 71px 0;
	}
	#welcome {
		margin:0 0 70px 0;
	}
	#welcome #logo {
		margin-bottom:17px;
	}
	#welcome #message h3 {
		margin:12px 0 6px 0;
	}
	#signin-form input {
		padding:12px 0;
	}
	#signin-form input[type="text"] {
		border:none;
		border-bottom:1px solid #DDD;
		width:300px;
	}
	#signin-form input[type="password"] {
		border:none;
		border-bottom:1px solid #DDD;
		width:300px;
	}
	#signin-form input[type="submit"] {		
		width:300px;
		border-radius:10px;
		border:0px;
		background:#f4f4f1;
		color:#222;
		font-size:16px;
		padding:15px 0 18px 0;
		vertical-align:center;
	}
	#signin-form input[type="submit"]:hover {
		background:#006633;
		color:white;
	}
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
	#signinErr {
		font-size:13px;
		color:red;
	}
</style>

<div id="section">
	
	<h2>STARBUCK</h2>
	
	<div id="welcome">
		<div id="logo">
			<img src="${pageContext.request.contextPath}/resources/images/sb_logo.png">
		</div>
		
		<div id="message">
			<h3>안녕하세요. 스타벅스 입니다.</h3>
			<span>회원서비스 이용을 위해 로그인 해주세요.</span>
		</div>
	</div>
	
	<div id="signin-form">
	<form method="post" action="signin_ok">
		<c:if test="${param.userid == null}"><input type="text" name="userid" placeholder="아이디" required></c:if>
		<c:if test="${param.userid != null}"><input type="text" name="userid" value="${param.userid}" required></c:if>
		<p>
		<input type="password" name="pwd" placeholder="비밀번호" required><p>
		<ul id="support-btn">
			<li><a href="search_id">아이디 찾기</a></li>
			<li>|</li>
			<li><a href="search_pwd">비밀번호 찾기</a></li>
			<li>|</li>
			<li><a href="signup">회원가입</a></li>
		</ul>
		<p>
		<input type="submit" value="로 그 인 하 기">
	</form>
	</div>
	
	<c:if test="${param.err == 1}">
		<div id="signinErr">로그인 정보가 일치하지 않습니다.<br>아이디나 비밀번호를 확인 후 다시 입력해 주세요.</div>
	</c:if>

</div>

<c:import url="/common/bottom" />