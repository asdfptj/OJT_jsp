package com.company.part08;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class A03ServletInit extends HttpServlet {
	private static final long serialVersionUID = 1L;       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 서블릿을 등록할때 이 서블릿에서만 사용 가능한 변수 값을 참조해서 사용
		// web.xml 참조
		String name = getInitParameter("name");
		String path = getInitParameter("path");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<h1>A03 Servlet Init</h1>");
		out.println("<div>Name: " + name + "</div>");
		out.println("<div>Path: " + path + "</div>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
