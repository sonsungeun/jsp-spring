package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class cmd02 {
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String msg = "";	// 처리 결과를 저장할 변수
		//일처리
		msg = String.valueOf((int)(Math.random()*101));
		return msg;
	}

}
