<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 기본객체 : application</title>
</head>
<body>
<%--
	- application : 모든 사용자와 관련해서 공유할 정보를 저장한다.
					웹 어플리케이션의 설정 정보를 주로 저장한다.
	
	** 속성을 활용한 데이터 저장과 호출
        저장방법 : application.setAttribute("이름",데이터);
  	호출방법 : application.getAttribute("이름");
  	생명주기 : 어플리케이션이 종료되면 정보도 사라진다.
 --%>
 
 	<% 
 	pageContext.setAttribute("name", "홍길동"); 
 	pageContext.setAttribute("age", 24); 
 	
 	request.setAttribute("name", "태권브이"); 
 	request.setAttribute("age", 45); 

 	session.setAttribute("name", "둘리"); 
 	session.setAttribute("age", 99);
 	
 	application.setAttribute("name", "희동이"); 
 	application.setAttribute("age", 3); 
 	%>
 	<h3>
 	이름 : <%=pageContext.getAttribute("name") %><br>
 	나이 : <%=pageContext.getAttribute("age") %><br>
 	이름 : <%=request.getAttribute("name") %><br>
 	나이 : <%=request.getAttribute("age") %><br>
 	이름 : <%=session.getAttribute("name") %><br>
 	나이 : <%=session.getAttribute("age") %><br>
 	이름 : <%=application.getAttribute("name") %><br>
 	나이 : <%=application.getAttribute("age") %><br>
 	</h3>
 	<%-- <%request.getRequestDispatcher("ex17_application.jsp").forward(request, response); %> --%>
	<%response.sendRedirect("ex17_application.jsp"); %> 
</body>
</html>