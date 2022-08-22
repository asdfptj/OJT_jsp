package com.company.part08;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class A05Request extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		int[] intArr = {10, 20, 30};
		
		request.setAttribute("name", "놀부");
		request.setAttribute("age", 30);
		request.setAttribute("intArr", intArr);
		
		out.println("<h1>A05 Result</h1>");
		
		// 이렇게 이동하면 A05RequestResult에 서블릿 컨테이너가 새로운 
		// request 객체와 response 객체를 새롭게 생성해서 doGet 메서드에 전달한다.
		// 여기서 사용한 request 객체와 response 객체는 이동하는 순간 폐기된다.
		// out.println("<a href='A05RequestResult'>A05RequestResult</a>");
		
		// 일반 링크와 동일하게 request 공유는 되지 않는다.
		// response.sendRedirect("A05RequestResult");
		
		
		// 지금 여기서 사용한 request 객체와 response 객체를 A05RequestResult에 전달하려면
		// RequestDispatcher를 이용한다
		RequestDispatcher view = request.getRequestDispatcher("A05RequestResult");
		
		// 여기서 사용했던 request 객체와 response 객체를 A05RequestResult에 전달하는 명령
		// 서블릿 컨테이너는 새로운 새로운 request 객체와 response 객체를 전달하지 않고
		// 이 request 객체와 response 객체를 전달해서 실행한다
		// 이 명령을 만나면 바로 지정한 페이지로 이동.
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
