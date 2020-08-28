<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	width: 80%;
	margin: 0 auto;
	border-collapse: collapse;
}

table, th, td {
	border: 1px solid grey;
	text-align: center;
}

#m_id {
	width: 150px;
	color: red;
}

input {
	border: 1px solid grey;
}

h2 {
	text-align: center;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		// 리스트
		function getList() {
			$.ajax({
				url : "/MyController",
				dataType : "xml",
				type : "GET",
				success : function(data) {
					var str = "";
					$(data).find("member").each(function() {
						str += "<tr>";
						str += "<td>" + $(this).find("idx").text() + "</td>";
						str += "<td>" + $(this).find("id").text() + "</td>";
						str += "<td>" + $(this).find("pw").text() + "</td>";
						str += "<td>" + $(this).find("name").text() + "</td>";
						str += "<td>" + $(this).find("age").text() + "</td>";
						str += "<td>" + $(this).find("reg").text() + "</td>";
						str += "<td><button id='del' name='"+$(this).find("idx").text()+"'>삭제</button></td>";
						str += "</tr>";
					});
					$("#tbody").append(str);
				},
				error : function() {
					alert("읽기 실패");
				}
			});
		}

		// 아이디 중복 체크
		// data란 서버주소에 갈때 같이 넘어가는 파라미터를 말함. 
		$("#btn1").click(function() {
			$.ajax({
				url : "/MyController2",
				data : "m_id="+$("#id").val(),
				dataType : "text",
				type : "GET",
				success : function(data) {
					if (data.trim()=="사용불가") {
						alert("아이디가 중복입니다.\n 다른 아이디를 입력해주세요");
						$("#id").val("");
						$("#btn2").attr("disabled",true);	//버튼 비활성
						
					}else {
						alert("사용가능한 아이디입니다.");
						$("#btn2").attr("disabled",false);	//버튼 활성

					}
				},
				error : function() {
					alert("읽기실패");
				}
			});
			// ajax시 리로딩 금지
			return false;
		});
		
		// 회원가입( form 태그가 가지고 있는 여러개의 파라미터 정보를 전달할 때 : serialize() )
		$("#btn2").click(function() {
			$.ajax({
				url : "/MyController3",
				data : $("#myform").serialize(),
				dataType : "text",
				type : "GET",
				success : function(data) {
					// 성공
					if (data.trim()=="1") {
						alert("가입성공");
					}else { // 실패
						alert("가입실패");
					}
				},
				error : function() {
					alert("읽기실패");
				}
			});
		});
		
		// 삭제버튼 클릭 이벤트
		// 동적으로 생성된  attr은 click이벤트(및 이벤트 처리) 사용 불가 			===>> .on();사용
		//$("#del").click(function() {alert("삭제버튼을 클릭함")});
		
		$("table").on("click","#del",function(){
			$.ajax({
				url : "/MyController4",
				data : "idx="+$(this).attr("name"),
				dataType : "text",
				type : "GET",
				success : function(data) {
					// 성공
					if (data.trim()=="1") {
						alert("삭제성공");
						$("#tbody").empty();
						getList();
					}else { // 실패
						alert("삭제실패");
					}
				},
				error : function() {
					alert("읽기실패");
				}
			});
		});
		getList();

	});
</script>
</head>
<body>
	<h2>회원 정보 입력하기</h2>
	<form method="post" id="myform">
		<table>
			<thead>
				<tr>
					<th>아이디</th>
					<th>패스워드</th>
					<th>이름</th>
					<th>나이</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="text" name="m_id" id="id">
						<button id="btn1">중복확인</button></td>
					<td><input type="password" name="m_pw"></td>
					<td><input type="text" name="m_name"></td>
					<td><input type="number" name="m_age"></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4" align="center"><button id="btn2" disabled>가입하기</button></td>
				</tr>
			</tfoot>
		</table>
	</form>
	<br>
	<br>
	<br>
	<h2>회원 정보 보기</h2>
	<div>
		<table id="list">
			<thead>
				<tr>
					<th>No</th>
					<th>아이디</th>
					<th>패스워드</th>
					<th>이름</th>
					<th>나이</th>
					<th>등록날짜</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody id="tbody">

			</tbody>
			<tfoot></tfoot>
		</table>
	</div>
</body>
</html>