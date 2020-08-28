package com.ict.edu1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex12")
public class Ex12 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8;");
		PrintWriter out = response.getWriter();
		
		// 페이지 이동 (a링크, 리다이렉트, 포워딩)
		// 1. 리다이렉트 : 페이지 이동하면 기존의 request, response 정보가 사라진다.
		//				새로운 request, response 정보가 만들어진다.
		//				즉, 기존의 파라미터 값들은 사라진다.
		//				주소창의 URL에 변화가 없다.
		// 사용법 : response.sendRedirect("이동할 주소")
		//		  response.sendRedirect("Ex12")			=> servlet으로 이동할 때
		//		  response.sendRedirect("Ex12.html")	=> html문서로 이동할 때
		
		// 넘어온 파라미터 id와 pw를 받아서 저장하자.
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		out.println("<h2> Ex12 </h2>");
		out.println("<h3>");
		out.println("id : "+id);
		out.println("pw : "+pw);
		out.println("</h3>");
	
	}

}
