package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloCommand implements Command {
@Override
public String exec(HttpServletRequest request, HttpServletResponse response) {
	String name = "임꺽정";
	int age = 49;
	String msg = "Hello~~~~";
	request.setAttribute("name", name);
	request.setAttribute("age", age);
	request.setAttribute("msg", msg);

	// 리턴은 결과를 표시할 뷰(jsp)를 지정한다.
	return "view/result.jsp";
}
}