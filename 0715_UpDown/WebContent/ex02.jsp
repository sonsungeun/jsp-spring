<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   // 결과가 null 사용 X
   // String name = request.getParameter("name");

	/*
	   cos.jar 안에 MultipartRequest 클래스를 사용하여 업로드 한다.
	   주요메소드
	   - getParameter(String)       : String
	   - getParameterValues(String) : String[]
	   - getOriginalFileName(String): String (업로드 당시 파일이름)
	   - getFilesystemName(String)  : String (저장 당시 파일이름)
	   - getContentType(String)     : String (해당 파일의 종류)
	   - getFile(String)   : File (업로드된 파일을 File Class로변경)
	*/
	
	// 1. 실제 파일이 저장될 위치를 구하자(톰켓안에 프로젝트안에 존재)
	 String path = getServletContext().getRealPath("/upload");
	// System.out.println(path);
	
	// 2. MultipartRequest 클래스를 객체 생성하자
	MultipartRequest mr = 
		new MultipartRequest(
				request,       // request 정보
				path,          // 저장위치 정보
				100*1024*1024, // 업로드 할 수 있는 용량(100MB)
				"utf-8",       // 인코딩   
				new DefaultFileRenamePolicy() // 파일 이름 중복 처리
				);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>결과보기</h1>
	<h2>
		<li>올린사람     : <%= mr.getParameter("name") %></li>
		<li>파일원본이름 : <%= mr.getOriginalFileName("file_name") %></li>
		<li>파일저장이름 : <%= mr.getFilesystemName("file_name") %></li>
		<li>파일타입     : <%= mr.getContentType("file_name") %></li>
		<hr>
		<% File file = mr.getFile("file_name"); %>
		<li>파일이름 : <%= file.getName() %></li>
		<li>파일크기 : <%= file.length()/1024 %>KB</li>
		<li>마지막수정날짜 : <%= file.lastModified() %></li>
		<%-- 위 날짜는 1970.01.01.부터 지금 현재 날짜 까지 수치화 한것 --%>
		<%
			SimpleDateFormat day = 
				new SimpleDateFormat("yyyy-MM-dd  HH:mm:ss E");
		%>
		<li>마지막수정날짜 : <%= day.format(file.lastModified())%></li>
		<img  src="upload/<%=file.getName()%>" style="width: 150px">
		<li> 다운로드 : <a href="download.jsp?path=upload&file_name=<%=file.getName()%>"><%=file.getName() %></a>
	</h2>
</body>
</html>









