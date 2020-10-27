package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.CVO;
import com.ict.db.DAO;

public class DelProductCommand implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String p_num = request.getParameter("p_num");
		String id = request.getParameter("id");
		CVO cvo = new CVO();
		cvo.setP_num(p_num);
		cvo.setId(id);
		
		DAO.getcartDel(cvo);
		
		return "MyController?cmd=viewcart";
	}
}
