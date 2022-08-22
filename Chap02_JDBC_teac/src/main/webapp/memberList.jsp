<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
try {
	// 1. 사용하는 Db의 Jar 파일을 로드
	// 이름은 Database 별로 이름이 정의되어 있음.
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	// 2. DB 연결
	// DB IP Address, ID, Password
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	Connection conn = DriverManager.getConnection(url, "hr", "hr");	// "system", "1234"
	
	// 3. 쿼리 친다 (실행할 쿼리 준비)
	String sql = "SELECT * FROM member_tbl "
			+ "ORDER BY custno";
	
	// PreparedStatement는 Query에 관련된 세팅 처리를 모두 처리한다  
	// Query 준비하고 Enter를 치기 전까지 처리
	PreparedStatement stmt = conn.prepareStatement(sql);
	
	// 4. Query에 들어갈 변수를 세팅한다 - 여기서는 없음
	
	// 5. 실행
	// executeQuery() => select 구문. 결과 처리를 위한 ResultSet 객체를 리턴
	// executeUpdate() => insert, update, delete. Query 실행 회수를 돌려준다(int)
	ResultSet rs = stmt.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Member List</h1>
	
	<table border="1" width="800">
		<tr>
			<td>ID</td>
			<td>Name</td>
			<td>Tel</td>
			<td>Address</td>
			<td>Grade</td>
			<td>City</td>
		</tr>
<%
	// 6. 받은 결과를 처리한다
	// rs는 Query 처리 결과의 각 row 값 
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
			<td><%=city %></td>
		</tr>
<%
	}
	
	
	// 7. 사용한 리소스는 반드시 닫아준다.
	// ResultSet, PreparedStatement, Connection
	// 닫는 순서는 나중에 사용한 것 부터 닫는다
	rs.close();
	stmt.close();
	conn.close();
	
} catch (ClassNotFoundException e) {
	e.printStackTrace();
} catch (SQLException e) {
	e.printStackTrace();
}
%>
		
	</table>
</body>
</html>