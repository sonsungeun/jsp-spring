<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>file up / down</title>
<script type="text/javascript">
	function send_go(f) {
		f.action="ex02.jsp";
		f.submit();
	}
</script>
</head>
<body>
<%--
	1. http://www.servlets.com/ => 라이브러리 다운로드
	   압축 해제 후 lib->cos.jar를 프로젝트 WEB-INF-lib에 넣어준다.
	2. 프로젝트 안에 파일을 저장할 폴더 생성   
	3. 반드시 <form method="post" enctype="multipart/form-data"> 설정
 --%>
 	<form method="post" enctype="multipart/form-data">
 		<p>올린사람 : <input type="text" name="name"></p>
 		<p>첨부파일 : <input type="file" name="file_name"></p>
 		<input type="button" value="업로드" onclick="send_go(this.form)">
 		<input type="hidden" name="age" value="34">
 	</form>
</body>
</html>








