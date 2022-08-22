package com.company.biz.member;

import java.sql.Date;

public class MemberVO {
	private int custno;
	private String custname;
	private String phone;
	private String address;
	private String grade;
	private String city;
	private Date regdate;
	
	public int getCustno() {
		return custno;
	}
	public void setCustno(int custno) {
		this.custno = custno;
	}
	public String getCustname() {
		return custname;
	}
	public void setCustname(String custname) {
		this.custname = custname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "MemberVO [custno=" + custno + ", custname=" + custname + ", phone=" + phone + ", address=" + address
				+ ", grade=" + grade + ", city=" + city + ", regdate=" + regdate + "]";
	}
	
}
