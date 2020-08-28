package com.ict.edu1;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.digester.SetPropertiesRule;

@WebServlet("/Ex04")
public class Ex04 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. 요청에 의한 한글 처리
		// 2. 응답을 위한 한글 처리 및 문서 처리 (html)
		response.setContentType("text/html; charset=UTF-8;");
		// 3. 출력 처리
		PrintWriter out = response.getWriter();

		out.print("<!DOCTYPE html>");
		out.print("<html>");
		out.print("<head>");
		out.print("<meta charset='UTF-8'>");
		out.print("<title>표</title>");
		out.print("<style type = 'text/css'>");
		out.print("table, th, td{border : 2px solid black;}");
		out.print("thead{background-color:tomato;}");
		out.print("table{width:700px; margin:auto;background-color:lime;}");
		out.print("</style>");
		out.print("</head>");
		out.print("<body>");
		out.println("<table><br>");
		out.println("<thead><br>");
		out.println("<tr><th>방이름</th><th>대상</th><th>크기</th><th>가격</th></tr><br>");
		out.println("</thead><br>");
		out.println("<tbody><br>");
		out.println("<tr><td>유채방</td><td>여성</td><td rowspan='3'>4인실</td><td rowspan='4'>1인 20,000원</td></tr><br>");
		out.println("<tr><td rowspan='2'>동백방</td><td>동성</td></tr><br>");
		out.println("<tr><td>가족</td></tr><br>");
		out.println("<tr><td>유채방</td><td>누구나</td><td>2인실</td></tr><br>");
		out.println("</tbody>");
		out.println("</table>");
		out.println("<hr>");
		//요청정보들을 출력해보자
		out.println("<h3><ul>");
		out.println("<li>" + request.getRemoteAddr() + "</li>");
		out.println("<li>" + request.getRemoteHost() + "</li>");
		out.println("<li>" + request.getRemotePort() + "</li>");
		out.println("<li>" + request.getRemoteUser() + "</li>");
		out.println("<li>" + request.getContextPath() + "</li>");
		out.println("<li>" + request.getRequestURI() + "</li>");
		out.println("</ul></h3>");
		out.print("</body><br>");
		out.print("</html><br>");

	}

}
