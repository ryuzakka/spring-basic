<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
	#section {
		width:auto;
		height:auto;
		margin:80px auto 50px auto;
		text-align:center;
	}
	.list {
		width:900px;
		margin:auto;
		/* border:1px solid green; */
		display:flex;
		flex-flow:row wrap;
		justify-content:left;
	}
	.list .category-title {
		width:900px;
		padding:15px 30px;
		text-align:left;
		font-size:18px;
		font-weight:bold;
		/* background:#f6f5ef; */
		background:#f4f4f2;
		margin-top:45px;
	}
	.list .prod {
		width:285px;
		height:300px;
		display:inline-block;
		padding:15px 0 15px 13px;
	}
	.list .prod a {
		text-decoration:none;
		cursor:pointer;
		color:black;
	}
	.list .prod .img {
		width:280px;
		height:280px;
	}
	.list .prod .img img {
		width:100%;
		height:100%;
	}
	.list .prod .name {
		width:280px;
		margin-top:8px;
	}
</style>


<div id="section">	
	<h1>음 료</h1>
	<div class="list">
		<c:set var="cateTitle" value="" />
		<c:forEach items="${list}" var="drink">
			<c:if test="${drink.catename != cateTitle}">
				<c:set var="cateTitle" value="${drink.catename}" />
				<div class="category-title">${drink.catename}</div>
			</c:if>
			<div class="prod">
				<a href="drink_content?name=${drink.name}">
					<div class="img"><img src="${pageContext.request.contextPath}/resources/menuimg/${drink.img}"></div>
					<%-- <div class="img"><img src="${pageContext.request.contextPath}/resources/images/${drink.name}.jpg"></div> --%>
					<div class="name">${drink.name}</div>
				</a>
			</div>
		</c:forEach>
	</div>

</div>
