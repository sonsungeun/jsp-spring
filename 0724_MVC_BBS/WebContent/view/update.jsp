<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function update_ok(f) {
		if (f.pwd.value==${bvo.pwd}) {
			f.action="/MyController?cmd=update_ok";
			f.submit();
		}else {
			alert("비밀번호가 일치하지 않습니다.");
			f.pwd.value="";
			f.pwd.focus();
		}
	}
</script>
<style type="text/css">
	#bbs table {
	    width:580px;
	    margin:0 auto;
	    margin-top:20px;
	    border:1px solid black;
	    border-collapse:collapse;
	    font-size:14px;
	    
	}
	
	#bbs table caption {
	    font-size:20px;
	    font-weight:bold;
	    margin-bottom:10px;
	}
	
	#bbs table th {
	    text-align:center;
	    border:1px solid black;
	    padding:4px 10px;
	}
	
	#bbs table td {
	    text-align:left;
	    border:1px solid black;
	    padding:4px 10px;
	}
	
	.no {width:15%}
	.subject {width:30%}
	.writer {width:20%}
	.reg {width:20%}
	.hit {width:15%}
	.title{background:lightsteelblue}
	.odd {background:silver}
</style>
</head>
<body>
	<div id="bbs">
	<form method="post" encType="multipart/form-data">
		<table summary="게시판 글쓰기">
			<caption>게시판 수정</caption>
			<tbody>
				<tr>
					<th>제목:</th>
					<td><input type="text" name="subject" size="45" value="${bvo.subject}"/></td>
				</tr>
				<tr>
					<th>이름:</th>
					<td><input type="text" name="writer" size="12" value="${bvo.writer}"/></td>
				</tr>
				<tr>
					<th>내용:</th>
					<td>
						 <script src="https://cdn.ckeditor.com/4.14.1/standard/ckeditor.js"></script>
						 <textarea name="content">${bvo.content}</textarea>
                		 <script>
                        	CKEDITOR.replace('content');
                		</script>
					</td>
				</tr>
				<tr>
					<th>첨부파일:</th>
					<td><input type="file" name="file_name"/>${bvo.file_name}</td>
				</tr>
				<tr>
					<th>비밀번호:</th>
					<td><input type="password" name="pwd" size="12"/></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="수정하기" onclick="update_ok(this.form)"/>
						<input type="reset" value="다시"/>
						<input type="button" value="목록" onclick="javascript:location.href='/MyController?cmd=list'"/>
						<input type="hidden" value="${bvo.file_name}" name="f_name">
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	</div>
</body>
</html>

