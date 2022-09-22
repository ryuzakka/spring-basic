<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
	section {
		width:500px;
		height:auto;
		margin:20px auto 50px auto;
		text-align:center;
	}
	section h1 {
		font-size:2em;
		margin:20px auto;
	}
	section #container {
		width:500px;
		margin:auto;
	}
	section #container table {
		width:350px;
		border-spacing:0px;
	}
	section #container table tr td {
		padding:10px 5px;
		font-size:16px;
	}
	section #container table input[type='button'] {
		width:300px;
		border-radius:10px;
		border:0px;
		background:#006633;
		color:white;
		padding:13px 0 13px 0;
		vertical-align:center;
	}
	section #container table input[type='button']:hover {
		text-decoration:underline;
	}
	section #container fieldset {
		width:300px;
		margin:auto;
		border:1px solid #ddd;
	}
	section #container fieldset input[type='radio'] {
		display:none;
	}
	section #container fieldset input[type='radio']+label {
		display:inline-block;
	    cursor:pointer;
	    /* height:24px; */
	    width:90px;
	    padding:6px 0px;
	    border:1px solid #333;
	    border-radius:3px;
	    line-height:24px;
	    text-align:center;
	    font-weight:bold;
	    font-size:13px;
	    background-color:#fff;
    	color:#333;
	}
	section #container fieldset input[type='radio']:checked+label {
		border:1px solid #006633;
		background-color:#006633;
    	color:#fff;
	}
	section #container fieldset input[type="submit"] {
		display:inline-block;
	    cursor:pointer;
	    width:90%;
	    margin-top:10px;
	    padding:6px 0px;
	    border:1px solid #006633;
	    border-radius:3px;
	    line-height:24px;
	    text-align:center;
	    font-weight:bold;
	    font-size:13px;
	    background-color:#006633;
    	color:#fff;
	}
	section #container fieldset input[type="submit"]:hover {
		text-decoration:underline;
	}
</style>

<script>
	function rechargeOk(userid) {
		let fare = document.rechargeForm.fare.value;
		let param = "userid=" + userid + "&fare=" + fare;
		
		let xhr = new XMLHttpRequest();
		xhr.onreadystatechange = () => {
			if(xhr.readyState == 4) {
				opener.location.reload();
				confirm('충전이 완료됐습니다.');
				self.close();
			}
		}
		xhr.open("get", "popup_recharge_ok?"+param);
		xhr.send();
	}
</script>
</head>

<body>
<section>
	<h1>스타벅스 카드 충전</h1>
	
	<div id="container">
		<table align="center" border="0">
			<thead></thead>
			<tbody>
				<tr>
					<td colspan="2">
						<img src="${pageContext.request.contextPath}/resources/images/e_gold_card.png" width="300">
					</td>
				</tr>
				<tr>
					<td width="100">잔액</td>
					<td style="text-align:right;padding-right:30px;">
						<%-- <fmt:formatNumber value="${balance}" type="currency" currencySymbol="" /> --%>
						<fmt:formatNumber value="${balance}" type="number" maxFractionDigits="3" />
					</td>
				</tr>
			</tbody>
		</table>
		<p>
		<form name="rechargeForm" action="popup_recharge_ok">
			<input type="hidden" name="userid" value="${userid}" />
			<fieldset>
				<legend>일반 충전</legend>
				<p>
				<input type="radio" id="1만원" name="fare" value="10000" /><label for="1만원">1만원</label>
				<input type="radio" id="3만원" name="fare" value="30000" /><label for="3만원">3만원</label>
				<input type="radio" id="5만원" name="fare" value="50000" /><label for="5만원">5만원</label>
				<p>
				<input type="radio" id="7만원" name="fare" value="70000" /><label for="7만원">7만원</label>
				<input type="radio" id="10만원" name="fare" value="100000" /><label for="10만원">10만원</label>
				<p>
				<input type="button" onclick="rechargeOk('${userid}')" value="충전하기" />
			</fieldset>
		</form>
	</div>
</section>

</body>
</html>