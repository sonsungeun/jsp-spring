package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HiCommand implements Command {
@Override
public String exec(HttpServletRequest request, HttpServletResponse response) {
	String name = "둘리";
	int age = 24;
	String msg = "Hi~~~";
	
	request.setAttribute("name", name);
	request.setAttribute("age", age);
	request.setAttribute("msg", msg);
	return "view/result.jsp";
}
}
