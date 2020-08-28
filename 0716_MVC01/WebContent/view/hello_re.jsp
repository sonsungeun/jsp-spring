<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Hello 결과</h1>
	<h2>
		<li>이름:${name}</li>
		<li>나이:${requestScope.age}</li>
		<li>메세지:${msg}</li>
	</h2>
</body>
</html>