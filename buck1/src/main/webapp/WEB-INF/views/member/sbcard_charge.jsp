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
</style>

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
				<tr>
					<td colspan="2"><input type="button" onclick="" value="충전하기" /></td>
				</tr>
			</tbody>
		</table>
	</div>
</section>

</body>
</html>