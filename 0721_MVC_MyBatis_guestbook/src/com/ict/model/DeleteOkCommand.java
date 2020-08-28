package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.DAO;
import com.ict.db.VO;

public class DeleteOkCommand implements Command{
@Override
public String exec(HttpServletRequest request, HttpServletResponse response) {
	//
	VO vo = (VO)request.getSession().getAttribute("vo");
	int result=DAO.getDelete(vo);
	return "MyController?cmd=list";
}
}
