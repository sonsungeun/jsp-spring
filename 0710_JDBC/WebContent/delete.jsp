<%@page import="com.ict.edu.DAO"%>
<%@page import="com.ict.edu.VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
	// 넘어온 정보 삭제를 위해 세션에 저장된 primarykey를 호출해서 저장한다.
	VO vo=(VO)session.getAttribute("vo");
	int result = DAO.getInstance().getDelete(vo.getIdx());
	pageContext.setAttribute("result", result);
%>

<c:choose>
	<c:when test="${result>0}">
		<script>
			alert("삭제성공");
			location.href="onelist.jsp";
		</script>
	</c:when>
	<c:otherwise>
	
	</c:otherwise>
</c:choose>