package com.ict.model;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.DAO;
import com.ict.db.VO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UpdateOKCommand implements Command {
@Override
public String exec(HttpServletRequest request, HttpServletResponse response) {
	// TODO Auto-generated method stub
	String path = request.getServletContext().getRealPath("upload");
	try {
		MultipartRequest mr = new MultipartRequest(request, path, 100*1024*1024, "utf-8", new DefaultFileRenamePolicy());
		VO vo = new VO();
		vo.setName(mr.getParameter("name"));
		vo.setContent(mr.getParameter("content"));
		vo.setSubject(mr.getParameter("subject"));
		vo.setEmail(mr.getParameter("email"));
		vo.setIdx(mr.getParameter("idx"));
		
		if (mr.getFile("file_name")!=null) {
			vo.setFile_name(mr.getFilesystemName("file_name"));
		}else {
			vo.setFile_name(mr.getParameter("f_name"));
		}
		int result=DAO.getInstance().getUpdate(vo);
		// 업데이트를 성공하면  기존 session의 vo를 변경된 vo로 덮어쓴다.
		if (result>=1) {
			request.getSession().setAttribute("vo", vo);
		}
		request.setAttribute("result", result);
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return "view/update_ok.jsp";
}
}
