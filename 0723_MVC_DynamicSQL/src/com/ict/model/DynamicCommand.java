package com.ict.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.DAO;
import com.ict.db.VO;

public class DynamicCommand implements Command {
@Override
public String exec(HttpServletRequest request, HttpServletResponse response) {
	//
	String idx = request.getParameter("idx");
	String keyword = request.getParameter("keyword");
	
	//자바스크립트에서 미리 처리해주는 것이 좋음
	String str = "";
	if(idx.equals("0")||keyword.equals("")) {
		str = "view/index.html";
	}else {
		// 파라미터 값인데 VO에 없으면서 여러개이면 무조건 Map을 사용한다.
		Map<String, String> map = new HashMap<String, String>();
		map.put("idx", idx);
		map.put("keyword", keyword);
		List<VO> dy_list = DAO.getDynamic(map);
		request.setAttribute("dy_list", dy_list);
		request.setAttribute("idx", idx);
		
		str = "view/result_dynamic.jsp";
	}
	return str;
}
}
