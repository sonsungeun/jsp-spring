<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	a { text-decoration: none;}
	table{width: 500px; border-collapse:collapse; text-align: center;}
	table,th,td{border: 1px solid black; padding: 3px}
</style>
<script type="text/javascript">
	function delete_ok(f) {
		if(f.pwd.value=="${vo.pwd}"){
			var chk=confirm("정말삭제하시겠습니까?");
			if(chk){
				f.action="/0717_MVC04_guestbook/MyController?cmd=deleteok";
				f.submit();
			}else {
				f.action="/0717_MVC04_guestbook/MyController?cmd=delete";
				f.submit();
			}
		}else{
			alert("잘못입력하셨습니다.\n비밀번호를  다시입력해주세요");
			f.pwd.value="";
			f.pwd.focus();
			return;
		}
	}
</script>
</head>
<body>
	<div align="center">
		<h2>방명록 : 내용화면</h2>
		<hr />
		<p>[<a href="/0717_MVC04_guestbook/MyController?cmd=list">목록으로 이동</a>]</p>
		<form method="post">
			<table>
					<tr align="center">
					<td bgcolor="#99ccff">비밀번호</td>
					<td><input type="password" name="pwd"></td>
				</tr>
				<tfoot>
					<tr align="left">
						<td colspan="2">
							<input type="button" value="삭제" onclick="delete_ok(this.form)" />
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>