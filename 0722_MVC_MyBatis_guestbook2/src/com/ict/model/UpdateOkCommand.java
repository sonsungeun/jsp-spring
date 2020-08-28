package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.DAO;
import com.ict.db.VO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UpdateOkCommand implements Command{
@Override
public String exec(HttpServletRequest request, HttpServletResponse response) {
	// TODO Auto-generated method stub
	String path = request.getServletContext().getRealPath("/upload");
	VO vo = new VO();
	try {
		MultipartRequest mr = new MultipartRequest(request, path, 100*1024*1024, "utf-8", new DefaultFileRenamePolicy());
		
		vo.setName(mr.getParameter("name"));
		vo.setContent(mr.getParameter("content"));
		vo.setEmail(mr.getParameter("email"));
		vo.setSubject(mr.getParameter("subject"));
		vo.setIdx(mr.getParameter("idx"));
		
		if (mr.getFile("file_name")!=null) {
			vo.setFile_name(mr.getFilesystemName("file_name"));
		}else {
			vo.setFile_name(request.getParameter("f_name"));
		}
		DAO.getUpdate(vo);
		request.getSession().setAttribute("vo", vo);

	} catch (Exception e) {
	}
	return "MyController?cmd=onelist&idx="+vo.getIdx();
}
}
