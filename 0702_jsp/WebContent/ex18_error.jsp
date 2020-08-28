<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="ex19_error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러 처리</title>
</head>
<body>
	<h2> 에러 처리 </h2>
	<%-- <h3> name : <%=Integer.parseInt(request.getParameter("name")) %></h3> --%>
	
	<%-- 1. try ~ catch --%>
	<%--<%try{%>
		<h3> name : <%=Integer.parseInt(request.getParameter("name")) %></h3>	
	<%}catch(Exception e){
		out.println("<b> name 파라미터 값이 올바르지 않습니다.</b>");
	}%>
	--%>
	
	<%-- 2. 에러페이지 지정 : page 지시어 활용 --%>
	<h3> name : <%=Integer.parseInt(request.getParameter("name")) %></h3>
	
</body>
</html>