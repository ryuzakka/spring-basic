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
		width:70%;
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
		padding-left:20px;
	}
	#section input {
		padding:10px 0;
	}
	#section table tr td:last-child input[type="text"] {
		border:none;
		border-bottom:1px solid #DDD;
		/* width:300px; */
	}
	#section table tr td:last-child input[type="password"] {
		border:none;
		border-bottom:1px solid #DDD;
		/* width:300px; */
	}
	#section table tr td:last-child input[type="number"] {
		width:60px;
		border:1px solid #DDD;
	}
	#section table tr:last-child td:first-child {
		vertical-align:top;
		padding-top:16px;
	}
	#section table tr:last-child td:last-child input {
		margin:7px 0;
		padding:7px 0;
	}
	#section input[type='submit'] {
		width:300px;
		border-radius:10px;
		border:0px;
		background:#f4f4f1;
		color:#222;
		font-size:16px;
		padding:15px 0 18px 0;
		vertical-align:center;
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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	function idcheck(my) {
		// ajax => 아이디 중복확인
		var id = my.value;
		var id_err = document.getElementsByClassName('err')[0];
		
		if(id.trim() == "") {	// ID가 빈칸인 경우
			id_err.style.color = "red";
			id_err.style.display = "inline-block";
			id_err.innerText = "아이디를 입력하세요.";
			my.focus();
		} else {
			var xhr = new XMLHttpRequest();
			xhr.open("post", "signup_idcheck?userid="+id);
			xhr.send();
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4) {
					//console.log(xhr.responseText.trim());
					if(xhr.responseText.trim() == 1) {
						id_err.style.color = "red";
						id_err.style.display = "inline-block";
						id_err.innerText = "사용 중인 아이디 입니다.";
					} else {
						id_err.style.color = "#006633";
						id_err.style.display = "inline-block";
						id_err.innerText = "사용가능한 아이디 입니다.";
					}
				}
			}
		}
	}
	function pwdcheck(my) {
		// 비밀번호 일치 확인
		var pwd1 = document.inputForm.pwd.value;
		var pwd2 = my.value;
		var pwd_err = document.getElementsByClassName('err')[1];
		
		if(pwd1 == pwd2) {
			pwd_err.style.color = "#006633";
			pwd_err.style.display = "inline-block";
			pwd_err.innerText = "비밀번호가 일치합니다.";
		} else {			
			pwd_err.style.color = "red";
			pwd_err.style.display = "inline-block";
			pwd_err.innerText = "비밀번호가 일치하지 않습니다.";
		}
	}
	function birthDay(my) {
		var mon = document.inputForm.birth2.value;
		var birth_err = document.getElementsByClassName('err')[2];
		
		if(mon < 8) {
			if((mon%2) == 1) {	// 1~7 홀수
				if(my.value > 31) {
					birth_err.style.display = "inline-block";
					my.value = "";
				} else {
					err1.style.display = "none";
				}
			} else {	// 1~7 짝수
				if(my.value > 30) {
					birth_err.style.display = "inline-block";
					my.value = "";
				} else {
					birth_err.style.display = "none";
				}
			}
		} else {
			if((mon%2) == 1) {	// 8~12 홀수
				if(my.value > 30) {
					birth_err.style.display = "inline-block";
					my.value = "";
				} else {
					birth_err.style.display = "none";
				}
			} else {	// 8~12 짝수				
				if(my.value > 31) {
					birth_err.style.display = "inline-block";
					my.value = "";
				} else {
					birth_err.style.display = "none";
				}
			}
		}
		
		if(my.value == 0) return false;
	}
	function phoneNum(my) {
		// 정규식표현 => 숫자만 허용
		my.value = my.value.replace(/[^0-9]/g, ""); 
	}
	function phoneCheck(my) {
		// ajax => 연락처 중복확인
		var phone = my.value;
		var phone_err = document.getElementsByClassName('err')[3];
		
		if(phone.trim() == "") {	// ID가 빈칸인 경우
			phone_err.style.color = "red";
			phone_err.style.display = "inline-block";
			phone_err.innerText = "휴대폰번호를 입력하세요.";
		} else {
			var xhr = new XMLHttpRequest();
			xhr.open("post", "signup_phonecheck?phone="+phone);
			xhr.send();
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4) {
					//console.log(xhr.responseText.trim());
					if(xhr.responseText.trim() == 1) {
						phone_err.style.color = "red";
						phone_err.style.display = "inline-block";
						phone_err.innerText = "사용 중인 번호 입니다.";
					} else {
						phone_err.style.color = "#006633";
						phone_err.style.display = "inline-block";
						phone_err.innerText = "사용가능한 번호 입니다.";
					}
				}
			}
		}
	}
	function emailDomain() {
		/* console.log('직접입력'); */
		var selectNum = document.inputForm.emailSelect;
		var val = selectNum.options[selectNum.selectedIndex].value;
		console.log(selectNum + " " + val);
		document.inputForm.email2.value = val;
	}
</script>

<div id="section">
	
	<h2>회원가입</h2>
	<div id="inform">계정은 <strong>연락처 당 1개</strong>로 제한합니다.</div>
	
	<form name="inputForm" method="post" action="signup_ok">
	<table>
		<tr>
			<td width="100">아이디*</td>
			<td width="600">
				<input type="text" name="userid" size="30" onblur="idcheck(this)" required><br>
				<div class="err"></div>
			</td>
		</tr>
		<tr>
			<td>비밀번호*</td>
			<td><input type="password" name="pwd" size="30" required></td>
		</tr>
		<tr>
			<td>비밀번호(확인)*</td>
			<td>
				<input type="password" name="pwd2" size="30" onkeyup="pwdcheck(this)" required><br>
				<div class="err">비밀번호가 일치하지 않습니다.</div>
			</td>
		</tr>
		<tr>
			<td>이 름</td>
			<td><input type="text" name="username" size="30"></td>
		</tr>
		<tr>
			<td>닉네임</td>
			<td><input type="text" name="nickname" size="20"></td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td>
				<select name="birth1">
					<c:forEach var="year" begin="0" end="130"><option value="${2022-year}">${2022-year}</option></c:forEach>
				</select>-
				<select name="birth2">
					<c:forEach var="month" begin="1" end="12"><option value="${month}">${month}</option></c:forEach>
				</select>-
				<input type="number" name="birth3" onblur="birthDay(this)"><br>
				<div class="err">유효하지 않은 날짜입니다.</div>
			</td>
		</tr>
		<tr>
			<td>휴대폰번호*</td>
			<td>
				<input type="text" name="phone" size="20" onkeyup="phoneNum(this)" onblur="phoneCheck(this)" required>
				<!-- <input type="button" name="phoneBtn" onclick="phoneCheck()" value="중복확인"> -->
				<br><div class="err">이미 사용 중입니다.</div>
			</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>
				<input type="text" name="email1" size="28"><br> @
				<input type="text" name="email2">
				<select name="emailSelect" id="emailSelect" onchange="emailDomain()">
					<option value="">직접입력</option>
					<option value="naver.com">naver.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="daum.net">daum.net</option>
					<option value="kakao.com">kakao.com</option>
					<!-- <option value="">직접입력</option> -->
				</select>
			</td>
		</tr>
	</table>
	<p><input type="submit" value="회원가입하기"></p>
	</form>

</div>

<c:import url="/common/bottom" />