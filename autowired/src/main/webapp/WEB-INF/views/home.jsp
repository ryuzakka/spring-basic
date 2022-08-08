<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
	<h1>
		Hello world!  
	</h1>
	
	<!-- student -->
	학번 : ${student.hakbun } <p>
	이름 : ${student.name } <p>
	나이 : ${student.age } <p>
	
	<!-- student1 -->
	학번 : ${student1.hakbun }<p>
	이름 : ${student1.name }<p>
	나이 : ${student1.age }<P>
	
	<!-- student2 -->
	학번 : ${student2.hakbun}<p>
	이름 : ${student2.name}<p>
	나이 : ${student2.age }<p>
	
</body>
</html>
