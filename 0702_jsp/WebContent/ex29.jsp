<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body>
<%
	//로그아웃은 쿠키정보를 삭제하는 것을 말한다.
	Cookie[] cookies = request.getCookies();
	if(cookies!=null&&cookies.length>0){
		for(Cookie k : cookies){
			if(k.getName().equals("ict")){
				//별도의 삭제 메소드가 없다. 기존이름에 다른이름으로 덮어쓴다.
				Cookie cookie = new Cookie("ict","");
				cookie.setMaxAge(0); // 유효시간을 0초 준다.
				response.addCookie(cookie);
				response.sendRedirect("ex28.jsp");
			}
		}
	}
%>
</body>
</html>