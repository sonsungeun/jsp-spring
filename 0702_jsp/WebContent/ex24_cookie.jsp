<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키</title>
</head>
<body>
<%--
	쿠키는 웹 브라우저(클라이언트)가 정보를 보관하는 저장소를 말한다.
	웹 브라우저는 웹 서버에게 정보를 요청할때 쿠키와 함께 전송한다.
	웹 서버는 웹 브라우저가 전송한 쿠키를 사용하여 필요한 데이터를 읽을 수 있다.
	웹 서버는 쿠키를 이용해서 웹브라우저에게 정보를 전송할 수 있다.
	쿠키는 웹 서버와 웹 브라우저 양쪽에 생성할 수 있는데
	JSP에서 생성하는 쿠키는 웹서버에서 생성하는 쿠키이다.
	하나의 브라우저에서는 여러개의 쿠키를 가질 수 있다.
	
	** 주요 메소드
	setDomain(String pattern) : 이 쿠키가 전송될 서버의 도메인을 지정한다.
	getDomain() : 쿠키의 도메인을 구한다.
	setPath() : 쿠키의 전송 경로를 지정한다.
	getPath() : 쿠키의 전송 경로를 구한다.
	getName() : 쿠키의 이름 호출
	getValue() : 쿠키의 값 호출
	setMaxAge(int) : 쿠키의 유효시간을 초단위로 지정할 수 있다.
 --%>
	<%-- 쿠키 생성 --%>
	<% Cookie cookie = new Cookie("name", URLEncoder.encode("hong","utf-8"));
	   response.addCookie(cookie);%>
	   
	<h2>
		<p> 쿠키 이름 : <%=cookie.getName() %> </p>
		<p> 쿠키 값 : <%=cookie.getValue() %></p>
	</h2>
</body>
</html>