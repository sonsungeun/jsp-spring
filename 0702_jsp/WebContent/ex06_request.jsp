<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request를 이용한 헤드 정보 보기</title>
</head>
<body>
	<h2>HTTP 헤더 정보 보기</h2>
	<h3>
		<%
			Enumeration headerEnum = request.getHeaderNames();
			while(headerEnum.hasMoreElements()){
				String headerName =(String)headerEnum.nextElement();
				String headerValue =request.getHeader(headerName);
				out.print("<li>"+headerName+"="+headerValue+"</li>");}	
		%>
	</h3>
</body>
</html>