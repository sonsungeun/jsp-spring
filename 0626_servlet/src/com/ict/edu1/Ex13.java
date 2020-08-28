package com.ict.edu1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex13")
public class Ex13 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8;");
		PrintWriter out = response.getWriter();
		
		// 페이지 이동 (a링크, 리다이렉트, 포워딩)
		// 1. 포워딩 : 페이지 이동하면 기존의 request, response 정보를 가지고 간다..
		//			 즉, 기존의 파라미터 값들이 살아 있다.
		//			 주소창에 최초 주소가 보인다.
		// 사용법 : request.getRequestDispatcher("이동할 주소").forward(requset,response);
		
		// 넘어온 파라미터 id와 pw를 받아서 저장하자.
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		out.println("<h2> Ex13 </h2>");
		out.println("<h3>");
		out.println("id : "+id+"<br>");
		out.println("pw : "+pw);
		out.println("</h3>");
		
		//request.getRequestDispatcher("Ex14").forward(request, response);
		request.getRequestDispatcher("ex14.html").forward(request, response);
		
	}

}
