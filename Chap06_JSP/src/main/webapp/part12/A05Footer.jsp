<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// include 구문은 소스코드가 컴파일 전에 해당 페이지에 붙여넣기가 된다
	// 붙여넣기 하는 곳에 tel 변수가 존재한다
	String abc = (String) pageContext.getAttribute("tel");
%>

<footer>
	Copyright xxx tel: <%=abc %> 
</footer>

