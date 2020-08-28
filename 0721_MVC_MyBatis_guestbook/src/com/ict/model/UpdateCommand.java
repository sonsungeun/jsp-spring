package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateCommand implements Command{
@Override
public String exec(HttpServletRequest request, HttpServletResponse response) {
	// update페이지로 이동
	return "view/update.jsp";
}
}
