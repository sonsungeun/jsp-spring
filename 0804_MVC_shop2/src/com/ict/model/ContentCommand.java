package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.DAO;
import com.ict.db.VO;

public class ContentCommand implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String idx = request.getParameter("idx");
		
		VO vo = DAO.getOneList(idx);
		// 사용자는 수정과 삭제가 필요없으므로 session에 담을 필요가 없음
		request.setAttribute("vo", vo);
		return "view/product_content.jsp";
	}
}
