<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function updateData(f) {
		f.action="/MyController?cmd=update";
		f.submit();
	}
	function deleteData(f) {
		f.action="/MyController?cmd=delete";
		f.submit();
	}
	function send_CData(f) {
		f.action="/MyController?cmd=insertclist";
		f.submit();
	}
	function c_delete(f) {
		f.action="/MyController?cmd=deleteCData";
		f.submit();
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
	
	.cbs{
		border: 1px solid blue;
		width: 60%;
		margin: 0px auto;
		padding: 5px 20px;
	}
</style>
</head>
<body>
	<div id="bbs">
	<form method="post" encType="multipart/form-data">
		<table summary="게시판 글쓰기">
			<caption>게시판 내용보기</caption>
			<tbody>
				<tr>
					<th>제목:</th>
					<td>${bvo.subject}</td>
				</tr>
				<tr>
					<th>첨부파일:</th>
						<c:choose>
							<c:when test="${empty bvo.file_name}">
								<td><b> 첨부파일 없음 </b></td>
							</c:when>
							<c:otherwise>
								<td>
									<img alt="" src="upload/${bvo.file_name}" style="width: 100px"><br>
									<a href="view/download.jsp?path=upload&file_name=${bvo.file_name}">${bvo.file_name}</a>
								</td>
							</c:otherwise>
						</c:choose>
				</tr>
				<tr>
					<th>이름:</th>
					<td>${bvo.writer}</td>
				</tr>
				<tr>
					<th>내용:</th>
					<td>
						 <script src="https://cdn.ckeditor.com/4.14.1/standard/ckeditor.js"></script>
						 <textarea name="content" readonly><pre>${bvo.content}</pre></textarea>
						 <script>
                        	CKEDITOR.replace('content');
                		 </script>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="수정" onclick="updateData(this.form)"/>
						<input type="reset" value="삭제" onclick="deleteData(this.form)"/>
						<input type="button" value="목록" onclick="javascript:location.href='/MyController?cmd=list'"/>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	</div>
	<br>
	<hr>
	<br>
	<%-- 댓글처리 --%>
	<div id="cbs">
		<form method="post">
			<p>이름 : <input type="text" name="writer" size="15"></p>
			<p>내용 : <br>
				<textarea rows="10" cols="60" name="content"></textarea>
			</p>
			<p>비밀번호 : <input type="password" name="pwd" size="15"></p>
			<input type="button" onclick="send_CData(this.form)" value="저장하기">
			<input type="hidden" value="${bvo.b_idx}" name="b_idx">
		</form>
	</div>
	<br>
	<hr>
	<%-- 댓글 출력 --%>
	<div style="display: table; margin-left: 100px; ">
		<c:forEach var="k" items="${clist}">
			<div style="border: 1px solid #cc00cc; width: 400px; margin: 20px; padding: 20px;">
				<form method="post" >
					<p>이름 : ${k.writer} </p>	
					<p>날짜 : ${k.write_date.substring(0,10)} </p>
					<p>내용 : <pre>${k.content}</pre></p>
					<input type="button" value="댓글삭제" onclick="c_delete(this.form)">
					<input type="hidden" name="c_idx" value="${k.c_idx}">
					<input type="hidden" name="b_idx" value="${k.b_idx }">
					<input type="hidden" value="${cPage}" name="cPage">
				</form>
			</div>
			<hr>
		</c:forEach>
	</div>
</body>
</html>

