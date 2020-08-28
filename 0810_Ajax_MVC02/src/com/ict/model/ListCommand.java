package com.ict.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.DAO;
import com.ict.db.VO;

public class ListCommand implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// DB 정보를 가져오기
		List<VO> list = DAO.getList();
		// 가져온 정보를 xml형식으로 만들기(ajax 처리이기 때문에 뷰 페이지 정보를 리턴하는 것이 아니라 xml,txt,json 등으로 만들어서 controller에 리턴한다.
		
		StringBuffer sb = new StringBuffer();
		sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.append("<members>");
		for (VO k : list) {
			sb.append("<member>");
			sb.append("<idx>"+k.getIdx()+"</idx>");
			sb.append("<id>"+k.getM_id()+"</id>");
			sb.append("<pw>"+k.getM_pw()+"</pw>");
			sb.append("<name>"+k.getM_name()+"</name>");
			sb.append("<age>"+k.getM_age()+"</age>");
			sb.append("<reg>"+k.getM_reg().substring(0,10)+"</reg>");
			sb.append("</member>");
		}
		sb.append("</members>");
		return sb.toString();
	}
}
