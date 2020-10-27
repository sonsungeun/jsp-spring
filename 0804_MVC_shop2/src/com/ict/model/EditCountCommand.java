package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.CVO;
import com.ict.db.DAO;

public class EditCountCommand implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String p_su = request.getParameter("p_su");
		String p_num = request.getParameter("p_num");
		String id = request.getParameter("id");
	
		
		CVO cvo = new CVO();
		cvo.setP_su(p_su);
		cvo.setP_num(p_num);
		cvo.setId(id);
		
		// 카드안에 물건의 수 업데이트
		DAO.getCartCountUpdate(cvo);
		
		
		return "MyController?cmd=viewcart";
	}
}
