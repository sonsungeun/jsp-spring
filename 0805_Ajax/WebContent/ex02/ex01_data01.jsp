<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>XMLHttpReuest 객체</title>
</head>
<body>
	<script type="text/javascript">
	<%--XMLHttpRequest 객체 : 자바스크립트에서 ajax를 실행할때 필요한 객체 
		웹 브라우저가 낮은 버전이면 XMLHttpRequest 객체가 존재하지 않는다.
		그러나, ActiveXOject라는 비슷한 역할을 하는 객체가 존재한다. 	 --%>
	
	function createRequest() {
		var req;
		try {
			req = new XMLHttpRequest();
		} catch (e) {
			// XMLHttpRequest없으면 catch 문으로 온다.
			try {
				req = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e) {
				req = new ActiveXObject("Msxml3.XMLHTTP"); 
			}
		}
		return req;
	}
	
	
	// 1. 객체 생성
	var request = new createRequest();
	
	// 2. open("전송방식", "경로", "비동기여부")
	request.open("GET", "data01.xml", false);
	
	request.onreadystatechange = function() {
		// request.readyState : 데이터의 배달 결과 상태 표시
		// 0 => 객체 생성, 1 => open 안함, 2 => send 안함 
		// 3 => 데이터일부만 받음  4 => 전체데이터를 받음 
		
		// request.status => 200(성공), 4XX => 클라이언트 오류, 5XX => 서버오류 
		if(request.readyState == 4 && request.status == 200){
			// xml 읽는 방법
			var data = request.responseXML;
			
			// name태그와 price태그 가져오기
			var names = data.getElementsByTagName("name")
			var prices = data.getElementsByTagName("price")
			
			for (var i = 0; i < names.length; i++) {
				// 태그중 글자만 추출 : childNodes[0].nodeValue
				var name = names[i].childNodes[0].nodeValue;
				var price = prices[i].childNodes[0].nodeValue;
				// body부분에 넣을 수 있다. innerHTML
				document.body.innerHTML += "<h2><li>"+name+", "+price+"</li></h2>"
			
			}
		}
	}
	
	// 3. send() : 실행
	request.send();
	
	</script>
</body>
</html>











