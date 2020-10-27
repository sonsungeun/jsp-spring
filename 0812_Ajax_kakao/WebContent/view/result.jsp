<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#res").empty();
		$.ajax({
			url : "/MyMember",
			method :"post",
			dataType : "json",
			success : function (data) {
				var name = "";
				var email = "";
				$.each(data,function(k,v){
					var response = v['profile'];
					$.each(response, function(k,v){
						name = response['nickname'];
					});
					email = v['email']
				});
				$("#res").append(email+"("+name+")님 환영합니다.")
			},
			error:function(){
				alert("읽기실패");
			}
		});
	});
</script>
</head>
<body>
	<h1> 결과보기 </h1>
	<div id="res"></div>
</body>
</html>