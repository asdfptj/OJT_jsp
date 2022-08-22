package com.company.part06;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class P200Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 넘겨주는 HTML의 문자셋 코드에 맞추어 받기전에 디코딩 문자셋을 지정해 주어야 한다
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		
		// 출력(response)문자열의 타입과 문자셋 지정
		// PrintWrite 객체보다 먼저 정의를 해야 한다.
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		// if (id != null && id.length() != 0) {};		// 필요에 따라 검증
		if (id.equals("admin") && password.equals("관리자123")) {
			out.println("관리자님 방문 환영합니다");
		} else {
			// out.println("아이디 또는 비밀번호가 틀립니다");
			
			// P263 페이지 읽어보기
			response.sendRedirect("login.html");
		}
		
		
	}

}
