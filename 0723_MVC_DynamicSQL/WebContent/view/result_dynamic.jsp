<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>
		<c:choose>
			<c:when test="${idx==1}">사번</c:when>
			<c:when test="${idx==2}">이름</c:when>
			<c:when test="${idx==3}">직종</c:when>
			<c:when test="${idx==4}">부서</c:when>
		</c:choose>
		결과 보기
	</h1>
	<c:choose>
		<c:when test="${empty dy_list}">
			<ul>
				<li>찾는 자료가 존재하지 않습니다.</li>
			</ul>
		</c:when>
		<c:otherwise>
			<c:forEach var="k" items="${dy_list}" varStatus="vs">
				<li><b>${vs.count}</b>&nbsp;&nbsp; <b>${k.employee_id}</b>&nbsp;&nbsp;
					<b>${k.first_name}</b>&nbsp;&nbsp; <b>${k.last_name}</b>&nbsp;&nbsp;
					<b>${k.email}</b>&nbsp;&nbsp; <b>${k.phone_number}</b>&nbsp;&nbsp;
					<b>${k.hire_date.substring(0,10)}</b>&nbsp;&nbsp; <b>${k.job_id}</b>&nbsp;&nbsp;
					<b>${k.salary}</b>&nbsp;&nbsp; <b>${k.commission_pct}</b>&nbsp;&nbsp;
					<b>${k.manager_id}</b>&nbsp;&nbsp; <b>${k.department_id}</b></li>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</body>
</html>