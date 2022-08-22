package com.company.biz.member;

import java.sql.Date;

public class TestMemberList {
	public static void main(String[] args) {
		
		MemberVO params = new MemberVO();
		params.setCustno(100010);
		params.setCustname("한글");
		params.setPhone("010-1234-5678");
		params.setAddress("서울");
		params.setRegdate(Date.valueOf("2022-06-09"));
		params.setGrade("A".toUpperCase());
		params.setCity("60");
		
		MemberDAO dao = new MemberDAO();
		
		int no = dao.addMember(params);
		System.out.println(no);
	}
}
