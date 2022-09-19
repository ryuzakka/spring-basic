<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	body {
		margin-top:40px;
		margin-left:40px;
	}
	#section {
		/* width:400px; */
		height:auto;
		/* margin-top:85px; */
		margin:auto;
		/* padding-bottom:85px; */
		text-align:left;
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

<script>
	window.onload = () => {
		document.getElementById('userid').focus();
	}
	
	function searchId() {
		opener.location = '../member/search_id';
		winClose();
	}
	function searchPwd() {		
		opener.location = '../member/search_pwd';
		winClose();
	}
	function signUp() {		
		opener.location = '../member/signup';
		winClose();
	}
	
	function winClose(){
		window.close();
	}
	
	function loginTry() {
		var lform = document.loginForm;
		var id = document.loginForm.userid.value;
		var pass = document.loginForm.pwd.value;
		var param = "userid=" + id + "&pwd=" + pass;
		
		var xhr = new XMLHttpRequest();
		// JSON 방식
		/* var data = {
				userid:id,
				pwd:pass
		}; */
		
		// formData 방식
		//var formData = new FormData(lform);
		//formData.append(userid, document.loginForm.userid.value);
		//formData.append(pwd, document.loginForm.pwd.value);
		
		//console.log(formData);
		
		
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4) {
				console.log('ok ',xhr.responseText.trim());
				if(xhr.responseText.trim() == 0) {
					//console.log('responseText = 0');
					document.getElementById("signinErr").style.display = "block";
				} else {
					//console.log('responseText != 0');
					//opener.location.reload();
					var menu = document.loginForm.menu.value;
					opener.location = 'drink_order?name=' + menu;
					winClose();
				}
			} else {
				console.log(xhr.responseText);
			}
		};
		
		xhr.open("get", "popup_login_ok?"+param, false);
		/* xhr.setRequestHeader("Content-Type", "application/json"); */
		/* xhr.setRequestHeader("Content-Type", "multipart/form-data"); */
		/* xhr.send(JSON.stringify(data)); */
		/* xhr.send(formData); */
		xhr.send();
		return false;
	}
</script>

</head>
<body>

<div id="section">
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
		<form name="loginForm" method="post" onsubmit="return loginTry()" action="popup_login_ok">
			<input type="hidden" name="menu" value="${param.menu}">
			<input type="text" name="userid" id="userid" placeholder="아이디" required>
			<p>
			<input type="password" name="pwd" placeholder="비밀번호" required><p>
			<ul id="support-btn">
				<!-- <li><a href="../member/search_id">아이디 찾기</a></li> -->
				<li><a href="#" onclick="searchId()">아이디 찾기</a></li>
				<li>|</li>
				<li><a href="#" onclick="searchPwd()">비밀번호 찾기</a></li>
				<li>|</li>
				<li><a href="#" onclick="signUp()">회원가입</a></li>
			</ul>
			<p>
			<!-- <input type="button" onclick="loginTry()" value="로 그 인 하 기"> -->
			<input type="submit" value="로 그 인 하 기">
		</form>
	</div>
	
	<div id="signinErr" style="display:none;">로그인 정보가 일치하지 않습니다.<br>아이디나 비밀번호를 확인 후 다시 입력해 주세요.</div>
	<%-- <c:if test="${param.err == 1}"><div id="signinErr">로그인 정보가 일치하지 않습니다.<br>아이디나 비밀번호를 확인 후 다시 입력해 주세요.</div></c:if> --%>
</div>

</body>
</html>