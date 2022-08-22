package com.company.part06;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class P215Nine extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int nine = Integer.parseInt(request.getParameter("nine"));
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<script type=text/javascript>");
		if(nine < 0 || nine >= 10) {
			out.println("alert('숫자가 너무 작거나 큽니다')");
			out.println("location.href = 'chap06/nine.html'");
		};
		out.println("</script>");
		
		out.println("<table border='1' width=700>");
		
		for(int i = 1; i < 10; i++) {
			out.println("<tr>");
			out.println("<td>" + nine + "</td>");
			out.println("<td>" + i + "</td>");
			out.println("<td>" + (nine * i) + "</td>");
			out.println("<td>" + nine + " * " + i + " = " + (nine*i) + "</td>");
			out.println("</tr>");
		}
		
		out.println("</table>");
	}

}
