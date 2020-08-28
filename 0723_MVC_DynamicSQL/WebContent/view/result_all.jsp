<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>전체 결과 보기</h1>
<c:choose>
	<c:when test="${empty list}">
	<ul><li>찾는 자료가 존재하지 않습니다.</li></ul>
	</c:when>
	<c:otherwise>
		<c:forEach var="k" items="${list}" varStatus="vs">
		<table>
		<thead><tr><th></th><th></th><th></th><th></th><th></th><th></th></tr></thead>
		<tbody></tbody>
		</table>		
		
		<li>
		<b>${vs.count}</b>&nbsp;&nbsp;
		<b>${k.employee_id}</b>&nbsp;&nbsp;
		<b>${k.first_name}</b>&nbsp;&nbsp;
		<b>${k.last_name}</b>&nbsp;&nbsp;
		<b>${k.email}</b>&nbsp;&nbsp;
		<b>${k.phone_number}</b>&nbsp;&nbsp;
		<b>${k.hire_date.substring(0,10)}</b>&nbsp;&nbsp;
		<b>${k.job_id}</b>&nbsp;&nbsp;
		<b>${k.salary}</b>&nbsp;&nbsp;
		<b>${k.commission_pct}</b>&nbsp;&nbsp;
		<b>${k.manager_id}</b>&nbsp;&nbsp;
		<b>${k.department_id}</b>
		</li>
		</c:forEach>
	</c:otherwise>
</c:choose>
</body>
</html>