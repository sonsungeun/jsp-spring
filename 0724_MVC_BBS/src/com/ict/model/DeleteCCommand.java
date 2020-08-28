package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.DAO;

public class DeleteCCommand implements Command {
@Override
public String exec(HttpServletRequest request, HttpServletResponse response) {
	// TODO Auto-generated method stub
	String c_idx=request.getParameter("c_idx");
	DAO.getDeleteC(c_idx);
	return "/MyController?cmd=onelist&b_idx="+request.getParameter("b_idx");
}
}
