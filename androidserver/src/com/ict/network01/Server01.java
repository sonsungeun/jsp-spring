package com.ict.network01;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.ServerSocket;
import java.net.Socket;

public class Server01 implements Runnable{
	ServerSocket ss = null;
	Socket s;
	public Server01() {
		try {
			ss = new ServerSocket(8888);
			System.out.println("서버 대기중 ...");
			new Thread(this).start();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	@Override
	public void run() {
		BufferedReader reader = null;
		BufferedWriter writer = null;
		try {
			while (true) {
				s = ss.accept();
				reader = new BufferedReader(new InputStreamReader(s.getInputStream()));
				writer = new BufferedWriter(new OutputStreamWriter(s.getOutputStream()));
				String msg = reader.readLine();
				if(msg.equalsIgnoreCase("exit")) {
					System.out.println("서버 종료");
					break;
				}
				System.out.println("In : " + msg);
				writer.write(msg + System.getProperty("line.separator"));
				writer.flush();
			}
		} catch (Exception e) {
		}
	}
	public static void main(String[] args) {
		new Server01();
	}
}
