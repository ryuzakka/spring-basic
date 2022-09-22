<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- ID찾기 -->

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
	#section input {
		padding:10px 0;
	}
	#section input[type="text"] {
		border:none;
		border-bottom:1px solid #DDD;
		width:300px;
	}
	#section #login-form input[type='submit'] {
		width:300px;
		border-radius:10px;
		border:0px;
		background:#f4f4f1;
		color:#222;
		font-size:16px;
		padding:15px 0 18px 0;
		vertical-align:center;
	}
	#section #login-form input[type='submit']:hover {
		background:#006633;
		color:white;
	}
	#section #login-form #support-btn {
		padding-left:0px;
		margin-bottom:40px;
	}
	#section #login-form #support-btn li {
		list-style:none;
		display:inline-block;
		margin:0 7px;
	}
	#section #login-form #support-btn a {
		text-decoration:none;
		color:#555555;
		font-size:12px;
	}
	#section #result {
		width:300px;
		border-radius:10px;
		border:0px;
		background:#006633;
		color:white;
		font-size:18px;
		padding:15px 0 18px 0;
		text-align:center;
	}
</style>
<script>
	function phoneNum(my) {
		// 정규식표현 => 숫자만 허용
		my.value = my.value.replace(/[^0-9]/g, ""); 
	}
</script>
<div id="section">
	
	<h2>STARBUCK</h2>
	
	<div id="intro">
		<div id="logo">
			<img src="${pageContext.request.contextPath}/resources/images/sb_logo.png" alt="starbucks">
		</div>
		<div id="welcome">
			<h3>아이디 찾기</h3>
			<span>휴대폰 번호로 잊어버린 계정의 아이디를 찾으실 수 있습니다.</span>
		</div>
	</div>
	
	<div id="login-form">
		<c:if test="${param.userid == null}">
			<form method="post" action="search_id_ok">
				<input type="text" name="phone" placeholder="휴대폰 번호를 입력하세요." onkeyup="phoneNum(this)">
				<c:if test="${param.err == 1}">
					<br><span style="color:red;font-size:13px;">일치하는 정보가 없습니다.</span>
				</c:if>
				<p><input type="submit" name="submit" value="아이디 찾기"></p>
			</form>
			<p>
			<ul id="support-btn">
				<li><a href="signin">로그인 페이지</a></li>
				<li> | </li>
				<li><a href="search_pwd">비밀번호 찾기</a></li>
				<li> | </li>
				<li><a href="signup">회원가입</a></li>
			</ul>
			<!-- <input type="button" onclick="javascript:location='login.jsp'" value="로그인 페이지로 이동"><p>
			<input type="button" onclick="javascript:location='../main/index.jsp'" value="홈으로"> -->
		</c:if>	
		<c:if test="${param.userid != null}">
			<div id="result">찾기결과 : ${param.userid}</div><p>
			<ul id="support-btn">
				<li><a href="signin?userid=${param.userid}">로그인하기</a></li>
				<li> | </li>
				<li><a href="search_pwd">비밀번호 찾기</a></li>
				<li> | </li>
				<li><a href="../main/index">홈으로</a></li>
			</ul>
		</c:if>
	</div>
	
</div>
