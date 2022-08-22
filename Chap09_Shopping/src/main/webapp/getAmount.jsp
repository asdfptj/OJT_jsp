<%@page import="com.company.biz.member.AmountVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.company.biz.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDAO dao = new MemberDAO();
	ArrayList<AmountVO> list = dao.getAmount();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출 조회</title>
<link rel="stylesheet" type="text/css" href="member.css">
</head>
<body class="bgColor">
	
	<%@ include file="header.jsp" %>
	<%@ include file="menu.jsp" %>
	
	<div id="amountList">
		<h1>회원매출 조회</h1>
		<br>
		
		<table border="1">
			<thead>
				<tr>
					<th>회원번호</th>
					<th>회원성명</th>
					<th>고객등급</th>
					<th>매출</th>
				</tr>
			</thead>
			<tbody>
<%
	for(AmountVO amount : list) {
%>
				<tr>
					<td><%=amount.getCustno() %></td>
					<td><%=amount.getCustname() %></td>
					<td><%=amount.getGrade() %></td>
					<td><%=amount.getPrice() %></td>
				</tr>
<%
	}
%>
			</tbody>
		</table>
		<br>
		<br>
	</div>
	
	<%@ include file="footer.jsp" %>
</body>
</html>