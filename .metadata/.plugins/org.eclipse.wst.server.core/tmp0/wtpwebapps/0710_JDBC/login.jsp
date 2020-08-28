<%@page import="com.ict.edu.VO"%>
<%@page import="com.ict.edu.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% request.setCharacterEncoding("utf-8");
   String m_id = request.getParameter("m_id");
   String m_pw = request.getParameter("m_pw");
   
   VO vo = DAO.getInstance().getLogin(m_id, m_pw);
   // 로그인 정보는 기본적으로 session 저장하자
   session.setAttribute("vo", vo);
%>    

<c:choose>
	<c:when test="${empty vo}">
		<script>
			alert("로그인 실패");
			location.href="index.jsp";
		</script>
	</c:when>
	<c:otherwise>
		<%-- 성공 메세지 표시 --%>
		<%--<script>
			alert("로그인 성공");
			location.href="";
		</script> --%>
		
		<%-- 성공표시 없이  --%>
		<%--
		    <jsp:forward page=""></jsp:forward>
		    <c:redirect url=""></c:redirect> 
		                                     --%>
		<script>
			alert("로그인 성공");
			location.href="onelist.jsp";
		</script> 
	</c:otherwise>
</c:choose>









