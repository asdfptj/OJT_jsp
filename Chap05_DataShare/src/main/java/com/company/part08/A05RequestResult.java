package com.company.part08;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class A05RequestResult extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String name = (String) request.getAttribute("name");
		int age = (int) request.getAttribute("age");
		int[] intArr = (int[]) request.getAttribute("intArr");
		
		out.println("<h1>A05 Request Result</h1>");
		out.println("<div>Name: " + name + "</div>");
		out.println("<div>Age: " + age + "</div>");
		out.println("<div>Array: " + intArr[0] + "</div>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
