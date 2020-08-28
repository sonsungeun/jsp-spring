<%@page import="com.ict.edu.DAO"%>
<%@page import="com.ict.edu.VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 방 명 록 </title>
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
		}else{
			alert("비밀번호가 틀립니다.\n다시 입력해 주세요");
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
		<form method="post" enctype="multipart/form-data">
			<table>
				<tr align="center">
					<td bgcolor="#99ccff">작성자</td>
					<td><input type="text" name="name" size="20" value="${vo.name}"></td>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">제  목</td>
					<td><input type="text" name="subject" size="20" value="${vo.subject}"></td>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">email</td>
					<td><input type="text" name="email" size="20" value="${vo.email}"></td>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">첨부파일</td>
					<%-- 보안때문에 input type="file" 는 value를 사용 못함 --%>
					<td><input type="file" name="file_name" size="20" > ${vo.file_name} </td>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">비밀번호</td>
					<td><input type="password" name="pwd" size="20"></td>
				</tr>
				<tr align="left">
					<td colspan="2" style="padding-left:50px;">
						<textarea rows="8" cols="60" name="content">${vo.content}</textarea></td>
				</tr>
				<tfoot>
					<tr align="center">
						<td colspan="2">
							<input type="button" value="수정하기" onclick="update_ok(this.form)" />
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="hidden" name="idx" value="${vo.idx}">
							<%-- 수정시 파일을 업로드 하지 않을 것을 대비 --%>
							<input type="hidden" name="f_name" value="${vo.file_name}">
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>