<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
	*{margin: 0 auto;}
	h2{text-align: center;}
	table{
		width: 60%;
		border-collapse: collapse;
	}
	table,th,td{
	border: 1px solid blue;
	text-align: center;
	}
</style>
<script type="text/javascript">
$(function() {
	$("#btn1").click(function() {
		$("#output").empty();
		$.ajax({
			url:"/MyController01",
			dataType:"xml",
			type:"get",
			success:function(data){
				var year=$(data).find("weather").attr("year");
				var month=$(data).find("weather").attr("month");
				var day=$(data).find("weather").attr("day");
				var hour=$(data).find("weather").attr("hour");
				$("#output").append("<h2>"+year+"년 "+month+"월 "+day+"일 "+hour+"시의 지역별 기상정보</h2>");
				var msg = "";
				msg +="<table><thead><tr><th>지역</th><th>기상상태</th><tr></thead>";
				msg +="<tbody>";
				$(data).find("local").each(function(){
					var si=$(this).text();
					var nalsi=$(this).attr("desc");
					var degree=$(this).attr("ta");
					var rn_hr=$(this).attr("rn_hr1");
					var icon=$(this).attr("icon");
					msg+="<tr><td>"+si+"시</td><td>"+nalsi+"( <img src='http://www.kma.go.kr/images/icon/NW/NB"+icon+".png'> ),   온도 : "+degree+"도,    시간당 강수량 : "+rn_hr+"mm</td></tr>";
				});
				msg+="</tbody></table>";
				$("#output").append(msg);
			},
			error:function(){
				alert("읽기실패");
			},
		});
	});
	
	$("#btn2").click(function() {
		$("#output").empty();
		$.ajax({
			url:"/MyController02",
			dataType:"json",
			type:"get",
			success:function(data){
				var msg = "";
				msg +="<table><thead><tr><th>도서관이름</th><th>주소</th><th>휴관일</th><th>전화번호</th><tr></thead>";
				msg +="<tbody>";
				$.each(data,function(k,v) {
					$.each(v["row"],function(data){
						msg+="<tr>";
						msg+="<td>"+this["LBRRY_NAME"]+"</td>";
						msg+="<td>"+this["ADRES"]+"</td>";
						msg+="<td>"+this["FDRM_CLOSE_DATE"]+"</td>";
						msg+="<td>"+this["TEL_NO"]+"</td>";
						msg+="</tr>";
					})
				})
				msg +="</tbody></table>";
				$("#output").append(msg);
				
			},
			error:function(){
				alert("읽기실패");
			},
		});
	});
});
</script>
</head>
<body>
	<div>
		<button id="btn1">XML 파일 가져오기</button>
		<button id="btn2">JSON 파일 가져오기</button>
	</div>
	<br>
	<hr>
	<br>
	<div id="output">
	<table id="mytable">

	</table>
	</div>
</body>
</html>