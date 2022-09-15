<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${userid == null}">
	<%-- <c:redirect url="../common/warning/member_only.jsp" /> --%>
</c:if>

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
		width:400px;
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
	#section input {
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
	#section input:hover {
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
	function withdrawal() {
		var chk = confirm("정말 탈퇴하시겠습니까?");
		if(chk)
			location = "withdrawal";
		else
			return false;
	}
</script>

<div id="section">
	
	<h2>회원정보</h2>
	
	<table>
		<tr>
			<td width="120px">아이디</td>
			<td width="360px">${my.userid}</td>
		</tr>
		<tr>
			<td>이 름</td>
			<td>${my.username}</td>
		</tr>
		<tr>
			<td>닉네임</td>
			<td>${my.nickname}</td>
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
			<td>${my.email}</td>
		</tr>
		<tr>
			<td>별</td>
			<td>${my.star}</td>
		</tr>
		<tr>
			<td>등급</td>
			<td>
				<c:if test="${my.level == 0}">Welcome Level</c:if>
				<c:if test="${my.level == 1}">Green Level</c:if>
				<c:if test="${my.level == 2}">Gold Level</c:if>
			</td>
		</tr>
		
	</table>
	<p>
	<input type="button" onclick="javascript:location='info_update?userid=${my.userid}'" value="정보 수정">
	<p><input type="button" onclick="withdrawal()" value="회원탈퇴" /></p>
</div>

