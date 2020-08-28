 package com.ict.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.model.Command;
import com.ict.model.DeleteCommand;
import com.ict.model.DeleteOKCommand;
import com.ict.model.ListCommand;
import com.ict.model.OnelistCommand;
import com.ict.model.UpdateCommand;
import com.ict.model.UpdateOKCommand;
import com.ict.model.WriteCommand;
import com.ict.model.WriteOkCommand;

@WebServlet("/MyController")
public class MyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();

		Command comm = null;
		String cmd = request.getParameter("cmd");
		switch (cmd) {
		case "list":comm = new ListCommand();	break;
		case "write":comm = new WriteCommand();	break;
		case "writeok":comm = new WriteOkCommand();	break;
		case "onelist":comm = new OnelistCommand();	break;
		case "delete":comm = new DeleteCommand();	break;
		case "deleteok":comm = new DeleteOKCommand();	break;
		case "update":comm = new UpdateCommand();	break;
		case "updateok":comm = new UpdateOKCommand();	break;
		
		}
		String path = comm.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
	}

}
