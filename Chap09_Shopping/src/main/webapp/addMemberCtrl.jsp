<%@page import="com.company.biz.member.MemberVO"%>
<%@page import="com.company.biz.member.MemberDAO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	// DB의 테이블 구조의 타입과 매칭되도록 받을 필요가 있다
	int custno = Integer.parseInt(request.getParameter("custno"));
	String custname = request.getParameter("custname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	Date joindate = Date.valueOf(request.getParameter("joindate"));
	String grade = request.getParameter("grade");
	// String city = request.getParameter("city");
	
	MemberVO params = new MemberVO();
	params.setCustno(custno);
	params.setCustname(custname);
	params.setPhone(phone);
	params.setAddress(address);
	params.setRegdate(joindate);
	params.setGrade(grade);
	params.setCity( request.getParameter("city") );
	
	MemberDAO dao = new MemberDAO();
	int cnt = dao.addMember(params);
	
	if (cnt != 0) {
		response.sendRedirect("getMemberList.jsp");	
	} else {
		response.sendRedirect("addMember.jsp");
	}
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>