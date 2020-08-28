<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function update_go(f) {
		f.action="/0717_MVC04_guestbook/MyController?cmd=update";
		f.submit();
	}
	function delete_go(f) {
		f.action="/0717_MVC04_guestbook/MyController?cmd=delete";
		f.submit();
	}
</script>
<style type="text/css">
	a { text-decoration: none;}
	table{width: 500px; border-collapse:collapse; text-align: center;}
	table,th,td{border: 1px solid black; padding: 3px}
</style>

</head>
<body>
	<div align="center">
		<h2>방명록 : 내용화면</h2>
		<hr />
		<p>[<a href="/0717_MVC04_guestbook/MyController?cmd=list">목록으로 이동</a>]</p>
		<form method="post">
			<table>
				<tr align="center">
					<td bgcolor="#99ccff">작성자</td>
					<td>${vo.name}</td>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">제  목</td>
					<td>${vo.subject}</td>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">email</td>
					<td>${vo.email}</td>
				</tr>
				<tr align="left">
					<td colspan="2">
					<pre>${vo.content}</pre>	
					</td>
				</tr>
				<tfoot>
					<tr align="center">
						<td colspan="2">
							<input type="button" value="수정" onclick="update_go(this.form)" />
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="reset" value="삭제" onclick="delete_go(this.form)"/>
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>