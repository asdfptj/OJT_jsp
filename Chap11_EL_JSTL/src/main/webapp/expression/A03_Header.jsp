<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header Expression</title>
<link rel="stylesheet" href="https://unpkg.com/bootstrap@4.3.1/dist/css/bootstrap.min.css">
</head>
<body>
	
	<div class="card-body">
		<h3>Header Expression</h3>
		
		<div>
			헤더 정보를 출력만 하고자 할 경우. JSTL을 이용하면 변수에 대입도 가능
			<br>
			Host: ${header.host }<br>
			Connection: ${header.connection }<br>
			Cache-control: ${header["cache-control"] }<br>
			Upgrade-insecure: ${header["upgrade-insecure"] }<br>
			User-agent: ${header["user-agent"] }<br>
			Accept: <br>
			Accept-encoding: <br>
			Accept-language: <br>
			Cookie: <br>
		</div>
	</div>
	
<%
	Enumeration<String> headers = request.getHeaderNames();
	while(headers.hasMoreElements()) {
		String header = headers.nextElement();
		String value = request.getHeader(header);
		out.println(header + ": " + value + "<br>");
	}
%>
	
	
	
	
	
	
	
	
	
</body>
</html>