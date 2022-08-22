<%@page import="com.company.biz.user.impl.UserDAO"%>
<%@page import="com.company.biz.user.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	UserVO params = new UserVO();
	params.setId(id);
	params.setPassword(password);
	
	UserDAO dao = new UserDAO();
	UserVO user = dao.login(params);
	
	// user가 null이면 유저가 없다는 소리
	if (user == null) {
		response.sendRedirect("login.jsp");
	} else {
		// 유저가 있다면 생성된 세션에 속성 추가
		// 쿼리의 결과값 중 필요한 비교 할 값 1개를 세션 속성에 주가
		// 로그인을 했으면 세션에 name 속성이 있지만
		// 로그인을 하지 않은 상태라면 name 속성이 없다
		// 즉 이 페이지를 거치지 않으면 name 속성이 없다
		session.setAttribute("name", user.getName());
		response.sendRedirect("getBoardList.jsp");
	}
	
%>