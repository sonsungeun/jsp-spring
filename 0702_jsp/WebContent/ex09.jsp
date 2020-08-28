<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파라미터 받기</title>
</head>
<body>
	<h1> 파라미터 결과 보기 (ex09.jsp)</h1>
	<h2> 
		<li>id : <%=id %></li>
		<li>pw : <%=pw %></li>
	</h2>
	</body>
</html>