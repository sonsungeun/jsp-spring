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
		$("#btn").click(function() {
			$("#out").empty();
			var table = "<table>";
			table += "<thead><tr><th>종류</th><th>가격</th></tr></thead>";
			table += "<tbody>";
			
			// jQuery에서 xml 가져오는 메소드 : get(xml, html, txt)
			$.get("data01.xml", function(data){
				// 태그찾는방법
				// javascript에서는 getElementsByTagName("")
				// jQuery에서는 find("")
				// .each(function(){}) => 반복문 처리
				$(data).find("product").each(function() {
					var name = $(this).find("name").text();
					var price = $(this).find("price").text();
					table += "<tr><td>"+name+"</td><td>"+price+"</td></tr>";
				})
			table += "</tbody></table>";
			$("#out").append(table)
			});

		})
	});
</script>
<style type="text/css">
	table {
	width: 600px;
	margin: 50px;
	border-collapse: collapse;
	}
	table,th,td{
	border: 1px solid red;
	text-align: center;
	}
</style>
</head>
<body>
	<div id="btn">xml 파일 가져오기</div>
	<div id="out"></div>
</body>
</html>