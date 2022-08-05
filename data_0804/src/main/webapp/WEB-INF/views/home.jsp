<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Home</title>
</head>
<body>
	
	<a href="data1?name=홍길동&age=23"> data1로 GoGo! </a> <p>
	<a href="data2?name=구교환&age=32"> data2로 GoGo! </a> <p>
	<a href="data3?name=김종국&age=42"> data3 요청으로 data2.jsp로 연결 </a> <p>
	<a href="data4?name=류동헌&age=22&phone=010&addr=경기고양"> data4로 연결 </a> <p>
	<a href="data5/승아/1"> data5로 연결 </a>
	
</body>
</html>
