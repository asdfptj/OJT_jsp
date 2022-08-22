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
	String city = request.getParameter("city");
	
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;

	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	conn = DriverManager.getConnection(url, "hr", "hr");

	// Query 복붙 할때 주의
	// 1. 개행 할 경우 마지막에 하나의 스페이스를 띄운다
	// 2. 쿼리 마지막에 ;는 반드시 삭제한다
	
	// 컬럼 이름을 생략한 것은 컬럼의 모든 값이 순차적으로 입력되기 때문이다.
	// 그렇지 않은 경우는 컬럼명을 기술해야 한다 
	// insert into member_tbl(custno, custname, address, phone...) values(?, ?, ?, ?, ?, ?, ?)
	String sql = "insert into member_tbl values(?, ?, ?, ?, ?, ?, ?)";
	stmt = conn.prepareStatement(sql);
	
	// ?의 변수값 세팅. 순서는 항상 1번부터 시작한다
	// 컬럼명을 기술하지 않았으므로 순서는 테이블 작성시 선언한 순서대로 입력해야 한다.
	stmt.setInt(1, custno);
	stmt.setString(2, custname);
	stmt.setString(3, phone);
	stmt.setString(4, address);
	// YYYY-MM-DD, YYYY/MM/DD  타입 이외는 자동 캐스팅이 이루어지지 않는다
	stmt.setDate(5, joindate);			// 쿼리에서 ?를 to_date(joindatem 'YYYY-MM-DD') 형태로 변경
	stmt.setString(6, grade.toUpperCase());
	stmt.setString(7, city);
	
	int cnt = stmt.executeUpdate();
	
	response.sendRedirect("getMemberList.jsp");
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