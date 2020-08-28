<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String addr = "서울특별시 서교동 홍대입구";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파라미터 받기</title>
<script type="text/javascript">
	function send_go(f) {
		f.action="ex09.jsp";
		f.submit();
	}
	function send_go2(f) {
		f.action="ex09.jsp";
		f.submit();
	}
	function send_go3() {
		location.href="ex09.jsp";
	}
	function send_go4() {
		location.href="ex09.jsp?id=<%=id%>&pw=<%=pw%>";
	}
	function send_go5() {
		// 뒤로가기
		history.go(-1);
	}
</script>
</head>
<body>
	<h1> 파라미터 결과 보기 (ex08.jsp)</h1>
	<h2> 
		<li>id : <%=id %></li>
		<li>pw : <%=pw %></li>
	</h2>
	<%-- 다른 페이지로 이동하기 --%>
	<!-- 1. response.sendRedirect("이동할 페이지"); -->
	<%-- <% response.sendRedirect("ex09.jsp"); %> --%>
	
	<!-- 2. request.getRequestDispather("이동할 페이지").forward(request,response);	 -->
	<%-- <% request.getRequestDispatcher("ex09.jsp").forward(request, response); %> --%>
	
	<!-- 다른페이지로 이동하기(중간페이지에서 이벤트 처리) -->
	<!-- 3. a 링크 이동 -->
	<%-- 	<a href="ex09.jsp">다른페이지로 이동(파라미터 없음)</a><br>
	<a href="ex09.jsp?id=<%=id%>&pw=<%=pw%>">다른페이지로 이동(파라미터 있음)</a>
	 --%>
	 <!-- 4. 자바스크립트를 이용한 페이지 이동 -->
 	<form method="post">
 		<input type="button" value="보내기(파라미터 없음)" onclick="send_go(this.form)">
 	</form method="post">
 	<form>
 		<input type="button" value="보내기(파라미터 있음)" onclick="send_go2(this.form)">
 		<input type="hidden" name="id" value="<%=id%>">
 		<input type="hidden" name="pw" value="<%=pw%>">
 	</form>
 	
 	<button onclick="send_go3()">보내기(파라미터 없음)</button>
 	<button onclick="send_go4()">보내기(파라미터 있음)</button>
 	<button onclick="send_go5()">뒤로가기</button>
 	
 </body>
</html>