<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Format Date</title>
<link rel="stylesheet" href="https://unpkg.com/bootstrap@4.3.1/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="card-body">
		<h3>Format Date</h3>
		
		<div>
			<c:set var="today" value="<%=new Date() %>" />
			
			오늘의 날짜: <fmt:formatDate value="${today }"		type="date" /><br>
			현재의 시간: <fmt:formatDate value="${today }"		type="time"/><br>
			<br>
			
			오늘의 날짜 Full: <fmt:formatDate value="${today }"	 type="date" dateStyle="full" /><br>
			오늘의 날짜 Long: <fmt:formatDate value="${today }"	 type="date" dateStyle="long" /><br>
			오늘의 날짜 Medium: <fmt:formatDate value="${today }"	 type="date" dateStyle="medium" /><br>
			오늘의 날짜 Short: <fmt:formatDate value="${today }"	 type="date" dateStyle="short" /><br>
			<br>
			
			현재의 시간 Full: <fmt:formatDate value="${today }"	 type="time" timeStyle="full" /><br>
			현재의 시간 Long: <fmt:formatDate value="${today }"	 type="time" timeStyle="long" /><br>
			현재의 시간 Medium: <fmt:formatDate value="${today }"	 type="time" timeStyle="medium" /><br>
			현재의 시간 Short: <fmt:formatDate value="${today }"	 type="time" timeStyle="short" /><br>
			<br>
			
			현재의 날짜 시간: <fmt:formatDate value="${today }"	 type="both" dateStyle="full" timeStyle="full" /><br>
			현재의 날짜 시간: <fmt:formatDate value="${today }"	 type="both" dateStyle="long" timeStyle="full" /><br>
			현재의 날짜 시간: <fmt:formatDate value="${today }"	 type="both" dateStyle="full" timeStyle="short" /><br>
			현재의 날짜 시간: <fmt:formatDate value="${today }"	 type="both" dateStyle="short" timeStyle="short" /><br>
			<br>
			
			Pattern: <fmt:formatDate value="${today }" pattern="YYYY-MM-dd EEEE a HH:mm:ss"/><br>
			Pattern: <fmt:formatDate value="${today }" pattern="YY-M-d E a H:m:s"/><br>
		</div>
	</div>
</body>
</html>





