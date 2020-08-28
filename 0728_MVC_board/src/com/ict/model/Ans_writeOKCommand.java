package com.ict.model;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.DAO;
import com.ict.db.VO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class Ans_writeOKCommand implements Command{
@Override
public String exec(HttpServletRequest request, HttpServletResponse response) {
	try {
		String path = request.getServletContext().getRealPath("/upload");
		MultipartRequest mr = new MultipartRequest(request, path, 100*1024*1024, "utf-8", new DefaultFileRenamePolicy());
		String cPage = mr.getParameter("cPage");
		// 원글과 관련된 기존 정보 업데이트 (step과 lev 을 1 씩 증가시킨다.)
		int groups = Integer.parseInt(mr.getParameter("groups"))+1;
		int step = Integer.parseInt(mr.getParameter("step"))+1;
		int lev = Integer.parseInt(mr.getParameter("lev"))+1;
		
		// DB에 groups를 이용해서 lev를 업데이트 한다.
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("groups", groups);
		map.put("lev", lev);
		
		DAO.getUP_lev(map);
		// 댓글 삽입
		VO vo = new VO();
		vo.setWriter(mr.getParameter("writer"));
		vo.setContent(mr.getParameter("content"));
		vo.setPwd(mr.getParameter("pwd"));
		vo.setTitle(mr.getParameter("title"));
		vo.setGroups(String.valueOf(groups));
		vo.setLev(String.valueOf(lev));
		vo.setStep(String.valueOf(step));
		
		if (mr.getFile("file_name")!=null) {
			vo.setFile_name(mr.getFilesystemName("file_name"));
		}else {
			vo.setFile_name("");
		}
		int result=DAO.getAns_Insert(vo);
		return "/MyController?cmd=list&cPage="+cPage;
	} catch (Exception e) {
		// TODO: handle exception
	}
	return null;
}
}
