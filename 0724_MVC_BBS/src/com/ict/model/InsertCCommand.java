package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.CVO;
import com.ict.db.DAO;

public class InsertCCommand implements Command {
@Override
public String exec(HttpServletRequest request, HttpServletResponse response) {
	// TODO Auto-generated method stub
	CVO cvo = new CVO();
	cvo.setB_idx(request.getParameter("b_idx"));
	cvo.setContent(request.getParameter("content"));
	cvo.setPwd(request.getParameter("pwd"));
	cvo.setWriter(request.getParameter("writer"));
	int result=DAO.getInsert_C(cvo);
	
	return "/MyController?cmd=onelist&b_idx="+request.getParameter("b_idx");
}
}
