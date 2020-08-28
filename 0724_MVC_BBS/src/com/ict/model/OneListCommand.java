package com.ict.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.BVO;
import com.ict.db.CVO;
import com.ict.db.DAO;

public class OneListCommand implements Command{
@Override
public String exec(HttpServletRequest request, HttpServletResponse response) {
	String b_idx = request.getParameter("b_idx");
	
	List<CVO> clist=DAO.getCList(b_idx);
	// 조회수 업데이트
	DAO.getHit(b_idx);
	
	// 내용 가져오기
	BVO bvo=DAO.getOneList(b_idx);

	// 수정과 삭제를 위해서 세션에 저장
	request.getSession().setAttribute("bvo", bvo);
	request.setAttribute("clist", clist);
	return "view/onelist.jsp";
}
}
