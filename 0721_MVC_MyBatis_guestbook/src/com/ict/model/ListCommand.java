package com.ict.model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.DAO;
import com.ict.db.VO;

public class ListCommand implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 리스트를 보여주기 위한 일처리
		List<VO> list = DAO.getList();
		request.setAttribute("list", list);
		return "view/list.jsp";
	}
}
