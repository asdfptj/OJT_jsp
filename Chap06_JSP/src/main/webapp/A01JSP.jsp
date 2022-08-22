<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>A01 JSP</h1>
<%
	// 이것을 스크립트릿이라 한다. 이 내부는 자바 영역이다
	int x = 10;
	int y = 20;
	int result = x + y;
%>
	<div>
		1. web.xml에 등록 없이 바로 이 이름으로 실행된다.<br>
		2. JSP 파일은 실행을 위해 Servlet으로 변환 후 실행된다.(우리가 세팅할 것은 없음)<br>
		3. 스크립트릿, 출력문, 선언문 3가지를 이용해서 구현한다.<br>
		4. 서블릿이 Java 코드에 HTML을 삽입한 형태라면 JSP는 HTML에 Java 코드를 삽입<br>
		5. 스크립트릿 구문은 서블릿으로 변환될때 service(request, response) 메서드 내부에
			모두 기술된다.
	</div>
	<br>
	
	<div>
		출력문은 =만 붙이면 된다<br>
		<%=x %> + <%=y %> = <%=result %>
	</div>
<%
	// 필요에 따라 스크립트릿은 나누어서 작성할 수 있다
	for(int i = 1; i < 10; i++) {
%>

		<div>3 * <%=i %> = <%=3 * i %></div>

<%
	}
%>
	<br>
	
<%!
	public int onAdd(int x, int y) {
		return x + y;
	}
%>
	<div>
		메서드가 필요한 경우. 스크립트릿은 service 메서드 내부에 기술되므로 스크립트릿 방식으로 
		기술하면 에러. 따라서 메서드는 선언문에 기술한다.<br>
		보통 맨 위에 기술<br>
		
		<%=onAdd(10, 20) %>
	</div>


	<%=application.getServerInfo() %><br>
	<%=application.getRealPath("A01JSP.jsp") %>
</body>
</html>









