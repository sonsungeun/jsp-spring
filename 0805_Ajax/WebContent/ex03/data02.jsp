<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>오늘날짜표시</h2>
	<%
		Date now = new Date();
		String str = "오늘은 8월 6일 입니다.";
	%>
	<%=now%><br>
	<%=str%><br>
</body>
</html>