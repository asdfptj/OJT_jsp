<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Redirect</title>
<link rel="stylesheet" href="https://unpkg.com/bootstrap@4.3.1/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="card-body">
		<h3>Redirect</h3>
		
		sendRedirect와 동일<br>
		다른점은 전달할 매개변수를 ? 형태가 아닌 명령으로 전달 가능
		<c:redirect url="A04_Catch.jsp">
			<c:param name="x" value="10" />
			<c:param name="y" value="20" />
		</c:redirect>
	</div>
</body>
</html>