package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.CVO;
import com.ict.db.DAO;
import com.ict.db.MVO;
import com.ict.db.VO;

public class AddCartCommand implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String idx = request.getParameter("idx");
		// 해당 제품을 산 id를 구해야 된다.
		MVO m_vo = (MVO)request.getSession().getAttribute("m_vo");
		String id = m_vo.getM_id();
		
		// idx를 이용해서 제품을 가져오자
		VO vo = DAO.getOneList(idx);
		
		// 해당 아이디를 가진 사람의 카트 정보을 가져오자 
		CVO cvo = DAO.getCartList(id,vo.getP_num());
		
		// 카트에 제품이 없을 때(카트에 추가) 
		if(cvo == null) {
			CVO c_vo = new CVO();
			c_vo.setP_num(vo.getP_num());
			c_vo.setP_price(String.valueOf(vo.getP_price()));
			c_vo.setP_name(vo.getP_name());
			c_vo.setId(id);
			
			DAO.getCartInsert(c_vo);
		}else {
		// 카트에 제품이 있을 때(해당 제품의 갯수 1증가)
			DAO.getCartUpdate(cvo);
		}
		return "MyController?cmd=content&idx="+idx;
	}
}
