package com.company.part08;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class A04Session extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if (id.equals("abc") && password.equals("abc123")) {
			out.println("로그인 성공");
			// Session 객체 생성
			HttpSession session = request.getSession();
			// 처음 만들어지는 session 객체라면 true, 이미 만들어져 있으면 false
			// System.out.println(session.isNew()); 
			
			// 세션 객체에 판단할 임의의 값 하나를 세팅한다
			session.setAttribute("id", id);
			
			response.sendRedirect("A04SessionResult");
		} else {
			// out.println("로그인 실패");
			response.sendRedirect("part08/login.jsp");
		}
	}

}







