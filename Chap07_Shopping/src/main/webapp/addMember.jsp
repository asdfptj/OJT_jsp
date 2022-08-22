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
	
	String sql = "select nvl(max(custno), 0) + 1 as custno from member_tbl";
	stmt = conn.prepareStatement(sql);
	
	rs = stmt.executeQuery();
	
	// 이렇게 외부에 선언된 변수는 이 JSP 파일 어디에서든지 사용 가능
	int maxno = 0;
	if(rs.next()) {
		maxno = rs.getInt("custno");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적 입력</title>
<link rel="stylesheet" type="text/css" href="member.css">
<script type="text/javascript">
	function checkValue() {
		if(document.getElementById("custno").value === "") {
			alert('회원번호가 입력되지 않았습니다');
			document.getElementById("custno").focus();
			return false;
		}
		if(document.getElementById("custname").value === "") {
			alert('회원성명이 입력되지 않았습니다');
			document.getElementById("custname").focus();
			return false;
		}
		if(document.getElementById("phone").value === "") {
			alert('회원전화가 입력되지 않았습니다');
			document.getElementById("phone").focus();
			return false;
		}
		if(document.getElementById("address").value === "") {
			alert('회원주소가 입력되지 않았습니다');
			document.getElementById("address").focus();
			return false;
		}
		if(document.getElementById("joindate").value === "") {
			alert('가입일자가 입력되지 않았습니다');
			document.getElementById("joindate").focus();
			return false;
		}
		if(document.getElementById("grade").value === "") {
			alert('고객등급이 입력되지 않았습니다');
			document.getElementById("grade").focus();
			return false;
		}
		if(document.getElementById("city").value === "") {
			alert('도시코드가 입력되지 않았습니다');
			document.getElementById("city").focus();
			return false;
		}
		
		alert('회원등록이 완료되었습니다.')
		
		return true;
	}
</script>
</head>
<body class="bgColor">

	<%@ include file="header.jsp" %>
	<%@ include file="menu.jsp" %>
	
	<section id="insertForm">
		<h1>홈쇼핑 회원 등록</h1>
		
		<form method="post" action="addMemberCtrl.jsp" onsubmit="return checkValue()">
			
			<table border="1">
				<tr>
					<th>회원번호(자동발생)</th>
					<td><input type="text" name="custno" id="custno" size="10" value="<%=maxno %>"></td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td><input type="text" name="custname" id="custname" size="20" value=""></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input type="text" name="phone" id="phone" size="13" value=""></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><input type="text" name="address" id="address" size="60" value=""></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type="text" name="joindate" id="joindate" size="30" value=""></td>
				</tr>
				<tr>
					<th>고객등급[A:VIP, B:일반, C:직원]</th>
					<td><input type="text" name="grade" id="grade" size="10" value=""></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input type="text" name="city" id="city" size="10" value=""></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit">등록</button>
						<button type="button">조회</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<br>
	<%@ include file="footer.jsp" %>
</body>
</html>
