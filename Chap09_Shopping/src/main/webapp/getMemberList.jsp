<%@page import="com.company.biz.member.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.company.biz.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDAO dao = new MemberDAO();
	ArrayList<MemberVO> list = dao.getMemberList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적 조회 / 수정</title>
<link rel="stylesheet" type="text/css" href="member.css">
</head>
<body class="bgColor">

	<%@ include file="header.jsp" %>
	<%@ include file="menu.jsp" %>
	
	<section id="memberList">
		<h1>회원목록 조회/수정</h1>
		<br>
		
		<table id="jumsuList" border="1">
			<tr>
				<th width="10%">회원번호</th>
				<th width="10%">회원성명</th>
				<th width="10%">전화번호</th>
				<th width="10%">주소</th>
				<th width="10%">가입일자</th>
				<th width="10%">고객등급</th>
				<th width="10%">거주지역</th>
			</tr>
<%
	for(MemberVO member : list) {
%>
			<tr>
				<td><%=member.getCustno() %></td>
				<td><%=member.getCustname() %></td>
				<td><%=member.getPhone() %></td>
				<td><%=member.getAddress() %></td>
				<td><%=member.getRegdate() %></td>
				<td><%=member.getGrade() %></td>
				<td><%=member.getCity() %></td>
			</tr>
<%
	}
%>
		</table>
		
	</section>
	<br>
	<%@ include file="footer.jsp" %>
</body>
</html>
