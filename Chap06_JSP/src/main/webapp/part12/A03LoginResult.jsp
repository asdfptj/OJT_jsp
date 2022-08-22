<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// ServletContext는 JSP에서는 application라는 이름으로 이미 객체화 되어 있음(내장객체)
	String id = (String) application.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1><%=id %>님 환영합니다</h1>
</body>
</html>