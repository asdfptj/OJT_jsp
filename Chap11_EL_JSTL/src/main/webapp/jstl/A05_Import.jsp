<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Import</title>
<link rel="stylesheet" href="https://unpkg.com/bootstrap@4.3.1/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="card-body">
		<h3>Import</h3>
		
		외부파일을 IMPORT. IMPORT되는 파일에서 param 변수가 필요한 경우 담아서 전달 가능<br>
		<c:import url="A04_Catch.jsp">
			<c:param name="x" value="100" />
			<c:param name="y" value="200" />
		</c:import>
		<br>
		
		<h3>URL</h3>
		set과 동일한 기능을 하지만, URL을 저장하기 위한 용도로 사용됨<br>
		<c:url var="a04" value="A04_Catch.jsp" />
		<c:import url="${a04 }">
			<c:param name="x" value="100" />
			<c:param name="y" value="200" />
		</c:import>
		<br>
		<br>
		
		<h3>OUT</h3>
		이스케이프 문자를 자동으로 변경해 준다.<br>
		<c:set var="num" value="10" />
		<c:out value="${num }" />
		<br>
		
		<c:out value="<h1>~</h6>는 머릿말 태그입니다" /><br>
		<!-- escapeXml="false" 문자열 내부의 태그를 파싱해서 태그로 동작하게 한다  -->
		<c:out value="<h1>~</h6>는 머릿말 태그입니다" escapeXml="false" /><br>
		<c:out value="<h1>~</h6>는 머릿말 태그입니다" escapeXml="true" /><br>
	</div>
</body>
</html>
