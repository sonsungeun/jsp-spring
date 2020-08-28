package com.ict.model;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

import com.ict.db.DAO;
import com.ict.db.VO;

public class ListCommand implements Command{
@Override
public String exec(HttpServletRequest request, HttpServletResponse response) {
	ArrayList<VO> list = DAO.getInstance().getList(); 
	request.setAttribute("list", list);
	return "view/list.jsp";
}
}
