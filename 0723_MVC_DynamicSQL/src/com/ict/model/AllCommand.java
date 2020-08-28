package com.ict.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.DAO;
import com.ict.db.VO;

public class AllCommand implements Command {
@Override
public String exec(HttpServletRequest request, HttpServletResponse response) {
	// 
	List<VO> list = DAO.getAll();
	request.setAttribute("list", list);
	return "view/result_all.jsp";
}
}
