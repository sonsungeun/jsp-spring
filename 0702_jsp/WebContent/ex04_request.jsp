<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 내장 객체 : request</title>
</head>
<body>
<%--
	1. request :웹 프로그래밍에서 가장 많이 사용되는 객체
	         클라이언트가 요청한 정보를 담고 있는 객체
	         ** 파라미터값을 가지고 있다.
	         ** request의 생명주기 response가 이루어지면 끝난다.
	         
	2. request가 가지고 있는 정보들
	 - 클라이언트의 정보 및 서버 정보를 얻을 수 있는 메소드 제공
	 - html form 정보와 요청 파라미터의 정보를 제공
	 - 요청 헤드의 정보 제공
	 
	3. 클라이언트의 정보 및 서버 정보를 얻을 수 있는 메소드 
	  1) getRemoteAddr()           2) getContentLength()
	  3) getCharacterEncoding()    4) getContentType()
      5) getProtocol()             6) getMethod()
	  7) getRequestURI()           8) getContentPath()
	  9) getServerName()          10) getServerPort()
	  
	**4. html폼과 요청 파라미터의 정보를 제공하는 메소드  
	  1) getParameter(String name) : String
	  2) getParameterValues(String name) : String[]
	  3) getParameterMap() : Map
	  4) getParameterNames() : Enumeration
	   
	5. 요청 헤드의 정보를 제공하는 메소드 
	  1) getHeader(String name) : 헤더값 구하기 
	  2) getHeaders(Enumeration) : 헤더 목록 구하기
	  3) getHeaderNames() : 헤더 이름 구하기
	  4) getIntHeader(String name) : 헤더값을 정수값으로 구하기 
	  5) getDateHeader(String name) : 헤더값을 시간값으로 구하기 
	  
	**6. 다른 주요 메소드 
	  1) 포워딩 : request.getRequestDispatcher("이동장소").forward(request,response);
	  2) session 호출 : request.getSession();
	  3) request 속성을 통한 데이터(값) 저장 : request.setAttribute("이름",데이터);	
	  4) request 속성을 통한 저장된 데이터 호출 : request.getAttribute("이름");          
 --%>
 	<h2> request : 클라이언트 및 서버 정보 보기 </h2>
 	<h3>
 		<ul>
 			<li> 클라이언트 IP 			: <%=request.getRemoteAddr() %> </li>
 			<li> 요청 정보 길이 		: <%=request.getContentLength() %> </li>
 			<li> 요청 정보 인코딩 		: <%=request.getCharacterEncoding() %> </li>
 			<li> 요청 정보 컨텐츠 타입	: <%=request.getContentType() %> </li>
 			<li> 요청 정보 프로토콜 	: <%=request.getProtocol() %> </li>
 			<li> 요청 정보 전송 방식	: <%=request.getMethod() %> </li>
 			<li> 요청 URI 				: <%=request.getRequestURI() %> </li>
 			<li> 컨텍스트 경로			: <%=request.getContextPath() %> </li>
 			<li> 컨텍스트 정보  		: <%=request.getServletContext() %> </li>
 			<li> 서버 이름 				: <%=request.getServerName() %> </li>
 			<li> 서버 포트 				: <%=request.getServerPort() %> </li>
 		</ul>
 	</h3> 
</body>
</html>










