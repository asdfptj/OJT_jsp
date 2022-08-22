package com.company.biz.board;

import java.util.ArrayList;

import org.junit.After;
import org.junit.Assert;
import org.junit.Test;

import com.company.biz.board.impl.BoardDAO;

public class JUnitBoardTest {
	
	@After
	public void getBoardList() {
		System.out.println("---------------- getBoardList ----------------");
		BoardDAO dao = new BoardDAO();
		ArrayList<BoardVO> boardList = dao.getBoardList();
		
		for (BoardVO board : boardList) {
			System.out.println(board);
		}
	}
	
	@Test
	public void getBoard() {
		System.out.println("---------------- getBoard ----------------");
		BoardDAO dao = new BoardDAO();
		BoardVO board = dao.getBoard(1);
		
		System.out.println(board);
	}
	
	@Test
	public void insertBoard() {
		System.out.println("---------------- insertBoard ----------------");
		BoardVO params = new BoardVO();
		params.setTitle("jUnit Test");
		params.setNickname("JUnit");
		params.setContent("JUnit Content");
		
		BoardDAO dao = new BoardDAO();
		int cnt = dao.insertBoard(params);
		
		Assert.assertEquals(cnt, 1);
	}
	
}
