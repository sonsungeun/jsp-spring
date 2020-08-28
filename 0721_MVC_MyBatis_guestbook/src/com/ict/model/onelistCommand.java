package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import com.ict.db.DAO;
import com.ict.db.VO;

public class onelistCommand implements Command {
@Override
public String exec(HttpServletRequest request, HttpServletResponse response) {
	//
	
	String idx = request.getParameter("idx");
	VO vo =DAO.getOneList(idx);
	request.getSession().setAttribute("vo", vo);
	return "view/onelist.jsp";
}
}
