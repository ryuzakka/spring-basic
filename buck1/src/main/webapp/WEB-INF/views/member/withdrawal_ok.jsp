<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
</head>
<body>

<div id="section">
	
	<h2>STARBUCK</h2>
	
	<div id="intro">
		<div id="logo">
			<img src="${pageContext.request.contextPath}/resources/images/sb_logo.png" alt="starbucks">
		</div>
		<div id="welcome">
			<h3>안녕하세요. 스타벅스입니다.</h3>
			<span>회원탈퇴가 정상적으로 처리됐습니다.</span>
		</div>
	</div>
	
	<div id="login-form">
		<input type="button" onclick="javascript:location='signup'" value="회원가입 페이지로 이동"><p>
		<input type="button" onclick="javascript:location='../main/index'" value="홈으로">
	</div>
	
</div>

</body>
</html>