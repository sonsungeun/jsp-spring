package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.BVO;
import com.ict.db.DAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UpdateOkCommand implements Command{
@Override
public String exec(HttpServletRequest request, HttpServletResponse response) {
	BVO bvo = new BVO();
	try {
		String path = request.getServletContext().getRealPath("/upload");
		MultipartRequest mr = new MultipartRequest(request, path, 100*1024*1024, "utf-8", new DefaultFileRenamePolicy());
		bvo.setContent(mr.getParameter("content"));
		bvo.setWriter(mr.getParameter("writer"));
		bvo.setSubject(mr.getParameter("subject"));
		bvo.setPwd(mr.getParameter("pwd"));
		
		BVO bvo2 = (BVO)request.getSession().getAttribute("bvo");
		bvo.setB_idx(bvo2.getB_idx());
		
		if (mr.getFile("file_name")!=null) {
			bvo.setFile_name(mr.getFilesystemName("file_name"));
		}else {
			bvo.setFile_name(mr.getParameter("f_name"));
		}
		
		int result=DAO.getUpdate(bvo);
		request.getSession().setAttribute("bvo", bvo);
	} catch (Exception e) {
	}
	
	return "/MyController?cmd=onelist&b_idx="+bvo.getB_idx();
}
}
