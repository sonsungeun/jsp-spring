package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Bye {
	// 요청을 실행할 메소드를 만들자
		public String exec(HttpServletRequest request, HttpServletResponse response) {
			String name = "태권브이";
			int age = 19;
			String msg = "Bye";
			request.setAttribute("name", name);
			request.setAttribute("age", age);
			request.setAttribute("msg", msg);

			// 리턴은 결과를 표시할 뷰(jsp)를 지정한다.
			return "view/bye_re.jsp";
		}
}
