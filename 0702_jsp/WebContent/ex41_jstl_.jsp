<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL : JSP 표준 태그 라이브러리 (core)</title>
</head>
<body>
	<%--
	1. 라이브러리를 다운받아서 해당 프로젝트에 저장한다.
		(tomcat.apache.org, jstl.java.net)
	2. 다운받은 라이브러리를 WEB-INF 안에 lib 폴더 안에 넣는다.
	3. page 지시어 밑에 taglib 지시어를 통해서 선언하고 사용한다.
		선언방법
	    : <%@ taglib prefix="" uri="" %>
		 코어 : <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		 국제화 : <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/fmt" %>
		 
	4. 사용방법 : <c:명령어> </c:명령어> EL과 함께 사용한다.
	--%>
	<%--
		변수생성(set) 		: <c:set var="변수이름" value="변수값(data)" />
		변수출력(out) 		: <c:out value="출력할 데이터 || ${변수이름}" />
						   또는 html 태그 안에 EL태그 그냥 사용 ( = ${변수이름}  )
		변수삭제(remove) 	: 
	 --%>
	<h2>
		<%-- 변수 생성 --%>
		<c:set var="test" value="Hello JSP" />
		<%-- 변수데이터 출력 --%>
		<li><c:out value="test" /></li>	<!-- test 출력 -->
		<li><c:out value="${test}" /></li> <!-- Hello JSP 출력 -->
		<li> ${test}</li> <!-- Hello JSP 출력 -->
		<%-- 변수 삭제 후 호출 --%>
		<c:remove var="test"/>
		<li><c:out value="${test}" /></li> <!-- 안나옴(오류X) -->
		<li> ${test}</li>	<!-- 안나옴(오류X) -->
		<hr>
		<%--
			if문의 특징 : else가 없다. 조건이 참이 아니면 if문 무시
			<c:if test="${조건식(관계연산자||비교연산자)}" var="변수명">
				조건이 참이면 실행할 내용;
			</c:if>
			
		 --%>
		<c:if test="${5>4}">
			<li>Hello WEB World</li>		
		</c:if>
		<c:if test="${5<4}">
			<li>Hello JSP World</li>		
		</c:if>
		<%-- sum의 점수가 90이상이면 합격 아니면 불합격 --%>
		<c:set var="sum" value="73" />
		<c:if test="${sum>=90}">
			<h3>${sum}점 : 당신은 합격입니다.</h3>
		</c:if>
		<c:if test="${sum<90}">
			<h3>${sum}점 : 당신은 불합격입니다.</h3>
		</c:if>
		<%-- choose문 : switch문과 비슷(if~else를 대신할 수 있다.)
			<c:choose>
		 	<c:when test="${조건식1}">
		 		조건1이 참일때 실행할 문장;
		 	</c:when>
		 	<c:when test="${조건식2}">
		 		조건2이 참일때 실행할 문장;
		 	</c:when>
		 	<c:when test="${조건식3}">
		 		조건3이 참일때 실행할 문장;
		 	</c:when>
			<c:otherwise>
				위 조건이 다 거짓일때 실행할 문장;
			</c:otherwise>
			</c:choose>
		--%>
		<%-- 평균이 90이상이면 A, 평균이 80이상이면 B, 평균이 70이상이면 C, 나머지 F --%>
		<c:set var="score" value="64.3" />
		<c:choose>
			<c:when test="${score>=90.0}"><li>A학점</li></c:when>
			<c:when test="${score>=80.0}"><li>B</li></c:when>
			<c:when test="${score>=70.0}"><li>C</li></c:when>
			<c:otherwise><li>F</li></c:otherwise>
		</c:choose>
		<%--
			반복문 :
			1. 일반적인 for문 형식
			<c:forEach begin="시작값" end="끝값" step="증가값" var="변수">
				반복내용 (EL)
			</c:forEach>
			2. 개선된for문형식(배열,리스트에 사용)
			<c:forEach var="" items="${배열,리스트}">
				반복내용
			</c:forEach>	
		 --%>
		<%-- 0-10까지 출력 --%>
		<c:forEach begin="0" end="10" step="1" var="k">
			${k} &nbsp;&nbsp;&nbsp;
		</c:forEach>
		<hr>
		<%-- 0-10까지 짝수 출력 --%>
		<c:forEach begin="0" end="10" step="1" var="k">
			<c:if test="${k%2==0}">
				${k}&nbsp;&nbsp;&nbsp;
			</c:if>
		</c:forEach>
		<hr>
		
		<%-- varStatus => count(1), index() --%>
		<c:forEach begin="20" end="29" step="1" var="k" varStatus="vs">
			${k} / ${vs.index} / ${vs.count } <br>
		</c:forEach>
		<hr>
			
		<%-- varStatus => first, last 결과는 boolean형 --%>
		<c:forEach begin="20" end="29" step="1" var="k" varStatus="vs">
			${k} / ${vs.first} / ${vs.last } <br>
		</c:forEach>
		<hr>
		
		<%-- 배열 저장 --%>
		<c:set var="arr" value="홍길동, 임꺽정, 일지매, 장길산" />
		
		<%-- 개선된 for문은 배열이나 리스트처리에 적합 --%>
		<c:forEach var="k" items="${arr}">
			${k} <br>
		</c:forEach>
		<hr>
		
		<%-- 반복하면서 나누기
		 <c:forTokens items="${배열,리스트}" delims="구분자"></c:forTokens>--%>
		 <c:set var="arr2"
		  value="홍길동,임꺽정,일지매/장길산,둘리/고길동,마이콜"/>
		 <c:forTokens var="k" items="${arr2}" delims=",">
		 	${k}<br>
		 </c:forTokens>
		 <hr>
		 <c:forTokens var="k" items="${arr2}" delims="/">
		 	${k}<br>
		 </c:forTokens>
		 <hr>
		 <c:forTokens var="k" items="${arr2}" delims="/,">
		 	${k}<br>
		 </c:forTokens>
		 <hr>
		 
		 <%-- 페이지 이동 : redirect
		 		JSTL에는 forward가 없다.
		 		jsp액션에는 redirect가 없다.
		 		둘다 파라미터 값을 넘길 수 있다.
		 		<c:redirect url="이동페이지" />		
		  --%>
		  <%-- <c:redirect url="ex42_result.jsp">
		  	<c:param name="name" value="아수라백작" />
		  </c:redirect> --%>
		  
		  <%-- 한글처리 --%>
		  <%request.setCharacterEncoding("utf-8"); %>
		  <jsp:forward page="ex42_result.jsp">
		  	<jsp:param value="태권브이" name="name"/>
		  </jsp:forward>
	</h2> 
	
	
	
</body>
</html>