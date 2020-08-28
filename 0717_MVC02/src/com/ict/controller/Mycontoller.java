package com.ict.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.model.Bye;
import com.ict.model.Hello;
import com.ict.model.Hi;

@WebServlet("/Mycontoller")
public class Mycontoller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();	//Ajax에서 이용(자바가 화면을 띄우고 ,그걸 jsp가 끌어다 씀)
		
		String cmd=request.getParameter("cmd");
		String path = "";
		switch (cmd) {
		case "hi":
			Hi hi = new Hi();
			path = hi.exec(request, response);
			break;
		case "hello":
			Hello hello = new Hello();
			path=hello.exec(request, response);
			break;
		case "bye":
			Bye bye = new Bye();
			path=bye.exec(request, response);
			break;
		}
		request.getRequestDispatcher(path).forward(request, response);

	}

}
