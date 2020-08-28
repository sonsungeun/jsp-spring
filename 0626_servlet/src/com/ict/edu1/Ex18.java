package com.ict.edu1;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex18")
public class Ex18 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String com = request.getParameter("com");
		
		switch (com) {
		case "1":
			Calendar now= Calendar.getInstance();
			int year = now.get(Calendar.YEAR);
			int month = now.get(Calendar.MONTH+1);
			int  date = now.get(Calendar.DATE);
			out.println("<h2>오늘날짜</h2>");
			out.println("<h2>"+year+"년"+month+"월"+date+"일"+"</h2>");
			break;
		case "2":
			int luck = (int)(Math.random()*101);
			out.println("<h2>오늘운수</h2>");
			out.println("<h2>당신의 오늘 운수는 "+luck+"%입니다.</h2>");
			break;
		case "3":
			String ip = request.getRemoteAddr();
			out.println("<h2>IP구하기</h2>");
			out.println("<h2>당신의 IP주소는 "+ip+"입니다.</h2>");
			break;
		}
	}

}
