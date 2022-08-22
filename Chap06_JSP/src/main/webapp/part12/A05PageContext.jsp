<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String tel = request.getParameter("tel");

	// 현재 페이지 내에서 변수를 공유할 목적. 
	// 보통 include되는 파일과 데이터를 공유 할 목적으로 사용된다.
	pageContext.setAttribute("tel", tel);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>A05 PageContext</title>
</head>
<body>
	<h1>A05 PageContext</h1>
	
	<div>
		This is main content. <%=tel %>
	</div>
	<br>
	
	<%-- include 구문은 소스코드가 컴파일 되고 난 후 결과가 여기에 포함된다 => HTML등 정적파일에 적당 --%>
	<jsp:include page="./A05Footer.jsp"></jsp:include>
	
	<%-- include 구문은 소스코드가 컴파일 전에 해당 페이지에 붙여넣기가 된다 => JSP등 동적 파일에 적당 --%>
	<%@ include file="./A05Footer.jsp" %>
	
	
</body>
</html>