package com.ict.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

@WebServlet("/login")
public class MyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		// 2. 인증코드 받기 
		String code = request.getParameter("code");
		// System.out.println(code);
		
		
		// 인증코드로 토큰 요청
		String reqURL = "https://kauth.kakao.com/oauth/token";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			
			// POST 요청을 위해 기본값이 false인 setDoOutput을 true
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			
			// 파라미터값을 보내기 
			BufferedWriter bw = 
					new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			
			StringBuffer sb = new StringBuffer();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=3b4a6321cd8a2b5b3c9ab33e7ed7e322");
			sb.append("&redirect_uri=http://localhost:8090/login");
			sb.append("&code="+code);
			bw.write(sb.toString());
			bw.flush();
			
			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			
			// 받은 정보(토큰) 읽어보기 
			BufferedReader br =
					new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			String line = "";
			String result = "";
			while((line=br.readLine()) != null) {
				result += line;
			}
			br.close();
			bw.close();
			// out.println(result);
			
			
			// 받은 정보가 JSON이므로 json-sample-1.1.1.jar 를 다운받아서 파싱한다.
			JSONParser parser = new JSONParser();
			Object obj = parser.parse(result.toString());
			JSONObject jobj = (JSONObject)obj;
			
			String access_token = (String)jobj.get("access_token");
			String refresh_token = (String)jobj.get("refresh_token") ;
			
			request.getSession().setAttribute("access_token", access_token);
			request.getSession().setAttribute("refresh_token", refresh_token);
			
			response.sendRedirect("view/result.jsp");
			
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}












