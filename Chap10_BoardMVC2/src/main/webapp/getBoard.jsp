<%@page import="com.company.biz.board.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	BoardVO board = (BoardVO) request.getAttribute("board");
	String name = (String) session.getAttribute("name");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
<title>글 상세</title>
</head>

<body>
	<div align="center" style="margin: auto auto">
		<h3>글 상세</h3>
		<h3><%=name %>님 로그인 환영합니다...... 
			<a href="logoutCtrl">Log-out</a>
		</h3>
		<hr>
		<!-- 
			action에 붙인 ?뒤의 변수는 무시된다 (값 전달이 안됨). 
			form은 항상 폼 요소를 이용해서 값을 전달해야 한다 
		-->
		<form action="updateBoardCtrl" method="post">
			<!-- 브라우저에는 보이지 않지만 값을 전달할 필요가 있을때 사용한다. name과 value 속성 필수 -->
			<input name="seq" type="hidden" value="<%=board.getSeq() %>"/>
			
			<table class="table" style="width: 800px">
				<tr>
					<td>제목</td>
					<td align="left">
						<input name="title" type="text" class="form-control" value="<%=board.getTitle() %>"/>
					</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td align="left"><%=board.getNickname() %></td>
				</tr>
				<tr>
					<td>내용</td>
					<td align="left">
						<textarea name="content" cols="40" rows="10" class="form-control"><%=board.getContent() %></textarea>
					</td>
				</tr>
				<tr>
					<td>등록일</td>
					<td align="left"><%=board.getRegdate() %></td>
				</tr>
				<tr>
					<td>조회수</td>
					<td align="left"><%=board.getCnt() %></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="글 수정" class="btn btn-primary"/>
					</td>
				</tr>
			</table>
		</form>
		<hr>
		<a href="addBoard.jsp">글등록</a>&nbsp;&nbsp;&nbsp; 
		<a href="deleteBoardCtrl?num=<%=board.getSeq() %>">글삭제</a>&nbsp;&nbsp;&nbsp; 
		<a href="getBoardListCtrl">글목록</a>
	</div>
</body>
</html>

