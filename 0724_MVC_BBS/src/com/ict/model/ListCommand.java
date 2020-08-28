package com.ict.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.BVO;
import com.ict.db.DAO;


public class ListCommand implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//List<BVO> b_list = DAO.getList();
		
		Paging paging = new Paging();

		// 1. 전체 게시물의 수 구하기
		int count = DAO.getCount();
		paging.setTotalRecord(count);
		
		// 2. 전체 게시물의 수를 가지고 전체 페이지 수를 구하자
		if (paging.getTotalRecord()<=paging.getPagePerBlock()) {
			paging.setTotalPage(1);
		}else {
			paging.setTotalPage(paging.getTotalRecord()/paging.getNumPerPgae());
			
			if (paging.getTotalPage()%paging.getNumPerPgae()!=0) {
				paging.setTotalPage(paging.getTotalPage()+1);
			}
		}
		
		// 3.현재 페이지 구하기
		String cPage=request.getParameter("cPage");
		if (cPage==null) {
			paging.setNowPage(1);
		}else {
			paging.setNowPage(Integer.parseInt(cPage));
		}
		
		// 4. 현재 페이지의 시작번호와 끝번호를 구해서 DB에서 가져오자
		paging.setBegin((paging.getNowPage()-1)*paging.getNumPerPgae()+1);
		paging.setEnd((paging.getBegin()-1)+paging.getNumPerPgae());
		
		// 5. 시작번호와 끝번호를 가지고 DB에서 게시물을 가져오자
		List<BVO> b_list=DAO.getList(paging.getBegin(),paging.getEnd());
		
		// 6. 현재 페이지의 시작블록과 끝블록을 구하자
		request.setAttribute("b_list", b_list);
		return "view/list.jsp";
	}
}
