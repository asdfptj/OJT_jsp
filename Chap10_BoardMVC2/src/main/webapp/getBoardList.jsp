<%@page import="com.company.biz.board.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%
	// GetBoardListCtrl 서블릿이 DB로 부터 가져온 데이터를 request 객체에 담아 이 페이지로 forward
	// 따라서 request로부터 꺼내 사용하기만 하면 된다.
	
	// 사용할 데이터를 GetBoardListCtrl가 전달해 주니까 이 페이지로 연결되는 링크는
	// GetBoardListCtrl로 변경할 필요가 있다 (GetBoardListCtrl가 데이터를 넘겨주지 않으면 에러남)
	ArrayList<BoardVO> boardList = (ArrayList<BoardVO>) request.getAttribute("boardList");

	String name = (String) session.getAttribute("name");
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
			<%=name %>님 환영합니다...... <a href="logoutCtrl">Log-out</a>
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
				<td><a href="getBoardCtrl?num=<%=board.getSeq() %>"><%=board.getTitle() %></a></td>
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

