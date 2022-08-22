package com.company.biz.board;

import java.util.ArrayList;

import com.company.biz.board.impl.BoardDAO;

public class GetBoardListTest {
	public static void main(String[] args) {
		BoardDAO dao = new BoardDAO();
		ArrayList<BoardVO> boardList = dao.getBoardList();
		
		for(BoardVO board : boardList) {
//			System.out.println(board); 
			System.out.println(board.getSeq());
			System.out.println(board.getTitle());
			System.out.println(board.getNickname());
			System.out.println(board.getContent());
		}
	}
}
