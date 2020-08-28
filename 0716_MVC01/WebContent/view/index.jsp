<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	// 클라이언트가 요청을 하면 무조건 컨트롤러로 가야한다.
	// 여기서 컨트롤러란 Servlet이 담당을 하고 있다.
	// 여러개의 요청을 하나의 컨트롤러가 반응 할 수도 있고
	// 요청에 맞춰서 컨트롤러를 여러개 만들어서 반응 할 수도 있다.
	
	// 요청과 컨트롤러를 1:1 매칭하자
	function test1() {
		location.href="/0716_MVC01/HiController";
	}
	function test2() {
		location.href="/0716_MVC01/HelloController";
	}
	function test3() {
		location.href="/0716_MVC01/ByeController";
	}
	function send_go1(f) {
		f.action="/0716_MVC01/HiController";
		f.submit();
	}
	function send_go2(f) {
		f.action="/0716_MVC01/HelloController";
		f.submit();
	}
	function send_go3(f) {
		f.action="/0716_MVC01/ByeController";
		f.submit();
	}
</script>
</head>
<body>
	<button onclick="test1()">Hi</button>
	<button onclick="test2()">Hello</button>
	<button onclick="test3()">Bye</button>
	<hr>
	<form action="">
		<input type="button" value="Hi" onclick="send_go1(this.form)">
		<input type="button" value="Hello" onclick="send_go2(this.form)">
		<input type="button" value="Bye" onclick="send_go3(this.form)">
	</form>
</body>
</html>