<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션 태그 : forward</title>
</head>
<body>
<%-- forward : 페이지 이동 // request, response가 살아있다. --%>
<%-- <jsp:forward page="ex07_response.jsp" /> --%>

<%-- ex08.jsp는 id와 pw를 받아서 처리하는 페이지이므로
	 forward액션에서 파라미터값을 줄 수 있다.
	 ex08.jsp에서 한글 처리를 했지만 한글이 깨진다.
	 그래서 해당 페이지에서도 한글 처리를 해야한다.
	 --%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:forward page="ex08.jsp" >
	<jsp:param value="홍길동" name="id"/>
	<jsp:param value="1234" name="pw"/>
</jsp:forward>

</body>
</html>