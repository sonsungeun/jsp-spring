package com.ict.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.DAO;
import com.ict.db.VO;

public class DeptCommand implements Command{
@Override
public String exec(HttpServletRequest request, HttpServletResponse response) {
	//
	String dept_id = request.getParameter("dept_id");
	List<VO> d_list =DAO.getDeptList(dept_id);
	request.setAttribute("d_list", d_list);
	return "view/result_dept.jsp";
}
}
