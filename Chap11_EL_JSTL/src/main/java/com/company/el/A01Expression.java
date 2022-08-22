package com.company.el;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/expression/A01Expression")
public class A01Expression extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PersonVO person = new PersonVO();
		person.setName("놀부");
		person.setAge(30);
		person.setAddress("Seoul");
		
		// Session
		HttpSession session = request.getSession();
		session.setAttribute("name", "Session Scope");
		session.setAttribute("id", "abc123");
		session.setAttribute("person", person);
		
		
		// Request
		request.setAttribute("name", "Request Scope");
		request.setAttribute("dept", "영업부");
		request.setAttribute("person", person);
		
		
		// ServletContext
		ServletContext ctx = getServletContext();
		ctx.setAttribute("name", "ServletContext Scope");
		ctx.setAttribute("address", "Seoul");
		ctx.setAttribute("person", person);
		
		// request 객체의 값을 참조할 수 없다
//		response.sendRedirect("A01_Expression.jsp");
		RequestDispatcher view = request.getRequestDispatcher("A01_Expression.jsp");
		view.forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
