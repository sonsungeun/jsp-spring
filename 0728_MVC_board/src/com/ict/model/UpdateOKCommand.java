package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.DAO;
import com.ict.db.VO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UpdateOKCommand implements Command {
@Override
public String exec(HttpServletRequest request, HttpServletResponse response) {
	try {
		String path = request.getServletContext().getRealPath("/upload");
		MultipartRequest mr = new MultipartRequest(request, path, 100*1024*1024, "utf-8", new DefaultFileRenamePolicy());
		String cPage = mr.getParameter("cPage");
		String idx = mr.getParameter("idx");
		
		VO vo = new VO();
		vo.setContent(mr.getParameter("content"));
		vo.setIdx(idx);
		vo.setTitle(mr.getParameter("title"));
		vo.setWriter(mr.getParameter("writer"));
		
		if (mr.getFile("file_name")!=null) {
			vo.setFile_name(mr.getFilesystemName("file_name"));
		}else {
			vo.setFile_name(mr.getParameter("f_name"));
		}
		DAO.getUpdate(vo);
		return "MyController?cmd=onelist&cPage="+cPage+"&idx="+idx;
	} catch (Exception e) {
		// TODO: handle exception
	}
	return null;
	}
}
