<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/common/top" />
<style>
	.list {
		width:900px;
		margin:auto;
		border:1px solid green;
		display:flex;
		flex-flow:row wrap;
		justify-content:center;
	}
	.list .prod {
		width:300px;
		height:300px;
		display:inline-block;
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
	.list .prod .name {
		width:300px;
	}
</style>

<div id="section">	
	<div class="list">
		<c:forEach items="${list}" var="drink">
			<div class="prod">
				<a href="drink_content?name=${drink.name}">
					<div class="img"><img src="" alt=""></div>
					<div class="name">${drink.name}</div>
				</a>
			</div>
		</c:forEach>
	</div>

</div>
<c:import url="/common/bottom" />