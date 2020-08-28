<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.ict.edu.VO"%>
<%@page import="com.ict.edu.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%
  // 파일 업 로드 시 실제 저장 위치부터 
  String path = getServletContext().getRealPath("/upload");

  // MultipartRequest 객체 생성
  MultipartRequest mr = new MultipartRequest(
		  request,
		  path,
		  100*1024*1024,
		  "utf-8",
		  new DefaultFileRenamePolicy());
  
  // 파라미터값 받아서 DB에 저장
  VO vo = new VO();
  vo.setName(mr.getParameter("name"));
  vo.setSubject(mr.getParameter("subject"));
  vo.setContent(mr.getParameter("content"));
  vo.setPwd(mr.getParameter("pwd"));
  vo.setEmail(mr.getParameter("email"));
 
  // 첨부파일을 업로드 할때와 하지 않을 때로 구분
  if(mr.getFile("file_name") != null){
	  vo.setFile_name(mr.getFilesystemName("file_name"));
  }else{
	  vo.setFile_name("");
  }
  
  int result = DAO.getInstance().getInsert(vo);
  pageContext.setAttribute("result", result);
%>
    
<c:choose>
	<c:when test="${result>0}">
		<script>
			alert("삽입 성공");
			location.href = "list.jsp";
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("삽입 실패");
			location.href = "write.jsp";
		</script>
	</c:otherwise>
</c:choose>











