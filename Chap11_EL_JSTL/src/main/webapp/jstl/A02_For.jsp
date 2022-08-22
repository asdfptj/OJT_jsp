<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>For</title>
<link rel="stylesheet" href="https://unpkg.com/bootstrap@4.3.1/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="card-body">
		<h3>For</h3>
		
		<c:set var="result" value="0" />
		<c:forEach begin="1" end="10" var="i" step="1">
			<c:set var="result" value="${result + i }" />
		</c:forEach>
		Result: ${result }<br>
		<br>
		
		<h5>1부터 10까지 짝수의 합</h5>
		<c:set var="result" value="0" />
		<c:forEach begin="0" end="10" var="i" step="2">
			<c:set var="result" value="${result + i }" />
		</c:forEach>
		Result: ${result }<br>
		<br>
		
		<h5>배열</h5>
		<c:forEach items="${name }" var="item">
			${item }
		</c:forEach>
		<br>
		
		<h5>ArrayList</h5>
		<c:forEach items="${fruit }" var="item">
			${item }
		</c:forEach>
		<br>
		
		<h5>Map</h5>
		<c:forEach items="${map }" var="item">
			${item }
		</c:forEach>
		<br>
		
		<table class="table">
			<tr>
				<th>Title</th>
				<th>Content</th>
				<th>Current</th>
				<th>Index</th>
				<th>Count</th>
				<th>First</th>
				<th>Last</th>
			</tr>
<c:forEach items="${boardList }" var="board" varStatus="status">
			<tr>
				<td>${board.title }</td>
				<td>${board.content }</td>
				<td>${status.current }</td>
				<td>${status.index }</td>
				<td>${status.count }</td>
				<td>${status.first }</td>
				<td>${status.last }</td>
			</tr>
</c:forEach>
		</table>
		<br>
		
		
		<h3>ForToken</h3>
		문자열을 분할 할 목적으로 사용한다.<br>
		
		<c:forTokens items="사과-바나나-레몬" delims="-" var="item">
			${item }
		</c:forTokens>
		<br>
		<br>
		
		<c:set var="str" value="사과-레몬*바나나" />
		<c:forTokens items="${str }" delims="-*" var="item">
			${item }
		</c:forTokens>
		
		
	</div>
</body>
</html>