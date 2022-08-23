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
	.list {
		width:900px;
		margin:auto;
		border:1px solid green;
		display:flex;
		flex-flow:row wrap;
		justify-content:left;
	}
	.list .prod {
		width:285px;
		height:300px;
		display:inline-block;
		padding:30px 0 30px 13px;
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
		width:300px;
	}
</style>

<div id="section">	
	<div class="list">
		<c:forEach items="${list}" var="drink">
			<div class="prod">
				<a href="drink_content?name=${drink.name}">
					<div class="img"><img src="${pageContext.request.contextPath}/resources/images/${drink.name}.jpg"></div>
					<div class="name">${drink.name}</div>
				</a>
			</div>
		</c:forEach>
	</div>

</div>
<c:import url="/common/bottom" />