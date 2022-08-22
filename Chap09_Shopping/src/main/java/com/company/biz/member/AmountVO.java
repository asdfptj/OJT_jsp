package com.company.biz.member;

public class AmountVO {
	private int custno;
	private int price;
	private String custname;
	private String grade;
	public int getCustno() {
		return custno;
	}
	public void setCustno(int custno) {
		this.custno = custno;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getCustname() {
		return custname;
	}
	public void setCustname(String custname) {
		this.custname = custname;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	@Override
	public String toString() {
		return "AmountVO [custno=" + custno + ", price=" + price + ", custname=" + custname + ", grade=" + grade + "]";
	}
	
}
