<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cookie를 이용한 로그인</title>
<script type="text/javascript">
	function send_go(f) {
		f.action="ex27_result.jsp";
		f.submit();
	}
</script>
</head>
<body>
	<form method="post">
	아이디 : <input type="text" name="id" size="10"><br>
	패스워드 : <input type="password" name="pw" size="10"><br>
	<input type="button" value="로그인" onclick="send_go(this.form)">
	</form>
</body>
</html>