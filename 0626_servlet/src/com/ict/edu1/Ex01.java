package com.ict.edu1;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// URL mapping : 웹에서 해당 페이지를 호출하는 이름
//				 locathost:8090/프로젝트이름/URL mapping(Ex01)
@WebServlet("/Ex01")
public class Ex01 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Ex01() {
        super();
        System.out.println("서블릿 페이지 생성자");
        // init() 자동으로 호출
    }

	public void init(ServletConfig config) throws ServletException {
		// 생성자 역할을 하는 메소드
		// servlet 객체 초기화 역할, 최초로 한번만 호출한다.
		System.out.println("init()");
		// service() 자동으로 호출
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// request : 클라이언트에서 들어온 요청정보를 가지고 있는 ~
		// response : 클라이언트에게 결과를 보여 줄 수 있는 응답정보를 가지고 있는 ~
		
		// 사용자 요청방식에 따라 알맞는 메소드를 자동으로 호출하는 역할을 한다.
		// 요청방식 : post 방식 ; body에 정보를 담아서 보내는 방식, 대용량, 내용 안보임, doPost() 호출	(:=편지지에 쓰는것)
		//			  get 방식  ; head에 정보를 담아서 보내는 방식, 소용량, 내용   보임, doGet()호출 	(:=편지봉투에 쓰는것)  
		//			  요청방식을 표시하지 않으면 get 방식을 따른다. 속도가 빠르다.
		System.out.println("service()");
		if (request.getMethod().equalsIgnoreCase("get")) {
			doGet(request, response);
		}else if (request.getMethod().equalsIgnoreCase("post")) {
			doPost(request, response);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet()");
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost()");
	}
	
	// 해당 프로젝트를 tomcat에서 내려올 때 사용되는 메소드
	public void destroy() {
		System.out.println("destroy()");
	}

}
