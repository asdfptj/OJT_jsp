package com.company.part08;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 프로젝트 전체에서 데이터를 공유
// 1. 참조만 가능한 변수 => web.xml에 등록한다
public class A01ContextInit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// web.xml에 등록된 email과 address값 취득 (값은 문자열)
		// ServletContext => 프로젝트에 관리 객체
		ServletContext ctx = getServletContext();
		String email = ctx.getInitParameter("email");
		String address = ctx.getInitParameter("address");
		
		
		// 프로젝트관리 객체 ServletContext에 key: value 형태로 값을 추가할 수 있다.
		// 추가된 이후로는 어떤 Servlet / JSP에서도 참조가 가능하다
		// 값을 넣을때는 모두 Object 타입으로 대입한다
		// Object tel = "010-1234-5678";
		// Object age = 30;
		ctx.setAttribute("tel", "010-1234-5678");
		ctx.setAttribute("age", 30);
		
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<h1>A01 Contact Init</h1>");
		out.println("<div>E-Mail: " + email + "</div>");
		out.println("<div>Address: " + address + "</div>");
		
		out.println("<div><a href='A02ContextInit'>A02ContextInit</a></div>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
