<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	div{text-align: center ; margin: 0px auto;}
	table{width: 500px; margin: 0px auto; border-collapse: collapse;}
	table, tr, th, td {border: 1px solid red;}
	fieldset { width: 300px;}
</style>
<script type="text/javascript">
	function list_go() {
		location.href = "list.jsp";
	}
	function update_go() {
		location.href = "update.jsp";
	}
	function delete_go() {
		location.href = "delete.jsp";
	}
</script>
</head>
<body>
	<div>
		<h1> 개인 회원 정보 </h1>
		<table>
			<thead>
				<tr>
					<th>IDX</th><th>M_ID</th><th>M_PW</th>
					<th>M_NAME</th><th>M_AGE</th><th>M_REG</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${vo.idx }</td><td>${vo.m_id }</td><td>${vo.m_pw }</td>
					<td>${vo.m_name }</td><td>${vo.m_age}</td><td>${vo.m_reg.substring(0,10)}</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="6">
						<button onclick="list_go()">전체 리스트 보기</button>
						<button onclick="update_go()">내 정보 수정</button>
						<button onclick="delete_go()">회원탈퇴</button>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</body>
</html>