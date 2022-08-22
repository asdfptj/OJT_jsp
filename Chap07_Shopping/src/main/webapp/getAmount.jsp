<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Connection conn = null;
PreparedStatement stmt = null;
ResultSet rs = null;

Class.forName("oracle.jdbc.driver.OracleDriver");
String url = "jdbc:oracle:thin:@localhost:1521:xe";
conn = DriverManager.getConnection(url, "hr", "hr");

String sql = "SELECT mem.custno, custname, "
				+ "decode(grade, 'A', 'VIP', 'B', '일반', 'C', '직원') grade, "
				+ "sum(price) price "
				+ "FROM member_tbl mem, money_tbl mon "
				+ "WHERE mem.custno = mon.custno "
				+ "GROUP BY mem.custno, custname, grade "
				+ "ORDER BY price desc";
stmt = conn.prepareStatement(sql);

rs = stmt.executeQuery();
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
	while(rs.next()) {
		int custno = rs.getInt("custno");
		String custname = rs.getString("custname");
		String grade = rs.getString("grade");
		int price = rs.getInt("price");
%>
				<tr>
					<td><%=custno %></td>
					<td><%=custname %></td>
					<td><%=grade %></td>
					<td><%=price %></td>
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
<%
	rs.close();
	stmt.close();
	conn.close();
%>