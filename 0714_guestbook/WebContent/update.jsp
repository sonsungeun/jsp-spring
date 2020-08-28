<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	a { text-decoration: none;}
	table{width: 500px; border-collapse:collapse; }
	table,tr,td{border: 1px solid black; padding: 3px}
</style>
<script type="text/javascript">
function update_ok(f) {
	// 비밀번호 체크하기
	if(f.pwd.value == "${vo.pwd}"){
		f.action="update_ok.jsp";
		f.submit();			
	}else {
		alert("비밀번호가 틀립니다.\n다시 입력해주세요");
		f.pwd.value="";
		f.pwd.focus();
		return;
	}
}
</script>
</head>
<body>
	<div align="center">
		<h2>방명록 : 수정화면</h2>
		<hr />
		<p>[<a href="list.jsp">목록으로 이동</a>]</p>
		<form method="post">
			<table>
				<tr align="center">
					<td bgcolor="#99ccff">작성자</td>
					<td><input type="text" value="${vo.name }" name="name"></td>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">제  목</td>
					<td><input type="text" value="${vo.subject }" name="subject"></td>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">email</td>
					<td><input type="text" value="${vo.email }" name="email"></td>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">비밀번호</td>
					<td><input type="password" name="pwd"></td>
				</tr>
				<tr align="left">
					<td colspan="2">
						<textarea rows="10" cols="60" name="content">${vo.content }</textarea>
					</td>
				</tr>
				
					<tr align="center">
						<td colspan="2">
							<input type="button" value="수정하기" onclick="update_ok(this.form)" />
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="hidden" name="idx" value="${vo.idx}">
						</td>
					</tr>
				
			</table>
		</form>
	</div>

</body>
</html>