package com.ict.edu1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex20")
public class Ex20 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		// 1-3 다시 html로 돌아가는것(페이지 이동)
		// request와 response가 	필요하면		 포워딩
		//					   	필요없으면 		리다이렉트
		String cmd = request.getParameter("cmd");
		switch (cmd) {
		case "1":
			response.sendRedirect("ex21_1.html");
			break;
		case "2":
			response.sendRedirect("ex21_2.html");
			break;
		case "3":
			response.sendRedirect("ex21_3.html");
			break;
		}
	
	}

}
