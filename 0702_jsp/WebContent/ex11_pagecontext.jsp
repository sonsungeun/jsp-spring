<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 기본객체 : pageContext </title>
</head>
<body>
<%--
	pageContext : 하나의 JSP 페이지 내에서 고유될 값을 저장한다.
	  - 해당 페이지와 일대일로 연결된 객체를 의미한다.
	  - 해당 페이지 내에서만큼은 모든 객체를 생성하고 관리하는 객체이다.
	  - getRequest(), getResponse(), getOut(), getPage(), getSession(),
	    getServletContext(), getServletConfig(), getException()
	    
	    ** 속성을 활용한 데이터 저장과 호출
	        저장방법 : pageContext.setAttribute("이름",데이터);
	  	호출방법 : pageContext.getAttribute("이름");
	  	생명주기 : 해당 페이지를 벗어나면 데이터도 사라진다.
 --%>
 	<% 
 	pageContext.setAttribute("name", "홍길동"); 
 	pageContext.setAttribute("age", 24); 
 	%>
 	<h3>
 	이름 : <%=pageContext.getAttribute("name") %><br>
 	나이 : <%=pageContext.getAttribute("age") %><br>
 	</h3>
</body>
</html>