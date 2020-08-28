<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>    
<c:choose>
	<c:when test="${result>0}">
	 <% // 실제 파일을 삭제하는 하자.(숙제)	 %>
		<script>
			alert("삭제성공");
			location.href = "/0720_MVC05_guestbook2/MyController?cmd=list";
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("삭제실패");
			location.href="/0720_MVC05_guestbook2/MyController?cmd=delete";
		</script>
	</c:otherwise>
</c:choose>