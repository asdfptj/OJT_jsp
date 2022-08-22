<%@page import="com.company.biz.board.BoardVO"%>
<%@page import="com.company.biz.board.impl.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));

	BoardVO params = new BoardVO();
	params.setSeq(num);
	
	BoardDAO dao = new BoardDAO();
	int cnt = dao.deleteBoard(params);
	
	response.sendRedirect("getBoardList.jsp");
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