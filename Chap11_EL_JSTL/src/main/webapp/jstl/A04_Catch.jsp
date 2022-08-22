<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Catch</title>
<link rel="stylesheet" href="https://unpkg.com/bootstrap@4.3.1/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="card-body">
		<h3>Catch</h3>
		
		${param.x } + ${param.y } = ${param.x + param.y }<br>
		
		이 내부 구문에서 에러가 있으면 에러에 관련된 사항을 처리<br>
		<c:catch var="err">
			<%
				int x = Integer.parseInt(request.getParameter("x"));
				int y = Integer.parseInt(request.getParameter("y"));
				int result = x + y;
			%>
			<%=x %> + <%=y %> = <%=result %>
		</c:catch>
		
		<c:if test="${!empty err }">
			Error: ${err }
		</c:if>
		<br>
	</div>
</body>
</html>