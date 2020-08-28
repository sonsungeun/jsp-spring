<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
tr {
	text-align: center;
	padding: 4px 10px;
	background-color: #F6F6F6;
}

th {
	width: 120px;
	text-align: center;
	padding: 4px 10px;
	background-color: #B2CCFF;
}
</style>
<script type="text/javascript">
	function sendData(f) {
		// 비밀번호 체크
		if ("${vo.pwd}"==f.pwd.value) {
			f.action = "/MyController?cmd=update_ok";
			f.submit();			
		}else {
			alert("비밀번호 틀림\n다시입력해주세요");
			f.pwd.value="";
			f.pwd.focus();
			return;
		}
	}
	function list_go(f) {
		f.action="/MyController?cmd=list";
		f.submit();
	}
</script>
</head>
<body>
	<h2 style="text-align: center;">BOARD 글수정</h2>
	<form method="post" enctype="multipart/form-data">
		<table width="700">
			<tbody>
				<tr>
					<th>작성자</th>
					<td align="left"><input type="text" name="writer" value="${vo.writer}" > </td>
				</tr>
				<tr>
					<th>제목</th>
					<td align="left"><input type="text" name="title" value="${vo.title}"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><script
							src="https://cdn.ckeditor.com/4.14.1/standard/ckeditor.js"></script>
						<textarea name="content">${vo.content}</textarea> <script>
							CKEDITOR.replace('content');
						</script></td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td align="left"><input type="file" name="file_name">${vo.file_name}</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td align="left"><input type="password" name="pwd"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="수정"	onclick="sendData(this.form)" /> 
						<input type="button" value="목록"	onclick="list_go(this.form)" /> 
						<input type="reset" value="취소" />
						<input type="hidden" value="${cPage}" name="cPage"></td>
						<input type="hidden" value="${vo.idx}" name="idx"></td>
						<input type="hidden" value="${vo.file_name}" name="f_name">
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>