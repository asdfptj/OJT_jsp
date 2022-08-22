<%@page import="com.company.biz.board.impl.BoardDAO"%>
<%@page import="com.company.biz.board.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	// DAO 파일은 request, response 객체가 없으므로 여기에서 request, response에 관련된 작업을 한다
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	int seq = Integer.parseInt(request.getParameter("seq"));
	
	// DB연결해서 위의 값을 이용해 update query를 실행
	// 이 구문들은 request, response 객체가 필요 없으니 필요한 로직을 DAO에 기술해서 통합 관리
	BoardVO params = new BoardVO();
	params.setTitle(title);
	params.setContent(content);
	params.setSeq(seq);
	
	BoardDAO dao = new BoardDAO();
	dao.updateBoard(params);

	response.sendRedirect("getBoardList.jsp");
%>
