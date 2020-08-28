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
	function update_ok(f) {
		f.action="update_ok.jsp";
		f.submit();
	}
</script>
</head>
<body>
	<div>
		<h1> 내 정보 수정 </h1>
		<form method="post">
		<table>
			<thead>
				<tr>
					<th>IDX</th><th>M_ID</th><th>M_PW</th>
					<th>M_NAME</th><th>M_AGE</th><th>M_REG</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${vo.idx }</td>
					<td>${vo.m_id }</td>
					<td>${vo.m_pw }</td>
					<td><input type="text" name="m_name" value="${vo.m_name}" size="10"> </td>
					<td><input type="number" name="m_age" value="${vo.m_age}" size="10"></td>
					<td>${vo.m_reg.substring(0,10)}</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="6">
						<input type="button" value="내 정보 수정" onclick="update_ok(this.form)"></input>
					</td>
				</tr>
			</tfoot>
		</table>
		</form>
	</div>
	
</body>
</html>