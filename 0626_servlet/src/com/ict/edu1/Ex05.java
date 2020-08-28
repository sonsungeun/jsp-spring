package com.ict.edu1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex05")
public class Ex05 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8;");
		PrintWriter out = response.getWriter();
		
		out.print("<!DOCTYPE html>");
		out.print("<html>");
		out.print("<head>");
		out.print("<meta charset=\"UTF-8\">");
		out.print("<title>class Attribute</title>");
		out.print("<style type=\"text/css\">");
		out.print("	.city{background-color:  black;color: white;margin: 20px;padding: 20px;width: 300px;float: left;}");
		out.print("</style>");
		out.print("</head>");
		out.print("<body>");
		out.print("<div>");
		out.print("<div class=\"city\">");
		out.print("<h2>London</h2>");
		out.print("<p>London is the capital of England</p>");
		out.print("</div>");
		out.print("<div class=\"city\">");
		out.print("<h2>Paris</h2>");
		out.print("<p>Paris is the capital of France </p>");
		out.print("</div>");
		out.print("<div class=\"city\">");
		out.print("<h2>Tyoko</h2>");
		out.print("<p>Tyoko is the capital of Japan</p>");
		out.print("</div>");
		out.print("</div>");
		out.print("<div class=\"city\">");
		out.print("<h2>London</h2>");
		out.print("<p>London is the capital of England</p>");
		out.print("</div>");
		out.print("<div class=\"city\">");
		out.print("<h2>Paris</h2>");
		out.print("<p>Paris is the capital of France </p>");
		out.print("</div>");
		out.print("<div class=\"city\">");
		out.print("<h2>Tyoko</h2>");
		out.print("<p>Tyoko is the capital of Japan</p>");
		out.print("</div>");
		out.print("</div>");
		out.print("</body>");
		out.print("</html>");
	}
}
