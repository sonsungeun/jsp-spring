<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#btn1").click(function() {
			//.load(url,data,callback)
			$("#res1").load("data01.jsp")
		})
		$("#btn2").click(function() {
			//.load(url,data,callback)
			$("#res2").load("data02.jsp")
		})
		$("#menu").on("mouseover",function() {
			$("#output").load("data03.jsp")
		})
		$("#menu").on("mouseout",function() {
			$("#output").empty()
		})
	});
	
</script>
</head>
<body>
	<div>
		<h2>iframe활용</h2>
		<iframe src="data01.jsp" style="width: 80%; height: 50%;"></iframe>
	</div>
	<hr>
	<div>
		<h2>include활용</h2>
		<jsp:include page="data01.jsp" />
	</div>
	<hr>
	<div>
		<h2>jQuery활용</h2>
		<p id="res1"></p>
		<button id="btn1">가져오기</button>
	</div>
	<hr>
	<div>
		<h2>jQuery활용</h2>
		<p id="res2"></p>
		<button id="btn2">가져오기</button>
	</div>
	<hr>
	<div>
		<p id="menu">메뉴보기</p>
		<span id="output"></span>
	</div>

</body>
</html>