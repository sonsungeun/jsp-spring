<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 내장 객체 : out</title>
</head>
<body>
<%--
	out : 브라우저에 출력하는 역할
		  태그를 이용해야지만 줄 변경, 띄어쓰기가 가능
 --%>
 
 	<%
 		out.println("<h1>Hello World</h1>");
 		out.println("ICT 인재 개발원<br>");
 		out.println("2 강의장<br>");
 		for(int i=0; i<11; i++){
 			out.println(i+"&nbsp;&nbsp;&nbsp;");
 		}
 	%>

</body>
</html>