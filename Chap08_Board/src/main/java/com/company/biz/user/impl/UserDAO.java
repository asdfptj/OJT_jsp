package com.company.biz.user.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.company.biz.user.UserVO;
import com.company.common.JDBCConnection;

public class UserDAO {
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	// 사용해야 할 값을 UserVO 객체에 묶어서 하나로 넘어오도록 정의.
	public UserVO login(UserVO params) {
		UserVO user = null;
		try {
			conn = JDBCConnection.getConnection();
			
			String sql = "select * from users where id = ? and password = ?";
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, params.getId());
			stmt.setString(2, params.getPassword());
			
			rs = stmt.executeQuery();
			if (rs.next()) {
				String name = rs.getString("name");
				String id = rs.getString("id");
				
				// 묶어서 jsp 파일에 전달할 필요가 있는 경우
				user = new UserVO();
				user.setName(name);
				user.setId(id);
			} 
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(rs, stmt, conn);
		}
		
		// 초기화가 null. 쿼리 결과가 없으면 null이 리턴되고  (user = null)
		// 유저가 있다면 UserVO 객체가 리턴된다.			(user = new UserVO())
		return user;
	}
	
	
	/* 기본 포멧. 여기서부터 시작한다
	public void 메서드명() {
		
		try {
			conn = JDBCConnection.getConnection();
			
			String sql = "";
			stmt = conn.prepareStatement(sql);
			
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(rs, stmt, conn);
		}
	}
	*/
	
}
