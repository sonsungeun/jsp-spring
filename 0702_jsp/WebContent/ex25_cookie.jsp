<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>쿠키 목록 보기</h2>
	<%
		Cookie[] cookies = request.getCookies();
		if(cookies!=null&&cookies.length>0){
			for(Cookie k : cookies){
				out.println(k.getName()+" = ");
				out.println(URLDecoder.decode(k.getValue(),"utf-8")+"<br>");
			}
		}else{
			out.println("쿠키가 존재하지 않습니다.");
		}
	%>
</body>
</html>