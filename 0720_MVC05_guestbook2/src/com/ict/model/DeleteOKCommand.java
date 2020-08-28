package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.DAO;
import com.ict.db.VO;

public class DeleteOKCommand implements Command {
@Override
public String exec(HttpServletRequest request, HttpServletResponse response) {
	// TODO Auto-generated method stub
	
	VO vo = (VO)request.getSession().getAttribute("vo");
	String idx= vo.getIdx();
	int result=DAO.getInstance().getDelete(idx);
	request.setAttribute("result", result);
	return "MyController?cmd=list";
}
}
