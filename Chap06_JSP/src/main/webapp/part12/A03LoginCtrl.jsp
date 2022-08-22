<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");			// 이거 없으면 한글로 로그인은 항상 안됨

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	if (id.equals("abc") && password.equals("abc123")) {
		// Project 전체에서 데이터 공유.
		// 프로젝트내에 어떤 서블릿이나 JSP에서도 getAttribute("ip")로 불러와 사용 가능
		// ServletContext ctx = getServletContext();
		// ctx.setAttribute("id", id);
		
		application.setAttribute("id", id);
		response.sendRedirect("A03LoginResult.jsp");
	} else {
		response.sendRedirect("login.jsp");
	}
	 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>