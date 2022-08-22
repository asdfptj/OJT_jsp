package com.company.jstl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.biz.board.BoardVO;
import com.company.biz.board.impl.BoardDAO;

@WebServlet("/jstl/A02For")
public class A02For extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDAO dao = new BoardDAO();
		ArrayList<BoardVO> boardList = dao.getBoardList();
		
		String[] name = {"놀부", "흥부", "향단"};
		
		ArrayList<String> fruit = new ArrayList<String>();
		fruit.add("수박");
		fruit.add("망고");
		fruit.add("참외");
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("one", 10);
		map.put("two", 20);
		map.put("three", 30);
		
		request.setAttribute("boardList", boardList);
		request.setAttribute("name", name);
		request.setAttribute("fruit", fruit);
		request.setAttribute("map", map);
		
		RequestDispatcher view = request.getRequestDispatcher("A02_For.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
