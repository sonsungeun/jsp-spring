<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 기본객체 : session</title>
</head>
<body>
<%--
	- session : 서버와 클라이언트 간의 접속을 유지시켜주기 위한 객체
	
	** 속성을 활용한 데이터 저장과 호출
        저장방법 : session.setAttribute("이름",데이터);
  	호출방법 : session.getAttribute("이름");
  	생명주기 : 일반적으로 웹 브라우저가 종료되면 사라진다.(로그인)
 --%>
 
 	<% 
 	pageContext.setAttribute("name", "홍길동"); 
 	pageContext.setAttribute("age", 24); 
 	
 	request.setAttribute("name", "태권브이"); 
 	request.setAttribute("age", 45); 

 	session.setAttribute("name", "둘리"); 
 	session.setAttribute("age", 99); 
 	%>
 	<h3>
 	이름 : <%=pageContext.getAttribute("name") %><br>
 	나이 : <%=pageContext.getAttribute("age") %><br>
 	이름 : <%=request.getAttribute("name") %><br>
 	나이 : <%=request.getAttribute("age") %><br>
 	이름 : <%=session.getAttribute("name") %><br>
 	나이 : <%=session.getAttribute("age") %><br>
 	</h3>
 	<%-- <%request.getRequestDispatcher("ex15_session.jsp").forward(request, response); %> --%>
	<%response.sendRedirect("ex15_session.jsp"); %> 
</body>
</html>