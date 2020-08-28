<%@page import="com.ict.edu.VO"%>
<%@page import="com.ict.edu.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%	
	request.setCharacterEncoding("utf-8");
	String m_name=request.getParameter("m_name");
	String m_age=request.getParameter("m_age");
	VO vo = (VO)session.getAttribute("vo");
	int result =DAO.getInstance().getUpdate(vo.getIdx(),m_name, m_age);
	pageContext.setAttribute("result", result);
	
	// 기존 세션의 정보를 update함 
	vo.setM_name(m_name);
	vo.setM_age(m_age);
	// 같은이름이 있으면 덮어쓰기가 된다.
	session.setAttribute("vo", vo);
%>

<c:choose>
	<c:when test="${result>0}">
		<script>
			alert("갱신 성공");
			location.href="onelist.jsp";
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("갱신 실패");
			history.go(-1);
		</script>
		
	</c:otherwise>
</c:choose>