<%@page import="com.ict.edu.VO"%>
<%@page import="com.ict.edu.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String email = request.getParameter("email");
	String pwd = request.getParameter("pwd");
	int result=DAO.getInstance().getWrite(name, subject, content, email, pwd);
	
	/* VO vo = new VO();
	//vo.setName(request.getParameter("name"));
	vo.setName(name);
	vo.setSubject(subject);
	vo.setContent(content);
	vo.setEmail(email);
	vo.setPwd(pwd);
	int result2 = DAO.getInstance().getWrite(vo); */
	pageContext.setAttribute("result", result);
%>
<c:choose>
	<c:when test="${result>0}">
		<script>
		alert("작성성공");
		location.href="list.jsp";
		</script>		
	</c:when>
	<c:otherwise>
		<script>
		alert("작성실패");
		location.href="write.jsp";
		</script>
	</c:otherwise>
</c:choose>
