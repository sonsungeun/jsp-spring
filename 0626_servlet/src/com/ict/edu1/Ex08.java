package com.ict.edu1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex08")
public class Ex08 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		int su1 = Integer.parseInt(request.getParameter("su1"));
		int su2 = Integer.parseInt(request.getParameter("su2"));
		String cal = request.getParameter("cal");
		out.println("<h3>");
		switch (cal) {
		case "+":
			out.println("결과 : "+su1+cal+su2+" = "+(su1+su2));
			break;
		case "-":
			out.println("결과 : "+su1+cal+su2+" = "+(su1-su2));			
			break;
		case "*":
			out.println("결과 : "+su1+cal+su2+" = "+(su1*su2));
			break;
		case "/":
			out.println("결과 : "+su1+cal+su2+" = "+(su1/su2));
			break;
		}
		out.println("</h3>");

		
	
	}

}
