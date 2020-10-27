package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.VO;

public class EditCommand implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String su = request.getParameter("su");
		String idx = request.getParameter("idx");
		
		// 수량이 변경되면 총 가격도 변경됨
		Cart.setQuant(idx, Integer.parseInt(su));
		
		return "MyController?cmd=viewcart";
	}
}
