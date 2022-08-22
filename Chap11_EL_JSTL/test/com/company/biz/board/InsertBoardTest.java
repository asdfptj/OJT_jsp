package com.company.biz.board;

import com.company.biz.board.impl.BoardDAO;

public class InsertBoardTest {
	public static void main(String[] args) {
		BoardVO params = new BoardVO();
		params.setNickname("흥부");
		params.setTitle("흥부 타이틀");
		params.setContent("흥부 컨텐츠");
		
		BoardDAO dao = new BoardDAO();
//		int num = dao.insertBoard("놀부", "타이틀", "내용");
		int num = dao.insertBoard(params);
		
		if(num != 0) {
			System.out.println(num + "개가 제대로 입력됨");
		} else {
			System.out.println("실행된 것이 없음");
		}
	}
}
