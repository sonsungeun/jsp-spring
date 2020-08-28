package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.DAO;
import com.ict.db.VO;

public class OnelistCommand implements Command {
@Override
public String exec(HttpServletRequest request, HttpServletResponse response) {
	// TODO Auto-generated method stub
	String idx = request.getParameter("idx");
	VO vo = DAO.getOnelist(idx);
	request.getSession().setAttribute("vo", vo);
	return "view/onelist.jsp";
}
}
