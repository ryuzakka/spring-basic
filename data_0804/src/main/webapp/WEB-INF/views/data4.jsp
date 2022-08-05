<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>data4</title>
</head>
<body>	<!-- data4.jsp -->
	
	${name} is ${age} years old.
	Please don't call me ${phone}
	${addr}

	<hr>
	
	name : ${mydto.name }<br>
	age : ${mydto.age }<br>
	phone : ${mydto.phone }<br>
	addr : ${mydto.addr }<br>
	
	
</body>
</html>