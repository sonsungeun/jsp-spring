<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
tr {
	text-align: center;
	padding: 4px 10px;
	background-color: #F6F6F6;
}

th {
	text-align: center;
	padding: 4px 10px;
	background-color: #B2CCFF;
}
</style>
</head>
<body>
	<h2 style="text-align: center;">BOARD 리스트</h2>
	<table width="800" style="margin: 0px auto;">
		<thead>
			<tr>
				<th width="10%">번호</th>
				<th width="40%">제목</th>
				<th width="20%">글쓴이</th>
				<th width="15%">날짜</th>
				<th width="15%">조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty list}">
					<tr><td colspan="5">찾는 정보가 존재하지 않습니다.</td></tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="k" items="${list}" varStatus="vs">
						<tr>
							<td>${paging.totalRecord-((paging.nowPage-1)*paging.numPerPage+vs.index)}</td>
							<td style="text-align: left; padding-left: 10px;">
							<c:forEach begin="1" end="${k.step}">
								&nbsp;[RE]
							</c:forEach>
							<a href="/MyController?cmd=onelist&idx=${k.idx}&cPage=${paging.nowPage}">${k.title}</a></td>
							<td>${k.writer}</td>
							<td>${k.regdate.substring(0,10)}</td>
							<td>${k.hit}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>			
		</tbody>
		<tfoot>
			<tr>
				<td colspan="4">
					<!-- 이전 -->
					<c:choose>
						<c:when test="${paging.beginBlock <= paging.pagePerBlock}">
							<span style="color: gray;">이전으로</span>
						</c:when>
						<c:otherwise>	
							<a href="/MyController?cmd=list&cPage=${paging.beginBlock-paging.pagePerBlock}"><span style="color: black;"><b>이전으로</b></span></a>
						</c:otherwise>
					</c:choose>
					
					<!-- 페이지번호 -->
					<c:forEach begin="${paging.beginBlock}" end="${paging.endBlock}" step="1" var="k">
						<!-- 현재페이지이냐 아니냐 구분 -->
						<c:choose>
							<c:when test="${k==paging.nowPage}">
								<font style="font-weight: bold; color: tomato;">${k}</font>
							</c:when>
							<c:otherwise>
								<a href="/MyController?cmd=list&cPage=${k}"><font style="font-weight: bold; ">${k}</font></a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<!-- 이후 -->
					<c:choose>
						<c:when test="${paging.endBlock >= paging.totalPage}">
							<span style="color: gray;">다음으로</span>
						</c:when>
						<c:otherwise>	
							<a href="/MyController?cmd=list&cPage=${paging.beginBlock+paging.pagePerBlock}"><span style="color: black;"><b>다음으로</b></span></a>
						</c:otherwise>
					</c:choose>

				</td>
				<td><button onclick="location.href='/MyController?cmd=write'">글쓰기</button></td>
			</tr>
		</tfoot>
	</table>
</body>
</html>