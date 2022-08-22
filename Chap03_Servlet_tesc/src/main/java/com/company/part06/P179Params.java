package com.company.part06;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class P179Params extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// html의 form 요소로 넘어오는 값은 모두 String 이다
		
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String address = request.getParameter("address");
		
		int qty = Integer.parseInt(request.getParameter("qty"));
		
		String email = request.getParameter("email");
		String url = request.getParameter("url");
		String date = request.getParameter("date");
		String comment = request.getParameter("comment");
		String baseball = request.getParameter("baseball");
		
		// 여러개의 값이 넘어오는 경우는 String 배열로 받는다
		// checkbox, select multi => list
		String[] four = request.getParameterValues("four");
		
		String base = request.getParameter("base");
		
		String[] five = request.getParameterValues("five");
		
		
		// 작성하는 HTML 페이지의 문자셋을 설정한다.
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		out.println("<b>Name: </b>" + name + "<br>");
		out.println("<b>ID: </b>" + id + "<br>");
		out.println("<b>Password: </b>" + password + "<br>");
		out.println("<b>Address: </b>" + address + "<br>");
		out.println("<b>Qty: </b>" + qty + "<br>");
		out.println("<b>email: </b>" + email + "<br>");
		out.println("<b>url: </b>" + url + "<br>");
		out.println("<b>date: </b>" + date + "<br>");
		out.println("<b>comment: </b>" + comment + "<br>");
		out.println("<b>baseball: </b>" + baseball + "<br>");
		
		out.println("<b>four: </b><br>");
		for(String item : four) {
			out.println(item + ", ");
		}
		out.println("<br>");
		
		out.println("<b>base: </b>" + base + "<br>");
		
		out.println("<b>five: </b><br>");
		for(String item : five) {
			out.println(item + ", ");
		}
		out.println("<br>");
	}

	
	// form.html에서 method="post"로 지정된 경우
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// POST의 경우 넘어오는 parameter가 어떤 인코딩으로 넘어오는지를 알려줘야
		// 그 값으로 디코딩을 한다. parameter를 받기 전에 설정부터 한다
		request.setCharacterEncoding("UTF-8");
		
		
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String address = request.getParameter("address");
		
		int qty = Integer.parseInt(request.getParameter("qty"));
		
		String email = request.getParameter("email");
		String url = request.getParameter("url");
		String date = request.getParameter("date");
		String comment = request.getParameter("comment");
		String baseball = request.getParameter("baseball");
		
		// 여러개의 값이 넘어오는 경우는 String 배열로 받는다
		// checkbox, select multi => list
		String[] four = request.getParameterValues("four");
		
		String base = request.getParameter("base");
		
		String[] five = request.getParameterValues("five");
		
		
		// 작성하는 HTML 페이지의 문자셋을 설정한다.
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		out.println("<b>Name: </b>" + name + "<br>");
		out.println("<b>ID: </b>" + id + "<br>");
		out.println("<b>Password: </b>" + password + "<br>");
		out.println("<b>Address: </b>" + address + "<br>");
		out.println("<b>Qty: </b>" + qty + "<br>");
		out.println("<b>email: </b>" + email + "<br>");
		out.println("<b>url: </b>" + url + "<br>");
		out.println("<b>date: </b>" + date + "<br>");
		out.println("<b>comment: </b>" + comment + "<br>");
		out.println("<b>baseball: </b>" + baseball + "<br>");
		
		out.println("<b>four: </b><br>");
		for(String item : four) {
			out.println(item + ", ");
		}
		out.println("<br>");
		
		out.println("<b>base: </b>" + base + "<br>");
		
		out.println("<b>five: </b><br>");
		for(String item : five) {
			out.println(item + ", ");
		}
		out.println("<br>");
	}

}
