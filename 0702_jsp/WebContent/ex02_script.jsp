<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크립트 요소</title>
</head>
<body>
<%--
	스크립트 요소 : 1.선언부 2.스크립트릿 3.표현식
	1. 선언부
	   - 전역변수 선언과 메소드 선언을 할 때 사용
	   - <%! 자바코드 %>
	2. 스크립트릿
	   - 순수 자바코드를 작성(실행)할 때 사용
	   - <%  자바코드  %>
	3. 표현식
	  - 변수값을 출력할 때      
      - 메소드 결과를 출력할 때
      - 나중에는 EL 이나 JSTL이 대신 사용 된다.
      - <%=  %>
      
      ** 위 3요소는 겹쳐서 사용할 수 없다., 반드시 별도로 사용해야 된다.
 --%>
 
 <h2> 1-10까지 출력하기 </h2>
 <%
    for(int i=0; i<11; i++){
    	// 콘솔에 출력하는 것이 아니므로 주석처리 
    	// System.out.println(i); 
    	// 웹 브라우저에 출력하기 위한 내장 객체 out 존재
    	out.println("<h4>"+i+"</h4>");
    }
 %>
 <hr>
 <h2> 0-10까지 출력하기, 합도 출력하기 </h2>
 <%
    int sum = 0 ;
    for(int i=0; i<11; i++){
    	out.println(i);
    	sum = sum+i;
    }
     out.println("결과는 "+sum);
 %>
 <hr>
 <%! int k = 0 ;%>
 <%
	 for(int i=0; i<11; i++){
	 	out.println(i);
	 	k = k+i;
	 }
 %>
 <br>
 <p> 결과는 <%=k %> </p>
 <hr>
 <%! 
   int res = 0 ;
 	// 더하기 메소드 : void X
 	public int add(int su1, int su2){
	 return su1 + su2 ;
   }
 	// 빼기 메소드 : void O
 	public void sub(int su1, int su2){
	    res = su1 - su2 ;
   }
 %>
 
 <p> 7 + 5 = <%=add(7,5) %></p>
 
 <!-- 메소드가 void 인 경우  -->
 <%sub(7,5); %> <%-- 메소드를 먼저 실행 --%>
 <p> 7 - 5 = <%= res %><%-- 결과 호출 --%></p>
 
 <hr>
 <h2> 오늘날짜와 운수 출력하기 </h2>
 <%
 	Calendar now = Calendar.getInstance();
    int year = now.get(Calendar.YEAR);
    int month = now.get(Calendar.MONTH)+1;
    int day = now.get(Calendar.DATE);
    
    int lucky = (int)(Math.random()*101);
    
    out.println("오늘날짜 : " + year+". "+month+". "+day +"<br>");
    out.println("오늘운수 : "+ lucky+"% 입니다.");
 %>
 <hr>
  <p>오늘 날짜 : <%=year%>. <%=month %>. <%=day %></p>
  <p>오늘 운수 : <%=lucky %>% 입니다.</p>
</body>
</html>












