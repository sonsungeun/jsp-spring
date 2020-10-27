<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* { font-size: 15px;}
table {
	margin: 10px auto;
	width: 800px;
	border-collapse: collapse;
	border-color: navy;
}

table, th, td {
	border: 1px solid black;
}
</style>
<script type="text/javascript">
	function edit_go(f) {
		f.action = "/MyController?cmd=edit"
		f.submit(); 
	}
	function del_go(f) {
		f.action = "/MyController?cmd=del"
		f.submit();
	}
</script>
</head>
<body>
	<jsp:include page="top.jsp" />
	<hr>
		<h2>장바구니 내용</h2>
	<table>
		<thead>
			<tr bgcolor="#dedede">
				<th style="padding: 10px; width: 10%" >제품번호</th>
				<th style="width: 15%">제품명</th>
				<th style="width: 25%">단가</th>
				<th style="width: 15%">수량</th>
				<th style="width: 10%">금액</th>
				<th style="width: 10%">삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty clist}">
					<tr>
						<td colspan="6"><h3> 장바구니가 비었습니다.</h3></td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="k" items="${clist}">
						<tr>
							<td style="padding: 10px;">${k.p_num}</td>
							<td style="width: 20px;">${k.p_name}</td>
							<td>정가 : ${k.p_price} &nbsp;&nbsp;
							  <%--   <font color="red">(세일가격 : ${k.p_saleprice })</font> --%>
							</td>
							<td>
								<form method="post" action="/MyController?cmd=editcount">
									<input type="number" name="p_su" value="${k.p_su}" size="1">
									<input type="hidden" name="p_num" value="${k.p_num}">								
									<input type="hidden" name="id" value="${k.id}">	
									<input type="submit" value="수정">							
								</form>
							</td>
							<td>
								${k.p_price * k.p_su }
							</td>
							<td>
								<button onclick="location.href='/MyController?cmd=delproduct&p_num=${k.p_num}&id=${k.id}'"> 삭제 </button>
							</td>
						</tr>	
						<c:set var="cartTotal" value="${cartTotal = cartTotal+(k.p_price * k.p_su)}" ></c:set>					
					</c:forEach>
				</c:otherwise>
			</c:choose>	
		</tbody>
		<tfoot>
			<tr>
				
				<td colspan="6" align="right" style="padding: 10px 50px">총 결재액 : ${cartTotal} </td>
			</tr>
		</tfoot>
	</table>

</body>
</html>