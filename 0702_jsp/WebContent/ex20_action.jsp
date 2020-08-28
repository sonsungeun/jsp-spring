<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션 태그 : include</title>
</head>
<body>
	<%--
		액션태그 : jsp 페이지 간에 흐름제어, 자바 빈즈 컴포넌트 지원
		사용법 : <jsp:액션명령></액션명령>,<jsp:액션명령/>
	--%>
	<%-- 1. include : 현재 페이지에서 다른 페이지 내용을 보여주는 것 
			종류 : include 액션, include 지시어
			
			1) include액션 : 제어권이 다른 페이지에게 가서 처리하고 결과만 가져온다.
					<jsp:include page="가져올 페이지" />
					<jsp:include page="가져올 페이지">
						<jsp:param value="" name="">
					</jsp:include>
			2) include 지시어 : 다른 페이지의 소스 전체를 가져와서 현재 페이지에서 한번에 처리하는 것 
					<%@ include file=""%>
	--%>
	<h2>include 액션</h2>
	<hr>
	<jsp:include page="ex07_response.jsp" />
	<hr>
	<h2>include 액션</h2>
	<hr>
	<%-- ex08.jsp는 id와 pw를 받아서 처리하는 페이지이므로 
		include액션에서 파라미터 값을 줄 수 있다.
		ex08.jsp에서 한글 처리 했지만 한글이 깨진다.
		그래서 해당 페이지에서도 한글 처리를 해야한다. 
	 --%>
	<%request.setCharacterEncoding("utf-8"); %>
	<%-- 액션 : 가지고 온 페이지에서 만든 변수를 사용할 수 없다. --%>
	<jsp:include page="ex08.jsp">
		<jsp:param value="태권브이" name="id"/>
		<jsp:param value="1234" name="pw"/>
	</jsp:include>
	<hr>
	<%-- <h2>주소 : <%=addr %></h2> --%>
	<%-- include 지시어 : 파라미터값 전달 안됨  --%>
	<h2>include 지시어</h2>
	<%@ include file="ex07_response.jsp" %>
	<hr>
	<%@ include file="ex08.jsp" %>
	<hr>
	<%-- 차이점 : 파라미터 전달방법 없음 --%>
	<%-- <%@ include file="ex08.jsp?id=hong&pw=1111" %> --%>
	<%-- 지시어 : 가지고 온 페이지에서 만든 변수를 사용할 수 있다. --%>
	<h2>주소 : <%=addr %></h2>
</body>
</html>