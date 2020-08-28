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
			$("#out").empty();
			var table ="<table><thead><tr><th>제품명</th><th>가격</th></tr></thead>";
			table+="<tbody>";
			$.get("data03.xml",function(data) {
				$(data).find("product").each(function(){
					var name=$(this).text();
					var price=$(this).attr("price");
					table+="<tr><td>"+name+"</td><td>"+price+"</td></tr>";
				});
				table+="</tbody></table>";
				$("#out").append(table)
			})
			
		})
	});
</script>
<style type="text/css">
	table {
		width: 600px;
		margin:50px;
		border-collapse: collapse;
	}
	table,th,td{
		border: 1px solid red;
		text-align: center;
	}
</style>
</head>
<body>
<div id="btn1">xml 파일가져오기</div>
<div id="out"></div>

</body>
</html>