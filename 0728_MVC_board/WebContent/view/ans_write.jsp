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
		for (var i = 0; i < f.elements.length; i++) {
			if (f.elements[i].value == "") {
				if (i == 3 || i == 2)
					continue;
				alert(f.elements[i].name + "를 입력하세요");
				f.elements[i].focus();
				return;//수행 중단
			}
		}
		f.action = "/MyController?cmd=ans_write_ok";
		f.submit();
	}
	function list_go(f) {
		f.action="/MyController?cmd=list";
		f.submit();
	}
</script>
</head>
<body>
	<h2 style="text-align: center;">BOARD 댓글쓰기</h2>
	<form method="post" enctype="multipart/form-data">
		<table width="700">
			<tbody>
				<tr>
					<th>작성자</th>
					<td align="left"><input type="text" name="writer"></td>
				</tr>
				<tr>
					<th>제목</th>
					<td align="left"><input type="text" name="title"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><script
							src="https://cdn.ckeditor.com/4.14.1/standard/ckeditor.js"></script>
						<textarea name="content"></textarea> <script>
							CKEDITOR.replace('content');
						</script></td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td align="left"><input type="file" name="file_name"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td align="left"><input type="password" name="pwd"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="댓글입력" onclick="sendData(this.form)" /> 
						<input type="button" value="목록" onclick="list_go(this.form)">
						<input type="reset" value="취소" />
						<input type="hidden" value="${cPage}" name="cPage">
						<!-- 댓글 처리를 위해서  -->
						<input type="hidden" value="${vo.groups}" name="groups">
						<input type="hidden" value="${vo.step}" name="step">
						<input type="hidden" value="${vo.lev}" name="lev">
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>