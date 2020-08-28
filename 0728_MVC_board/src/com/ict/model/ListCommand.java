package com.ict.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.DAO;
import com.ict.db.VO;

public class ListCommand implements Command {
@Override
public String exec(HttpServletRequest request, HttpServletResponse response) {
	
	// 페이징 기법 사용해서 시작번호, 끝번호, 시작블록, 끝블록 구하기
	Paging paging = new Paging();
	
	// 1. 전체 게시물의 수를 구하자.
	int su = DAO.getCount();
	paging.setTotalRecord(su);
	
	// 2. 전체 게시물의 수를 가지고 전체 페이지의 수를 구하자.
	if (paging.getTotalRecord()<=paging.getNumPerPage()) {
		paging.setTotalPage(1);
	}else {
		paging.setTotalPage(paging.getTotalRecord() / paging.getNumPerPage());
		// 나머지가 있으면 한페이지 더 추가
		if (paging.getTotalRecord() % paging.getNumPerPage()!=0) {
			paging.setTotalPage(paging.getTotalPage()+1);
		}
	}
	// 3. 현재 페이지 구하기 : 처음을 제회한 나머지 list에 갈 경우에는 무조건 cPage 파라미터 값을 가지고 와야한다.
	String cPage = request.getParameter("cPage");
	if (cPage==null) {
		// cPage가 null이면 현재 페이지를 1페이지
		paging.setNowPage(1);
	}else {
		paging.setNowPage(Integer.parseInt(cPage));
	}
	
	// 4. 시작번호, 끝번호 구하기
	paging.setBegin((paging.getNowPage()-1)*paging.getNumPerPage()+1);
	paging.setEnd((paging.getBegin()-1)+paging.getNumPerPage());
	
	// 5. 시작블록, 끝블록 구하기
	paging.setBeginBlock((int)((paging.getNowPage()-1)/paging.getPagePerBlock())*paging.getPagePerBlock()+1);
	paging.setEndBlock(paging.getBeginBlock()+paging.getPagePerBlock()-1);
	
	// 주의사항 : endBlock이 totalPage보다 클 수 있다. endBlock의 값을 totalPage로 바꿔줌
	if (paging.getEndBlock()>paging.getTotalPage()) {
		paging.setEndBlock(paging.getTotalPage());
	}
	
	// DB처리
	List<VO> list = DAO.getList(paging);
	request.setAttribute("list", list);
	//beginBlock과 endBlock을 사용하기 위해서 paging에 저장
	request.setAttribute("paging", paging);

	return "view/list.jsp";
}
}
