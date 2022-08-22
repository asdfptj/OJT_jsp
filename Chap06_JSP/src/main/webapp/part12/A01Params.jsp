<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// HttpServletRequest, HttpServletResponse는 각각 request, response로 
	// 생성되어 있음.
	
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String address = request.getParameter("address");
	int qty = Integer.parseInt(request.getParameter("qty"));
	String email = request.getParameter("email");
	String url = request.getParameter("url");
	String date = request.getParameter("date");
	String comment = request.getParameter("comment");
	String baseball = request.getParameter("baseball");
	String[] four = request.getParameterValues("four");		// checkbox
	String base = request.getParameter("base");
	String[] five = request.getParameterValues("five");		// checkbox
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Form</title>
</head>
<body>
	<h1>Form Value 확인</h1>
	
	<div>
		Name: <%=name %><br>
		Id: <%=id %><br>
		Password: <%=password %><br>
		Address: <%=address %><br>
		QTY: <%=qty * 100%><br>
		EMAIL: <%=email %><br>
		URL: <%=url %><br>
		Date: <%=date %><br>
		Comment: <%=comment %><br>
		Baseball: <%=baseball %><br>
<%
	for(String str : four) {
%>
		Four: <%=str %><br>
<%
	}
%>
		Base: <%=base %><br>

<%
	for(String str : five) {
%>
		Five: <%=str %><br>
<%
	}
%>

	</div>
</body>
</html>





