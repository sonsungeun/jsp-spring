package com.ict.edu1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.model.cmd01;
import com.ict.model.cmd02;
import com.ict.model.cmd03;

@WebServlet("/Ex19")
public class Ex19 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String cmd = request.getParameter("cmd");
		String result = "";
		switch (cmd) {
		case "1":
			cmd01 c01 = new cmd01();
			result=c01.exec(request, response);
			break;
		case "2":
			cmd02 c02 = new cmd02();
			result=c02.exec(request, response);
			break;
		case "3":
			cmd03 c03 = new cmd03();
			result=c03.exec(request, response);
			break;
		}
		out.println("<h2>결과</h2>");
		out.println("<h2>"+result+"</h2>");
		
	}

}
