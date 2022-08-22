package com.company.view.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.company.biz.board.BoardVO;
import com.company.biz.board.impl.BoardDAO;

@WebServlet("/getBoardCtrl")
public class GetBoardCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));

		BoardDAO dao = new BoardDAO();
		BoardVO board = dao.getBoard(num);
		
		// 로그인 처리
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("name");
		if (name == null) response.sendRedirect("login.jsp");
		else {
			request.setAttribute("board", board);
			
			RequestDispatcher view = request.getRequestDispatcher("getBoard.jsp");
			// 여기서 사용한 request와 response를 getBoard.jsp로 전달
			// request에 getBoard.jsp에서 사용할 데이터가 들어가 있음
			view.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
