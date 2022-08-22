<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Connection conn = null;
PreparedStatement stmt = null;
ResultSet rs = null;

try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	conn = DriverManager.getConnection(url, "hr", "hr");
	
	String sql = "select * from emp order by id desc";
	stmt = conn.prepareStatement(sql);
	
	rs = stmt.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>A08 Emp</title>
</head>
<body>
	<h1>Emp List</h1>
	
	<table>
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Salary</th>
			<th>PCT</th>
			<th>Hire</th>
			<th>Dept ID</th>
		</tr>
<%	
	while(rs.next()) {
		int id = rs.getInt("id");
		String name = rs.getString("name");
		int salary = rs.getInt("salary");
		double pct = rs.getDouble("pct");
		Date hire = rs.getDate("hire");
		int deptid = rs.getInt("deptid");
%>		
		<tr>
			<td><%=id %></td>
			<td><%=name %></td>
			<td><%=salary %></td>
			<td><%=pct %></td>
			<td><%=hire %></td>
			<td><%=deptid %></td>
		</tr>
<%
	}
%>		
	</table>
</body>
</html>

<%
} catch (Exception e) {
	e.printStackTrace();
} finally {
	if (rs != null) {		// null이변 객체가 대입되지 않았으므로 닫을 것이 없다
		try {
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	if (stmt != null) {		// null이변 객체가 대입되지 않았으므로 닫을 것이 없다
		try {
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	if (conn != null) {		// null이변 객체가 대입되지 않았으므로 닫을 것이 없다
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
%>











