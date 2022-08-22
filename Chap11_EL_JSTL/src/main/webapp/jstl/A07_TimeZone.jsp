<%@page import="java.util.TimeZone"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TimeZone</title>
<link rel="stylesheet" href="https://unpkg.com/bootstrap@4.3.1/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="card-body">
		<h3>Timezone</h3>
		
		<c:set var="today" value="<%=new Date() %>" />
		
		서울:
		<fmt:timeZone value="Asia/Seoul">
			<fmt:formatDate value="${today }" pattern="YYYY-MM-dd EEEE a HH:mm:ss"/>
		</fmt:timeZone>
		<br>
		
		뉴욕:
		<fmt:timeZone value="America/New_Yock">
			<fmt:formatDate value="${today }" pattern="YYYY-MM-dd EEEE a HH:mm:ss"/>
		</fmt:timeZone>
		<br>
		
		런던:
		<fmt:timeZone value="Europe/London">
			<fmt:formatDate value="${today }" pattern="YYYY-MM-dd EEEE a HH:mm:ss"/>
		</fmt:timeZone>
		<br>
		<br>
		
		<h3>setTimezone</h3>
		한번 지정하면 이후로는 지정한 타임존으로 시간이 표시된다<br>
		
		서울: <fmt:formatDate value="${today }" pattern="YYYY-MM-dd EEEE a HH:mm:ss"/>
			<br>
		뉴욕:
			<fmt:setTimeZone value="America/New_York"/>
			<fmt:formatDate value="${today }" pattern="YYYY-MM-dd EEEE a HH:mm:ss"/>
			<br>
		런던:
			<fmt:formatDate value="${today }" pattern="YYYY-MM-dd EEEE a HH:mm:ss"/>
			
			
		<%
			String[] zones = TimeZone.getAvailableIDs();
			for(String zone : zones) {
				System.out.println(zone);
			}
		%>
			
			
			
			
			
			
			
			
			
	</div>
</body>
</html>