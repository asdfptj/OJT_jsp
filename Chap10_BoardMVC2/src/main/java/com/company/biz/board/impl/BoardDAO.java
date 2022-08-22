package com.company.biz.board.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.company.biz.board.BoardVO;
import com.company.common.JDBCConnection;

public class BoardDAO {
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	public ArrayList<BoardVO> getBoardList() {
		// 배열은 크기가 고정. 동적으로 늘릴 수 없다.
		// ArrayList는 16개(?) 생성 후 다기 전에 동적으로 크기 추가
		// DB의 값은 몇개 있는지 알 수 가 없음 (계속 추가 삭제가 이루어짐)
		ArrayList<BoardVO> boardList = new ArrayList<BoardVO>();
					
		try {	
			conn = JDBCConnection.getConnection();
			
			String sql = "select * from board order by seq desc";
			stmt = conn.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			while(rs.next()) {
				// Db에 한 줄의 row 값을 담을 VO 객체를 생성하고 각 컬럼 값을 생성한 VO 객체에 담는다
				BoardVO board = new BoardVO();
				board.setSeq(rs.getInt("seq"));
				board.setNickname(rs.getString("nickname"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setRegdate(rs.getDate("regdate"));
				board.setCnt(rs.getInt("cnt"));
				board.setUserid(rs.getString("userid"));
				
				// 한줄에 대한 처리가 끝났으면 반복하기 전에 배열에 담아 저장한다
				boardList.add(board);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(rs, stmt, conn);
		}
		
		return boardList;
	}
	
	
	public BoardVO getBoard(int num) {
		// BoardVO board = new BoardVO();
		BoardVO board = null;
		
		try {	
			conn = JDBCConnection.getConnection();
			
			String sql = "select * from board where seq = ?";
			stmt = conn.prepareStatement(sql);
			
			stmt.setInt(1, num);
			
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				int seq = rs.getInt("seq");
				String nickname = rs.getString("nickname");
				String title = rs.getString("title");
				String content = rs.getString("content");
				Date regdate = rs.getDate("regdate");
				int cnt = rs.getInt("cnt");
				String userid = rs.getString("userid");
				
				board = new BoardVO();
				board.setSeq(seq);
				board.setNickname(nickname);
				board.setTitle(title);
				board.setContent(content);
				board.setRegdate(regdate);
				board.setCnt(cnt);
				board.setUserid(userid);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(rs, stmt, conn);
		}
		
		return board;
	}
	
	
	// public int insertBoard(String nickname, String title, String content) {
	public int insertBoard(BoardVO params) {
		
		int cnt = 0;
		try {
			conn = JDBCConnection.getConnection();
			
			String sql = "insert into board(seq, nickname, title, content) "
					+ "values((select nvl(max(seq), 0) + 1 from board), ?, ?, ?)";
			stmt = conn.prepareStatement(sql);
			
			// ?의 값을 넘어오는 매개변수로 세팅 
			stmt.setString(1, params.getNickname());
			stmt.setString(2, params.getTitle());
			stmt.setString(3, params.getContent());
			
			// 실행
			cnt = stmt.executeUpdate();
			conn.commit();
		} catch(Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			JDBCConnection.close(rs, stmt, conn);
		}
		return cnt;
	}
	
	public int deleteBoard(BoardVO params) {
		int cnt = 0;
		try {
			conn = JDBCConnection.getConnection();
			
			String sql = "delete from board where seq = ?";
			stmt = conn.prepareStatement(sql);
			
			// 위의 query에 따라 여기서부터 다르다.
			stmt.setInt(1, params.getSeq());
			cnt = stmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(rs, stmt, conn);
		}
		return cnt;
	}
	
	public int updateBoard(BoardVO params) {

		int cnt = 0;
		try {
			conn = JDBCConnection.getConnection();
			
			String sql = "update board set title = ?, content = ? where seq = ?";
			stmt = conn.prepareStatement(sql); 
			
			// ?의 값을 넘어오는 매개변수로 세팅 
			stmt.setString(1, params.getTitle());
			stmt.setString(2, params.getContent());
			stmt.setInt(3, params.getSeq());
			
			cnt = stmt.executeUpdate();
			conn.commit();
		} catch(Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			JDBCConnection.close(rs, stmt, conn);
		}
		return cnt;
	}
	
}


















