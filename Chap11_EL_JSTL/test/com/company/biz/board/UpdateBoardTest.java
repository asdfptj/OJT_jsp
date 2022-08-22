package com.company.biz.board;

import com.company.biz.board.impl.BoardDAO;

public class UpdateBoardTest {
	public static void main(String[] args) {
		BoardVO params = new BoardVO();
		params.setTitle("수정된 타이틀");
		params.setContent("수정된 컨텐츠");
		params.setSeq(8);
		
		BoardDAO dao = new BoardDAO();
		int cnt = dao.updateBoard(params);
		
		if(cnt != 0) {
			System.out.println(cnt + "개가 수정됨");
		} else {
			System.out.println("수정된 사항이 없음");
		}
	}
}
