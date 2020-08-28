package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WriteCommand implements Command {
@Override
public String exec(HttpServletRequest request, HttpServletResponse response) {
	// write페이지로 이동
	return "view/write.jsp";
}
}
