package com.ict.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.DAO;
import com.ict.db.VO;

public class IdChkCommand implements Command {
@Override
public String exec(HttpServletRequest request, HttpServletResponse response) {
	String m_id = request.getParameter("m_id");

	//해당 m_id 파라미터 값이 db에 존재하는지 여부 검사
	List<VO> list = DAO.getIdChk(m_id);
	String msg = null;
	if (list.size()>0) {
		msg = "사용불가";
	}else {
		msg = "사용가능";
	}
	return msg;
}
}
