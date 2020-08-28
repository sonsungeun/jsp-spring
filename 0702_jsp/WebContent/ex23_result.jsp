<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- useBean를 사용하지 않았을 때 방법 -->
<%--     <%
    
    // 요청에 따른 한글 처리
    	request.setCharacterEncoding("utf-8");
    // 파라미터 값 받기
    	String name = request.getParameter("name");
    	String age = request.getParameter("age");
    	String addr = request.getParameter("addr");
    	String gender = request.getParameter("gender");
    	String[] hobby = request.getParameterValues("hobby");
    	String residence = request.getParameter("residence");
    	String[] animal = request.getParameterValues("animal");
    	String cPage = request.getParameter("cPage");
    %>
 --%>
 <%request.setCharacterEncoding("utf-8"); %>
 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션태그 : useBean</title>
</head>
<body>
	<%-- 자바에서 VO vo = new VO(); 와 같은 효과 --%>
	<jsp:useBean id="vo" class="com.ict.edu.VO" />
	
	<%-- 파라미터값들이 vo와 이름이 같으면 setter 호출해서 
	파라미터 값을 저장시킨다
	name="vo"는 useBean의 id를 말한다. --%>
	<jsp:setProperty property="*" name="vo"/>
	
	<h2>파라미터 값 표시하기</h2>
	<h3>
		<ul>
 			 <li> 이름 : <jsp:getProperty property="name" name="vo"/> </li>
 			 <li> 나이 : <jsp:getProperty property="age" name="vo"/> </li>
 			 <li> 주소 : <%=vo.getAddr() %> </li>
 			 <li> 성별 : <%=vo.getGender() %> </li>
 			 <li> 취미 : <%for(String k : vo.getHobby()){
 			 				out.println(k+"&nbsp;&nbsp;");
 			 			}%> 
 			</li>
 			<li> 거주지 : <%=vo.getResidence() %></li>
 			 <li> 반려동물 : <%for(String k : vo.getAnimal()){
 			 				out.println(k+"&nbsp;&nbsp;");
 			 			}%> 
 			</li>
 			<li>cPage : <%=vo.getcPage() %></li>
		</ul>
	</h3>
</body>
</html>