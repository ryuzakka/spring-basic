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
		// JSON ??????
		/* var data = {
				userid:id,
				pwd:pass
		}; */
		
		// formData ??????
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
			<h3>???????????????. ???????????? ?????????.</h3>
			<span>??????????????? ????????? ?????? ????????? ????????????.</span>
		</div>
	</div>
	
	<div id="signin-form">
		<form name="loginForm" method="post" onsubmit="return loginTry()" action="popup_login_ok">
			<input type="hidden" name="menu" value="${param.menu}">
			<input type="text" name="userid" id="userid" placeholder="?????????" required>
			<p>
			<input type="password" name="pwd" placeholder="????????????" required><p>
			<ul id="support-btn">
				<!-- <li><a href="../member/search_id">????????? ??????</a></li> -->
				<li><a href="#" onclick="searchId()">????????? ??????</a></li>
				<li>|</li>
				<li><a href="#" onclick="searchPwd()">???????????? ??????</a></li>
				<li>|</li>
				<li><a href="#" onclick="signUp()">????????????</a></li>
			</ul>
			<p>
			<!-- <input type="button" onclick="loginTry()" value="??? ??? ??? ??? ???"> -->
			<input type="submit" value="??? ??? ??? ??? ???">
		</form>
	</div>
	
	<div id="signinErr" style="display:none;">????????? ????????? ???????????? ????????????.<br>???????????? ??????????????? ?????? ??? ?????? ????????? ?????????.</div>
	<%-- <c:if test="${param.err == 1}"><div id="signinErr">????????? ????????? ???????????? ????????????.<br>???????????? ??????????????? ?????? ??? ?????? ????????? ?????????.</div></c:if> --%>
</div>

</body>
</html>