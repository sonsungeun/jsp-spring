package com.ict.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.SendResult;

import com.ict.model.Hi;

@WebServlet("/HiController")
public class HiController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=utf-8");
	PrintWriter out = response.getWriter();
	// 실행할 클래스를 객체로 만든다.
	Hi hi = new Hi();
	// 실행 시키고 jsp정보를 받는다.
	String path = hi.exec(request, response);
	// jsp 화면으로 페이지 이동
	//response.sendRedirect(path);
	request.getRequestDispatcher(path).forward(request, response);
	}

}
