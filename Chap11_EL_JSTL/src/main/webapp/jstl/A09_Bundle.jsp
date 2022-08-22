<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:requestEncoding value="UTF-8" />
<fmt:setLocale value="en_us" />
<fmt:setBundle basename="message/company" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다국어 처리</title>
</head>
<body>

	<div class="card-body">
		<h3><fmt:message key="TITLE"/></h3>
		
		<fmt:message key="GREETING">
			<fmt:param>Guest</fmt:param>
			<fmt:param>3</fmt:param>
		</fmt:message>
		<br>
		
		<fmt:message key="BODY"/><br>
		<fmt:message key="COMPANYNAME"/>
	</div>

</body>
</html>