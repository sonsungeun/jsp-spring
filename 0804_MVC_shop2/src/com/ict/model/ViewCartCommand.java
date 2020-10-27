package com.ict.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.CVO;
import com.ict.db.DAO;
import com.ict.db.MVO;

public class ViewCartCommand implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		MVO m_vo = (MVO)request.getSession().getAttribute("m_vo");
		String id = m_vo.getM_id();
		
		// 해당 id의 전체 카드 정보 가져오기 
		List<CVO> clist = DAO.getAllCartList(id);
		request.setAttribute("clist", clist);
		return "view/cartList.jsp";
	}
}
