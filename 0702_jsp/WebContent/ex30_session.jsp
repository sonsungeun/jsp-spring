<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session</title>
</head>
<body>
	<%--
		* session 
		 - JSP 기본 내장 객체
		 - 서버와 클라이언트 간의 접속을 유지 시켜주기 위한 객체
		 - 쿠키와 차이점은 세션은 서버에 값이 지정되고 쿠기는 클라이언트에 저장
		 - 서버는 세션을 사용해서 클라이언트 상태를 유지할 수 있기 때문에
		   로그인 한 사용자에 대한 정보를 유지할 수 있다.
		 - 세션은 서버에서만 생성된다.
		 - 쿠키는 서버에도 있고, 클라이언트에도 있다.
		 - 클라이언트측에서 서비스를 요청하면, 서버측에서 클라이언트에게
		   클라이언트을 구별할 수 있는 세션ID를 부여하고, 서버측에서
		   해당 ID로 이전 접속 여부를 구할 수 있다.  
		 - 주요 메소드
		   * session.setAttribute("이름","값") : 데이터 저장
		   * session.getAttribute("이름") : 데이터 호출 
		   * removeAttribute("이름") : 속성을 이용한 데이터 삭제
		   
		   * getId() :  세션의 고유ID를 구한다.
		   * getCreationTime() : 세션이 생성된 시간을 구한다.
		   * getLastAccessedTime() : 마지막에 접근한 시간을 구한다.
		   * invalidate() : 세션 전체 초기화
		   * setMaxInactiveInterval(시간) : 세션 시간 제한
	 --%>
	 <h1> 세션 연습 1 </h1>
	 <%
	 	Date time = new Date();
	 %>
	 <h2>
	 	<p> 세션ID : <%= session.getId() %> </p>
	 	<p> 현재시간 : <%= time %> </p>
	 	
	 	<% time.setTime(session.getCreationTime()); %>
	 	<p> 세션 생성 시간 :     <%= time %> </p>
	 	
	 	<% time.setTime(session.getLastAccessedTime()); %>
	 	<p> 세션 최근 접근시간 : <%= time  %> </p>
	 </h2>
</body>
</html>







