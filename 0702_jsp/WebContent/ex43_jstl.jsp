<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL : 국제화(fmt)</title>
</head>
<body>
	<%-- 숫자와 날짜 포맷팅 --%>
	<h2>
		<h3> 천단위 숫자처리와 숫자만 받기 </h3>
		<li> <fmt:formatNumber value="1234.567" />  </li>
		<%-- <li> <fmt:formatNumber value="1234.5657aaa" />  </li> --%>
		<hr>
		
		<h3> 숫자 처리 </h3>
		<li> <fmt:parseNumber value="1234.567" />  </li>
		<li> <fmt:parseNumber value="1234.567aaa" />  </li>
		
		<h3> 반올림 처리(정수만) </h3>
		<li> <fmt:formatNumber value="1234.467" pattern="#,###" />  </li>
		<li> <fmt:formatNumber value="1234.567" pattern="#,###" />  </li>
		
		<h3> 반올림처리 (소숫점 첫째자리까지 구하기)  </h3>
		<li> <fmt:formatNumber value="1234.447" pattern="#,###.#" />  </li>
		<li> <fmt:formatNumber value="1234.557" pattern="#,###.#" />  </li>
		
		<li> <fmt:formatNumber value="1234" pattern="#,###.#" />  </li>
	
		<%-- 모자랐을 때 빈자리에 0 채운다. --%>
		<li> <fmt:formatNumber value="1234" pattern="#,###.0" />  </li>
		
		<h3> 반올림처리 (일의자리 처리)  </h3>
		
		<hr>
		
		<h3> 현재 시스템에 맞는 화페 단위 사용</h3>
		<li> <fmt:formatNumber value="1234"     type="currency" />  </li>
		<li> <fmt:formatNumber value="1234.412" type="currency" />  </li>
		
		<%-- 화폐단위를 미국으로 변경 --%>
		<fmt:setLocale value="en_us"/> 
		<li> <fmt:formatNumber value="1234"     type="currency" />  </li>
		<li> <fmt:formatNumber value="1234.412" type="currency" />  </li>
		
		<h3> 퍼센트 </h3>
		<li> <fmt:formatNumber value="12"     type="percent" />  </li>
		<li> <fmt:formatNumber value="0.12"   type="percent" />  </li>
		<hr>
		
		<!-- 오늘날짜 구하기  -->
		<jsp:useBean id="now" class="java.util.Date" />
		<h3>오늘날짜 ${now}입니다.</h3>
		<hr>
		
		<li> <fmt:formatDate value="${now}" /></li>
		<li> <fmt:formatDate value="${now}" dateStyle="short"/></li>
		<li> <fmt:formatDate value="${now}" dateStyle="medium"/></li>
		<li> <fmt:formatDate value="${now}" dateStyle="long"/></li>
		<li> <fmt:formatDate value="${now}" dateStyle="full"/></li>
		<hr>
		
		<li> <fmt:formatDate value="${now}" type="time"/></li>
		<li> <fmt:formatDate value="${now}" type="time" timeStyle="short" /></li>
		<li> <fmt:formatDate value="${now}" type="time" timeStyle="medium"/></li>
		<li> <fmt:formatDate value="${now}" type="time" timeStyle="long"/></li>
		<li> <fmt:formatDate value="${now}" type="time" timeStyle="full"/></li>
		<hr>
		
		<li> <fmt:formatDate value="${now}" pattern="yyyy.MM.dd"/></li>
		<li> <fmt:formatDate value="${now}" pattern="yy.MM.dd"/></li>
		<li> <fmt:formatDate value="${now}" pattern="HH:mm:ss"/></li>
		<li> <fmt:formatDate value="${now}" pattern="hh:mm:ss"/></li>
		<li> <fmt:formatDate value="${now}" pattern="yyyy.MM.dd HH:mm:ss"/></li>
		<hr>
	</h2>
</body>
</html>





