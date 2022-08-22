package com.company.el;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/expression/A07Data")
public class A07Data extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] name = {"놀부", "흥부", "향단"};
		
		ArrayList<String> fruit = new ArrayList<String>();
		fruit.add("수박");
		fruit.add("망고");
		fruit.add("참외");
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("one", 10);
		map.put("two", 20);
		map.put("three", 30);
		
		// VO 타입
		PersonVO vo = new PersonVO();
		vo.setAddress("서울");
		vo.setAge(100);
		vo.setName("NolBu");
		
		request.setAttribute("name", name);
		request.setAttribute("fruit", fruit);
		request.setAttribute("map", map);
		request.setAttribute("vo", vo);
		RequestDispatcher view = request.getRequestDispatcher("A07_GetData.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
