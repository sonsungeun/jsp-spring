package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class cmd03 {
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String msg = "";	//결과를 받을 html 파일 이름
		//일처리
		msg = "당신의 ip주소는"+request.getLocalAddr()+"입니다.";
		return msg;
	}

}
