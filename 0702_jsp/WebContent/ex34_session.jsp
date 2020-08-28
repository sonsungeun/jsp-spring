<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	// id와 pw가 같으면 로그인 성공
	if(id.equals(pw)){
		session.setAttribute("id", id);
		session.setAttribute("log", "ok");
	}else{
		session.setAttribute("log", "no");
	}
	/* sendRedirect를 사용하면 request 정보는 사라지고 session 정보는 남는다. */
	// response하면 id, log는 남아있지만(session값) id와 pw는 날아감(request.parameter)
	response.sendRedirect("ex35_session.jsp");
%>
