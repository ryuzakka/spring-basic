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
		width:1200px;
		height:auto;
		margin:80px auto 50px auto;
		text-align:center;
	}
	section h1 {
		font-size:2em;
	}
	section #container {
		width:1100px;
		margin:auto;
	}
	section #container table {
		width:350px;
		border-spacing:0px;
	}
	section #container table tr td {
		padding:20px 5px;
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

</head>
<body>

<section>
	<h1>???????????? ?????? ??????</h1>
	
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
					<td width="100">??????</td>
					<td style="text-align:right;padding-right:30px;">
						<%-- <fmt:formatNumber value="${balance}" type="currency" currencySymbol="" /> --%>
						<fmt:formatNumber value="${balance}" type="number" maxFractionDigits="3" />
					</td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
			</tbody>
		</table>
		
		<form name="rechargeForm" action="sbcard_recharge">
			<input type="hidden" name="userid" value="${userid}" />
			<fieldset>
				<legend>?????? ??????</legend>
				<p>
				<input type="radio" id="1??????" name="fare" value="10000" /><label for="1??????">1??????</label>
				<input type="radio" id="3??????" name="fare" value="30000" /><label for="3??????">3??????</label>
				<input type="radio" id="5??????" name="fare" value="50000" /><label for="5??????">5??????</label>
				<p>
				<input type="radio" id="7??????" name="fare" value="70000" /><label for="7??????">7??????</label>
				<input type="radio" id="10??????" name="fare" value="100000" /><label for="10??????">10??????</label>
				<p>
				<input type="submit" value="????????????" />
			</fieldset>
		</form>
	</div>
</section>

</body>
</html>