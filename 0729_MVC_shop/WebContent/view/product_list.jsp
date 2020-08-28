<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {font-size: 15px;}
table {
	margin: 10px auto;
	width: 600;
	border-collapse: collapse;
	font-size: 8pt;
	border-color: navy;
}

table, th, td {
	border: 1px solid black;
	text-align: center;
}
</style>
</head>
<body>
	
			<!-- include : 현재 페이지에서 다른 페이지를 가져오기 -->
			<jsp:include page="top.jsp" />
			<%-- <%@ include file="top.jsp" %> --%>
			<hr>
			<table>
				<thead>
					<tr bgcolor="#dedede">
						<th width="10%">제품번호</th>
						<th width="20%">이미지</th>
						<th width="25%">제품명</th>
						<th width="25%">제품가격</th>
						<th width="20%">비고</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty list}">
							<tr>
								<td colspan="5"><h2> 제품 준비중 입니다 </h2></td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="k" items="${list }">
							<tr>
								<td>${k.p_num }</td>
								<td><img src="../images/${k.p_image_s}" width="100" height="95"></td>
								<td><a href="/MyController?cmd=content&idx=${k.idx}">${k.p_name} </a></td>
								<td>할인가 : <fmt:formatNumber value="${k.p_saleprice}" pattern="#,##0" />원  
									<font color="red">(${k.getPercent()}%)</font>
								</td>
								<td>시중 가격 : <fmt:formatNumber value="${k.p_price}" pattern="#,##0" />원</td>
							</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					
				</tbody>
			</table>

	
</body>
</html>