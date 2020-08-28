<%@page import="java.net.URLEncoder"%>
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
<title>로그인 결과</title>
</head>
<body>
	   
<%--
	   <%
	  // 아이디와 패스워드가 같으면 로그인 성공
	  if(id.equals(pw)){
		  // 쿠키를 만들어주자
		  response.addCookie(new Cookie("ict",URLEncoder.encode("jsp","utf-8")));
		
		  /*   out.println("<h2>로그인 성공</h2>"); */
	  }else{%>
		 <!--  out.println("<h2>로그인 실패</h2>"); -->
		 <script type="text/javascript">
		 	alert("로그인실패\n다시한번로그인하세요");
		 	history.go(-1);
		 </script>
	 <%}%>
	 
	<!--  <p><a href="ex28.jsp">다른페이지로 넘어가기</a></p> -->
	<%response.sendRedirect("ex28.jsp"); %> 
--%>
	   
	<%
	  // 아이디와 패스워드가 같으면 로그인 성공
	  if(id.equals(pw)){
		  // 쿠키를 만들어주자
		  response.addCookie(new Cookie("ict",URLEncoder.encode("jsp","utf-8")));
	  }
	   response.sendRedirect("ex28.jsp"); %>
	
</body>
</html>












