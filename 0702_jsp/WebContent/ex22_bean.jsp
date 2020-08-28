<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>useBean : 자바빈</title>
<script type="text/javascript">
	function send_go(f) {
		f.action="ex23_result.jsp";
		f.submit();
	}
</script>
</head>
<body>
<%--
	자바 빈 : JSP에서 파라미터값을 저장할 목적으로 제공하는 저장공간
	빈 객체 : 자바 빈에 저장되어있는 객체를 뜻한다.
	1. 사용순서
	 1) VO를 만든다. (변수들의 이름은 파라미터의 이름들과 같아야 된다.)
	 2) 파라미터를 받는 페이지에서 빈 객체를 생성한다.
	 	<jsp:useBean id="호출이름" class="vo객체위치" scope="생명주기(범위)" />
	 	scope : page(default), request, session, application
	 3) <jsp:setProperty> 사용하면 파라미터값들이 알아서 저장된다.
	 4) <jsp:getProperty> 사용하면 파라미터값들을 가져올 수 있다.
--%>
<h2> form을 이용한 파라미터 전송하기 </h2>
	<form method="post">
	<fieldset><legend>데이터 전송</legend>
		<p> 이름 : <input type="text" name="name"></p>
		<p> 나이 : <input type="number" name="age"></p>
		<p> 주소 : <input type="text" name="addr"></p>
		<p> 성별: <input type="radio" name="gender" value="남">남
				 <input type="radio" name="gender" value="여">여
		</p>
		<p> 취미 : <input type="checkbox" name="hobby" value="운동">운동
				  <input type="checkbox" name="hobby" value="독서">독서
				  <input type="checkbox" name="hobby" value="영화">영화
				  <input type="checkbox" name="hobby" value="게임">게임
		</p>
		<p> 거주지 : <select name="residence">
		<option>::선택하세요::</option>
		<option>서울</option>
		<option>경기</option>
		<option>강원</option>		
		<option>제주</option>		
		</select></p>
		<p> 반려동물 : <select name="animal" multiple size="4">
		<option>강아지</option>
		<option>고양이</option>
		<option>토끼</option>		
		<option>앵무새</option>	
		</select>
		</p>
		<input type="hidden" name="cPage" value="1">
		<input type="button" value="정보보내기" onclick="send_go(this.form)">
	</fieldset>
	</form>
</body>
</html>