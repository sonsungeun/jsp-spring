<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL : 표현 언어</title>
<script type="text/javascript">
	function send_go(f) {
	/* 	var chk =f.name.value;
		if(chk==""){
			alert("이름정보를 입력하세요");
			f.name.focus();
			return;
		}
		chk =f.age.value;
		if(chk==""){
			alert("나이정보를 입력하세요");
			f.age.focus();
			return;
		}
		chk =f.addr.value;
		if(chk==""){
			alert("주소정보를 입력하세요");
			f.addr.focus();
			return;
		} */
		for (var i = 0; i < f.elements.length; i++) {
			if(f.elements[i].value==""){
				if(i==2) continue;		//i가 2일때(age)는 검사 skip;
				alert(f.elements[i].name+"를 입력하세요");
				f.elements[i].focus();
				return;
			}
		}
		f.action="ex40_result.jsp";
		f.submit();
	}
</script>
</head>
<body>
<%--
	- EL : JSP에서 사용 가능한 새로운 스크립트 언어
		      표현식(<%= 변수 또는 메소드 또는 계산식 %>) 대신에 사용된다.
		      
		   * 파라미터값을 받을 때도 사용된다.
		   * JSP가 가지고 있는 4가지 저장소에 저장된 정보를 바로 호출할 수 있다.(set만 되어있으면 get안해도 됨)
		   * 표현식 대신 사용 할 수 있다.
		   	 사용법 : ${변수 또는 메소드 또는 계산식}
		   * 표현식보다 가독성이 좋다.
 --%>
 	<h2>표현식 산술 연산 사용 예제</h2>
 	<h3>
 		<li>15 + 7 =<%=15+7 %></li>
 		<li>15 - 7 =<%=15-7 %></li>
 		<li>15 * 7 =<%=15*7 %></li>
 		<li>15 / 7 =<%=15/7 %></li>
 		<li>15 % 7 =<%=15&7 %></li>
 	</h3>
	<hr>
 	<h2>EL 산술 연산 사용 예제</h2>
 	<h3>
 		<li>15 + 7 =${ 15+7 }</li>
 		<li>15 - 7 =${ 15-7 }</li>
 		<li>15 * 7 =${ 15*7 }</li>
 		<li>15 / 7 =${ 15/7 }</li>
 		<li>15 % 7 =${ 15%7 }</li>
 	</h3>
 	<hr>
 	<h2>표현식 변수 사용 예제</h2>
 	<% int su1 = 125+25;%>
 	<h3><li>su1=<%=su1 %></li></h3>
 	<hr>
 	<!-- EL은 jsp에서 바로 만든 변수의 값은 호출할 수 없다.
 		 반드시 4가지 저장공간(pageContext, request, session, application)에 저장 한 후 호출해야 한다.  -->
 	<h2>EL 변수 사용 예제</h2>
 	<% session.setAttribute("su1", su1);%>
 	<h3><li>su1=${su1}</li></h3>
 	
 	<%-- 4가지 저장소에 속성의 이름이 같으면 우선순위는 
 		pageContext > request > session > application 순서이다. --%>
 		
 	<%pageContext.setAttribute("pc", "i3"); %>
 	<%request.setAttribute("pc", "i5"); %>
 	<%session.setAttribute("pc", "i7"); %>
 	<%application.setAttribute("pc", "i9"); %>
 	<h3>
 		<li>호출하기(우선순위 존재)</li>
 		<li>pc=${pc}</li>
 		<li>pc=${pageScope.pc}</li>
 		<li>pc=${requestScope.pc}</li>
 		<li>pc=${sessionScope.pc}</li>
 		<li>pc=${applicationScope.pc}</li>
 	</h3>
 	
 	<%-- 파라미터에 사용되는 방법 --%>
 	<h2> form을 이용한 파라미터 전송	 </h2>
 	<form action="ex40_result.jsp" method="post">
 	<fieldset>
 	<legend> HTML_submit을 이용한 데이터 전송 </legend>
 	<%-- required : 반드시 입력해야하는 데이터 --%>
 	<p>*이름 : <input type="text" name="name" required></p>
 	<p>*나이 : <input type="number" name="age" required></p>
 	<p>*주소 : <input type="text" name="addr" required></p>
 	<p>성별 : <input type="radio" name="gender" value="남성">남성
 			<input type="radio" name="gender" value="여성">여성</p>
 	<p>취미 : <input type="checkbox" name="hobby" value="운동">운동
 			<input type="checkbox" name="hobby" value="영화">영화
 			<input type="checkbox" name="hobby" value="게임">게임
 			<input type="checkbox" name="hobby" value="독서">독서</p>
 	<input type="submit" value="회원가입">
 	</fieldset>
 	</form>
 	<hr>
	<form method="post">
 	<fieldset>
 	<legend> javascript를 이용한 데이터 전송 </legend>
 	<%-- Javascript는 required가 적용되지 않는다. --%>
 	<p>*이름 : <input type="text" name="name" ></p>
 	<p>*나이 : <input type="number" name="age" ></p>
 	<p>*주소 : <input type="text" name="addr" ></p>
 	<p>성별 : <input type="radio" name="gender" value="남성">남성
 			<input type="radio" name="gender" value="여성">여성</p>
 	<p>취미 : <input type="checkbox" name="hobby" value="운동">운동
 			<input type="checkbox" name="hobby" value="영화">영화
 			<input type="checkbox" name="hobby" value="게임">게임
 			<input type="checkbox" name="hobby" value="독서">독서</p>
	<input type="button" onclick="send_go(this.form)" value="회원가입">
 	</fieldset>
 	</form>
 	
</body>
</html>