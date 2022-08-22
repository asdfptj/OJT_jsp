package com.company.biz.board;

import com.company.biz.board.impl.BoardDAO;

public class DeleteBoardTest {
	public static void main(String[] args) {
		
		BoardVO params = new BoardVO();
		params.setSeq(10);
		
		BoardDAO dao = new BoardDAO();
		int cnt = dao.deleteBoard(params);
		
		if(cnt != 0) {
			System.out.println(cnt + "개가 삭제됨");
		} else {
			System.out.println("삭제된 사항이 없음");
		}
	}
}
