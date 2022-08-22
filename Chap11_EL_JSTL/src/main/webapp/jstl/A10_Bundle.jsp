<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:requestEncoding value="UTF-8"/>
<fmt:setLocale value="en_us"/> <!-- ko_KR -->

<fmt:bundle basename="message/company">
	<fmt:message key="TITLE" var="title" />
	<fmt:message key="GREETING" var="greeting">
		<fmt:param>NolBu</fmt:param>
		<fmt:param>10</fmt:param>
	</fmt:message>
	<fmt:message key="BODY" var="body" />
	<fmt:message key="COMPANYNAME" var="companyname" />
</fmt:bundle>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다국어 처리</title>
</head>
<body>

	<div class="card-body">
		<h3>${title }</h3>
		
		<div>
			${greeting }<br>
			${body }<br>
			${companyname }
		</div>
	</div>

</body>
</html>