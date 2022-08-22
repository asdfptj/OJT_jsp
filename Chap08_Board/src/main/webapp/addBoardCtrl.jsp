<%@page import="com.company.biz.board.BoardVO"%>
<%@page import="com.company.biz.board.impl.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String title = request.getParameter("title");
	String nickname = request.getParameter("nickname");
	String content = request.getParameter("content");
	
	BoardVO params = new BoardVO();
	params.setTitle(title);
	params.setNickname(nickname);
	params.setContent(content);
	
	BoardDAO dao = new BoardDAO();
	int cnt = dao.insertBoard(params);
	
	if (cnt != 0) response.sendRedirect("getBoardList.jsp");
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