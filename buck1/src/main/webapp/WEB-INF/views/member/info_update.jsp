<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/common/top" />

<style>
	#section {
		width:auto;
		height:auto;
		margin:80px auto 50px auto;
		text-align:center;
	}
	#section #inform {
		margin:30px 0 60px 0;
	}
	#section table {
		width:80%;
		display:inline-block;
		text-align:center;
		border-spacing:0px;
		margin:auto;
	}
	#section table tr td {
		padding:10px 0;
	}
	#section table tr td:first-child {
		width:400px;
		text-align:right;
	}
	#section table tr td:last-child {
		text-align:left;
		padding-left:30px;
	}
	/* #section table tr:last-child td:first-child {
		vertical-align:top;
		padding-top:16px;
	} */
	#section input[type='submit'] {
		width:300px;
		border-radius:10px;
		border:0px;
		background:#f4f4f1;
		color:#222;
		font-size:16px;
		padding:15px 0 18px 0;
		vertical-align:center;
		display:inline-block;
		text-align:center;
	}
	#section input[type='submit']:hover {
		background:#006633;
		color:white;
	}
	#section .err {
		font-size:13px;
		color:red;
		display:none;
	}
</style>
<script>
	function emailDomain() {
		var selectNum = document.updateForm.emailSelect;
		var val = selectNum.options[selectNum.selectedIndex].value;
		console.log(val);
		document.updateForm.email2.value = "";
		document.updateForm.email2.value = val;
	}
</script>
<div id="section">
	
	<h2>회원정보 수정</h2>
	
	<form name="updateForm" method="post" action="info_update_ok">
	<table>
		<tr>
			<td>아이디</td>
			<td>${my.userid}</td>
		</tr>
		<tr>
			<td>이 름</td>
			<td>${my.username}</td>
		</tr>
		<tr>
			<td>닉네임</td>
			<td><input type="text" name="nickname" value="${my.nickname}" ></td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td>${my.birth}</td>
		</tr>
		<tr>
			<td>휴대폰번호</td>
			<td>${my.phone}</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>
				<input type="text" name="email1" value="${email1}" size="28"><br> @
				<input type="text" name="email2" value="${email2}">
				<select name="emailSelect" id="emailSelect" onchange="emailDomain()">
					<option value="">직접입력</option>
					<option value="naver.com">naver.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="daum.net">daum.net</option>
					<option value="kakao.com">kakao.com</option>
				</select>
			</td>
		</tr>
		
	</table>
	<p>
	<input type="submit" value="수정완료">
	</form>

</div>

<c:import url="/common/bottom" />