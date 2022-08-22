<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");			// 이거 없으면 한글로 로그인은 항상 안됨

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	if (id.equals("abc") && password.equals("abc123")) {

		// session 객체에 값을 세팅
		// JSP는 처음부터 session 객체는 생성되어 있는 상태이다.
		session.setAttribute("id", id);
		
		application.setAttribute("id", id);
		response.sendRedirect("A04LoginResult.jsp");
	} else {
		response.sendRedirect("A04Login.jsp");
	}
	 
%>