<%@page import="com.ict.edu.VO"%>
<%@page import="com.ict.edu.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	VO vo = new VO();
	vo.setName(request.getParameter("name"));
	vo.setEmail(request.getParameter("email"));
	vo.setSubject(request.getParameter("subject"));
	vo.setContent(request.getParameter("content"));
	vo.setIdx(request.getParameter("idx"));
	int result=DAO.getInstance().getUpdate(vo);
	pageContext.setAttribute("result", result);
	
	
%>
<jsp:forward page="onelist.jsp?idx=${vo.idx}"></jsp:forward>