<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그아웃
	session.invalidate();
	//장바구니에 정보가 남아있는지 확인하기
	response.sendRedirect("ex37.jsp");
	
%>