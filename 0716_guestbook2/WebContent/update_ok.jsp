<%@page import="com.ict.edu.VO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.ict.edu.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = getServletContext().getRealPath("/upload");
	MultipartRequest mr = new MultipartRequest(
			request,
			path,
			100*1024*1024,
			"utf-8",
			new DefaultFileRenamePolicy());
	
	VO vo = new VO();
	vo.setIdx(mr.getParameter("idx"));
	vo.setName(mr.getParameter("name"));
	vo.setSubject(mr.getParameter("subject"));
	vo.setContent(mr.getParameter("content"));
	vo.setPwd(mr.getParameter("pwd"));
	vo.setEmail(mr.getParameter("email"));
	
	// 파일을 업로드 했을 때와 안 했을 때를 구별
	if(mr.getFile("file_name")!=null){
		vo.setFile_name(mr.getFilesystemName("file_name"));
	}else{
		vo.setFile_name(mr.getParameter("f_name"));
	}
	int result = DAO.getInstance().getUpdate(vo);
%>    
<jsp:forward page="onelist.jsp?idx=${vo.idx}"></jsp:forward>







