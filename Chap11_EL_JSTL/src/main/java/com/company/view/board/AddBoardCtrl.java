package com.company.view.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.biz.board.BoardVO;
import com.company.biz.board.impl.BoardDAO;

// web.xml에 servlet과 servlet-mapping으로 등록한 작업을 이 어노테이션이 대신 수행한다
// 따라서 web.xml에 동일한 이름이 등록되면 에러
@WebServlet("/addBoardCtrl")
public class AddBoardCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String title = request.getParameter("title");
		String nickname = request.getParameter("nickname");
		String content = request.getParameter("content");
		
		BoardVO params = new BoardVO();
		params.setTitle(title);
		params.setNickname(nickname);
		params.setContent(content);
		
		BoardDAO dao = new BoardDAO(); 
		int cnt = dao.insertBoard(params);
		
		if (cnt != 0) response.sendRedirect("getBoardListCtrl");
	}
}
