package com.ict.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.network03.DBConnection;
import com.ict.network03.VO;

@WebServlet("/MyController2")
public class MyController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/xml; charset=utf-8");
		PrintWriter out = response.getWriter();
		// 태그로만 이루어진 xml
		DBConnection db = new DBConnection();
		ArrayList<VO> list = db.selectAll3();
		out.println("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		out.println("<members>");
		for (VO vo : list) {
			out.println("<member>");
			out.print("<idx>");
			out.print(vo.getIdx());
			out.println("</idx>");
			out.print("<m_id>");
			out.print(vo.getM_id());
			out.println("</m_id>");
			out.print("<m_pw>");
			out.print(vo.getM_pw());
			out.println("</m_pw>");
			out.print("<m_name>");
			out.print(vo.getM_name());
			out.println("</m_name>");
			out.print("<m_age>");
			out.print(vo.getM_age());
			out.println("</m_age>");
			out.print("<m_reg>");
			out.print(vo.getM_reg());
			out.println("</m_reg>");
			out.println("</member>");
		}
		out.println("</members>");
	}

}
