<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 기본객체 : session</title>
</head>
<body>
	<h2>Ex15페이지</h2>
 	<h3>
 	이름 : <%=pageContext.getAttribute("name") %><br>
 	나이 : <%=pageContext.getAttribute("age") %><br>
 	이름 : <%=request.getAttribute("name") %><br>
 	나이 : <%=request.getAttribute("age") %><br>
 	이름 : <%=session.getAttribute("name") %><br>
 	나이 : <%=session.getAttribute("age") %><br>
 	</h3>
 
</body>
</html>