package com.ict.edu1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex07")
public class Ex07 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. 요청에 대한 한글 처리
		request.setCharacterEncoding("utf-8");
		// 2. 응답에 대한 한글 처리 및 문서 처리(html)
		response.setContentType("text/html; charset=UTF-8");
		// 3. 출력처리
		PrintWriter out = response.getWriter();

		// 클라이언트가 서버에게 요청하면서 정보를 함께 보낼 수 있다.
		// 이러한 정보를 요청 정보 또는 파라미터라고 한다.
		// 파라미터는 페이지에서 다른 페이지로 이동 할 때도 함께 보내지는 정보를 뜻한다.

		// 파라미터의 자료형은 무조건 String이거나 String[] 이다.
		// get 방식은 주소창에 파라미터가 보인다. (?name=value&name=value)
		// post 방식은 주소창에 파라미터가 보이지 않는다.

		// 파라미터값을 처리하는 메소드들(request)
		// 1. request.getParameter() : String => 파라미터 값이 하나일 떼
		// 2. request.getParameterValues() : String[] => 같은 이름의 파라미터가 여러개일 떼
		// 3. request.getParameterMap() => 맵 방식의 파라미터 받을 때
		// 3. request.getParameterNames() => 열거형의 파라미터를 받을 때

		// 만약에 이름(name)과 나이(age)가 파라미터 값으로 넘어왔을 때 처리하는 방법
		out.print("<h2> 서블릿 파라미터 예제 </h2>");
		String name = request.getParameter("name");
		String age =request.getParameter("age");
		out.println("<h3>");
		out.println("<p>이름 : "+name+"</p>");
		out.println("<p>나이 : "+age+"</p>");
		out.println("</h3>");
		out.println("<hr>");
		
		// su1, su2 파라미터에 숫자값이 들어와서 더하기 한 결과를 출력하자
		int su1 = Integer.parseInt(request.getParameter("su1"));
		int su2 = Integer.parseInt(request.getParameter("su2"));
		out.println("<h3>");
		out.println("결과 : "+su1+" + "+su2+" = "+(su1+su2));
		out.println("</h3>");

	}

}
