<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setAttribute("name", "홍길동");
	request.setAttribute("age",24);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="arr" value="홍길동, 임꺽정, 장길산, 일지매" />
<c:forEach var="k" items="${arr}">${k}</c:forEach>
<h1>${name},${age}</h1>
</body>
</html>