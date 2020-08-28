package com.ict.model;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class cmd01 {
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String msg = "";	// 처리 결과를 저장할 변수
		//일처리
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);
		int month = now.get(Calendar.MONTH+1);
		int date = now.get(Calendar.DATE);
		
		msg = year+"년"+month+"월"+date+"일";
		return msg;
	}
}
