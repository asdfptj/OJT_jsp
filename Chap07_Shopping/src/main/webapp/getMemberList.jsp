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

String sql = "select custno, custname, phone, address, joindate,"
		+ "decode(grade, 'A', 'VIP', 'B', '일반', 'C', '직원') grade, city "
		+ "from member_tbl";
stmt = conn.prepareStatement(sql);

rs = stmt.executeQuery();
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
	while(rs.next()) {
		int custno = rs.getInt("custno");
		String custname = rs.getString("custname");
		String phone = rs.getString("phone");
		String address = rs.getString("address");
		Date joindate = rs.getDate("joindate");
		String grade = rs.getString("grade");
		String city = rs.getString("city");
%>
			<tr>
				<td><%=custno %></td>
				<td><%=custname %></td>
				<td><%=phone %></td>
				<td><%=address %></td>
				<td><%=joindate %></td>
				<td><%=grade %></td>
				<td><%=city %></td>
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
<%
	rs.close();
	stmt.close();
	conn.close();
%>