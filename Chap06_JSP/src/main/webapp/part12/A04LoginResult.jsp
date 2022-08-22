<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// HttpSession은 JSP에서는 session라는 이름으로 이미 객체화 되어 있음(내장객체)
	String id = (String) session.getAttribute("id");

	// 로그인을 안하면 Index 페이지로 이동시킨다.
	if(id == null) response.sendRedirect("A04Index.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1><%=id %>님 환영합니다</h1>
	
	<div>
		<a href="A04Index.jsp">Index</a> | 
		<a href="A04Logout.jsp">Logout</a> | 
	</div>
</body>
</html>