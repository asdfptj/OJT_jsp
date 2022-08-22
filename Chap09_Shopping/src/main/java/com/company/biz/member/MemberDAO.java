package com.company.biz.member;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MemberDAO {
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	// 멤버 리스트 출력
	public ArrayList<MemberVO> getMemberList() {
		
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		
		try {
			conn = JDBCConnection.getConnection();
			
			String sql = "select custno, custname, phone, address, joindate, "
					+ "	decode(grade, 'A', 'VIP', 'B', '일반', 'C', '직원') grade, city "
					+ "from member_tbl";
			stmt = conn.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			while(rs.next()) {
				int custno = rs.getInt("custno");
				String custname = rs.getString("custname");
				String phone = rs.getString("phone");
				String address = rs.getString("address");
				Date regdate = rs.getDate("joindate");
				String grade = rs.getString("grade");
				String city = rs.getString("city");
				
				MemberVO member = new MemberVO();
				member.setCustno(custno);
				member.setCustname(custname);
				member.setPhone(phone);
				member.setAddress(address);
				member.setRegdate(regdate);
				member.setGrade(grade);
				member.setCity(city);
				
				list.add(member);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(rs, stmt, conn);
		}
		
		return list;
	}
	
	// 매출 출력
	public ArrayList<AmountVO> getAmount() {
		
		// 리턴할 값은 항상 여기에 정의한다
		ArrayList<AmountVO> list = new ArrayList<AmountVO>();
		
		try {
			conn = JDBCConnection.getConnection();
			
			String sql = "SELECT mem.custno, custname, "
					+ "	decode(grade, 'A', 'VIP', 'B', '일반', 'C', '직원') grade, "
					+ "	sum(price) price "
					+ "FROM member_tbl mem, money_tbl mon "
					+ "WHERE mem.custno = mon.custno "
					+ "GROUP BY mem.custno, custname, grade "
					+ "ORDER BY price desc";
			stmt = conn.prepareStatement(sql);
			
			rs = stmt.executeQuery();
			while(rs.next()) {
				int custno = rs.getInt("custno");
				String custname = rs.getString("custname");
				String grade = rs.getString("grade");
				int price = rs.getInt("price");
				
				AmountVO amount = new AmountVO();
				amount.setCustname(custname);
				amount.setCustno(custno);
				amount.setGrade(grade);
				amount.setPrice(price);
				
				list.add(amount);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(rs, stmt, conn);
		}
		
		return list;
	}
	
	// 사원번호
	public int maxno() {
		int no = 0;
		try {
			conn = JDBCConnection.getConnection();
			
			String sql = "select nvl(max(custno), 0) + 1 as custno from member_tbl";
			stmt = conn.prepareStatement(sql);
	
			rs = stmt.executeQuery();
			if (rs.next()) {
				no = rs.getInt("custno");
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(rs, stmt, conn);
		}
		return no;
	}
	
	// 멤버 추가 
	public int addMember(MemberVO params ) {
		int cnt = 0;
		try {
			conn = JDBCConnection.getConnection();
			
			String sql = "insert into member_tbl(custno, custname, phone, address, joindate, grade, city) "
					+ "values(?, ?, ?, ?, ?, ?, ?) ";
			stmt = conn.prepareStatement(sql);
	
			stmt.setInt(1, params.getCustno());
			stmt.setString(2, params.getCustname());
			stmt.setString(3, params.getPhone());
			stmt.setString(4, params.getAddress());
			stmt.setDate(5, params.getRegdate());
			stmt.setString(6, params.getGrade().toUpperCase());
			stmt.setString(7, params.getCity());
			
			cnt = stmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(rs, stmt, conn);
		}
		return cnt;
	}

	/*
	public void temp() {
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
