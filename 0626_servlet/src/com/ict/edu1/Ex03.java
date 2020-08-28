package com.ict.edu1;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Random;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex03")
public class Ex03 extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 요청에 대한 한글 처리
		// 2. 응답에 대한 한글 처리 및 HTML문서
		response.setContentType("text/html; charset=UTF-8");
		// 3. 웹브라우저에 HTML 출력하게 하는 코딩 처리
		PrintWriter out = response.getWriter();
		
		// 4.

out.print("<!DOCTYPE html>");
out.print("<html>");
out.print("<head>");
out.print("<meta charset='UTF-8'>");
out.print("<title>오늘운세</title>");
out.print("</head>");
out.print("<body>");
out.print("<h1> 오늘의 운세 </h1>");
// 오늘날짜구하기
Calendar now = Calendar.getInstance();
int year = now.get(Calendar.YEAR);
int month = now.get(Calendar.MONTH+1);
int date = now.get(Calendar.DAY_OF_MONTH);
Random ran = new Random();
int score = (int)(ran.nextDouble()*101);	//0~100까지 랜덤값 구하기
out.println(year+"년"+month+"월"+date+"일의 운수 : "+score+" % 입니다.");
out.println("<hr>"); 
//요청정보들을 출력해보자
out.println("<h3><ul>");
out.println("<li>"+request.getRemoteAddr()+"</li>");
out.println("<li>"+request.getRemoteHost()+"</li>");
out.println("<li>"+request.getRemotePort()+"</li>");
out.println("<li>"+request.getRemoteUser()+"</li>");
out.println("<li>"+request.getContextPath()+"</li>");
out.println("<li>"+request.getRequestURI()+"</li>");
out.println("</ul></h3>");
out.print("</body><br>");
out.print("</html><br>");
	}

}
