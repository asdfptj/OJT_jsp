package com.company.part08;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class A02ContextInit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// doGet, doPost 어디에서든지 ServletContext를 사용할 수 있도록 멤버변수로 선언
	ServletContext ctx = null;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		
		// ServletContext 객체 초기화
		ctx = config.getServletContext();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// web.xml에 등록된 email과 address값 취득 (값은 문자열)
		// ServletContext => 프로젝트에 관리 객체
		// ServletContext ctx = getServletContext();
		String email = ctx.getInitParameter("email");
		String address = ctx.getInitParameter("address");
		
		// A01ContextInit에서 동적으로 추가한 tel과 age 값을 불러와 사용
		// 사용하고자 하는 타입으로 다운캐스팅이 필수(***)
		// Object telObj = "010-1323-4567";
		// int tel = (String) telObj;
		
		// long x = 100L;
		// int y = (int) x;
		String tel = (String) ctx.getAttribute("tel");
		int age = (int) ctx.getAttribute("age");
		
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<h1>A01 Contact Init</h1>");
		out.println("<div>E-Mail: " + email + "</div>");
		out.println("<div>Address: " + address + "</div>");
		out.println("<div>Tel: " + tel + "</div>");
		out.println("<div>Age: " + age + "</div>");
		
		// ServletContext에 있는 값을 삭제
		ctx.removeAttribute("tel");
		ctx.removeAttribute("age");
		
		
		out.println("<div><a href='A01ContextInit'>A01ContextInit</a></div>");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
