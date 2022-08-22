package com.company.biz.board;

import com.company.biz.board.impl.BoardDAO;

public class GetBoardTest {
	public static void main(String[] args) {
		BoardDAO dao = new BoardDAO();
		BoardVO board = dao.getBoard(3);
		
		System.out.println(board);
	}
}
