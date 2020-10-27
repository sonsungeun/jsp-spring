package com.ict.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/MyMember")
public class MyMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		// 세션에 저장된 access_token을 가져 오기 
		HttpSession session = request.getSession();
		String access_token = (String)session.getAttribute("access_token");
		String token = access_token;
		
		// 사용자 정보 요청에 필요한 URL
		String header = "Bearer " + token; 
		String apiUrl = "https://kapi.kakao.com/v2/user/me";

		Map<String, String> requestHeaders = new HashMap<String, String>();
		requestHeaders.put("Authorization", header);
		
		StringBuilder responseBody = new StringBuilder();
		try {
			URL url = new URL(apiUrl);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			
			// POST 요청을 위해 기본값이 false인 setDoOutput을 true
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			
			for(Map.Entry<String, String> k : requestHeaders.entrySet()) {
	            conn.setRequestProperty(k.getKey(), k.getValue());
	        }

			int responseCode = conn.getResponseCode();
		    if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
		     	 InputStreamReader streamReader 
		     	 		= new InputStreamReader(conn.getInputStream());
		         BufferedReader lineReader 
		     	 		= new BufferedReader(streamReader);
			     String line;
			     while ((line = lineReader.readLine()) != null) {
			           responseBody.append(line);
			      }
		      } else { // 에러 발생
		           responseBody.append("실패");
		      }
		} catch (Exception e) {
		}
		out.println(responseBody.toString());
	}	
}
