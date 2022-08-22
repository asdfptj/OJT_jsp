<%@page import="com.company.biz.board.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.company.biz.board.impl.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%
	String name = (String) session.getAttribute("name");
	if (name == null) response.sendRedirect("login.jsp");
	else {
		BoardDAO dao = new BoardDAO();
		ArrayList<BoardVO> boardList = dao.getBoardList();
		// 맨 마지막 </html> 아래에서 닫는다
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
<title>글 목록</title>
</head>

<body>
	<div align="center" style="margin: auto auto">
		<h1>글 목록</h1>
		<h3>
			<%=name %>님 환영합니다...... <a href="logoutCtrl.jsp">Log-out</a>
		</h3>

		<!-- 검색 시작 -->
		<form method="post">
			<table class="table" style="width: 800px">
				<tr>
					<td align="right">
					<select name="searchCondition">
							<option value="TITLE">제목
							<option value="CONTENT">내용
					</select>
					<input name="searchKeyword" type="text" />
					<input type="submit" value="검색" /></td>
				</tr>
			</table>
		</form>
		<!-- 검색 종료 -->

		<table class="table" style="width: 800px">
			<tr>
				<th width="100">번호</th>
				<th width="200">제목</th>
				<th width="150">작성자</th>
				<th width="150">등록일</th>
				<th width="100">조회수</th>
			</tr>
<%
	for(BoardVO board : boardList) {
%>
			<tr>
				<td><%=board.getSeq() %></td>
				<td><a href="getBoard.jsp?num=<%=board.getSeq() %>"><%=board.getTitle() %></a></td>
				<td><%=board.getNickname() %></td>
				<td><%=board.getRegdate() %></td>
				<td><%=board.getCnt() %></td>
			</tr>
<%
	}
%>
		</table>
		<br> <a href="addBoard.jsp">새글 등록</a>
	</div>
</body>
</html>

<%
}	// else 구문 닫힘
%>

