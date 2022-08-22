package com.company.view.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.biz.board.BoardVO;
import com.company.biz.board.impl.BoardDAO;

@WebServlet("/updateBoardCtrl")
public class UpdateBoardCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		// DAO 파일은 request, response 객체가 없으므로 여기에서 request, response에 관련된 작업을 한다
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		// DB연결해서 위의 값을 이용해 update query를 실행
		// 이 구문들은 request, response 객체가 필요 없으니 필요한 로직을 DAO에 기술해서 통합 관리
		BoardVO params = new BoardVO();
		params.setTitle(title);
		params.setContent(content);
		params.setSeq(seq);
		
		BoardDAO dao = new BoardDAO();
		dao.updateBoard(params);

		response.sendRedirect("getBoardListCtrl");
	}

}
