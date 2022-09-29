<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${userid != 'admin'}">
	<c:redirect url="../error/error404" />
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	section {
		width:1200px;
		margin:70px auto;
		text-align:center;
	}
	section h2 {
		text-align:center;
	}
	section table {
		border-spacing:0px;
	}
	
	section table {
		width:100%;
		border-spacing:0px;
		font-size:14px;
	}
	section table thead tr th {
		font-size:16px;
		border-top:1px solid black;
		border-bottom:1px solid black;
		padding-top:17px;
		padding-bottom:17px;
	}
	section table tbody tr:hover {
		text-decoration:underline;
		background:#ddd;
		cursor:pointer;
	}
	section table tbody tr td {
		padding-top:10px;
		padding-bottom:10px;
		border-bottom:1px solid #dddddd;
	}
	section table tbody tr td img {
		width:80px;
	}
</style>
</head>
<body>

<section>
	<h2>이벤트 관리</h2>
	
	<table width="1000" align="center" border="0">
		<thead>
			<tr>
				<th>분류</th>
				<th>썸네일</th>
				<th>제목</th>
				<th>기간</th>
				<th>조회수</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="campaign">
				<tr onclick="javascript:location='../whatsnew/campaign_view?id=${campaign.id}'">
					<td>${campaign.catename}</td>
					<td><img src="${pageContext.request.contextPath}/resources/campaignimg/${campaign.thumbnail}" /></td>
					<td>${campaign.title}</td>
					<td>${campaign.startdate} ~ ${campaign.enddate}</td>
					<td>${campaign.viewcnt}</td>
					<td>${campaign.writeday}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</section>
</body>
</html>