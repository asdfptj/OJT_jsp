package com.company.view.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.company.biz.board.BoardVO;
import com.company.biz.board.impl.BoardDAO;

@WebServlet("/getBoardListCtrl")
public class GetBoardListCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("name");
		if (name == null) response.sendRedirect("login.jsp");
		else {
			BoardDAO dao = new BoardDAO();
			ArrayList<BoardVO> boardList = dao.getBoardList();
			
			// 여기서 가져온 데이터 boardList를 request에 넣는다
			request.setAttribute("boardList", boardList);
			
			// 현재 이 서블릿이 사용하고 있는 request와 response를 지정한 페이지에서 같이 사용하도록
			// 전달한다
			RequestDispatcher view = request.getRequestDispatcher("getBoardList.jsp");
			view.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
