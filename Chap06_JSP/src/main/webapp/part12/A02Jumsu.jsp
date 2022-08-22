<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int total = kor + eng;
	int avg = total / 2;
	
	// 사용하는 곳에서 형 변환
	String kor1 = request.getParameter("kor");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- HTML 주석 -->
	<%-- JSP 주석 --%>
	<h1>결과</h1>
	<%=name %>님의 총점은 <%=total %>이고 평균은 <%=avg %>입니다<br>
	<%=name %>님의 총점은 <%=kor+eng %>이고 평균은 <%=(kor+eng) / 2 %>입니다<br>
	<%=name %>님의 국어 점수는 <%=Integer.parseInt(kor1) + 100 %><br>
	<br>
	
	평균이 90 이상이면 A, 80 => B, 70 => C, 그 이하는 모두 F<br>
<%
	if(avg >= 90) {
%>
		<%=name %>님은 A 학점 입니다.
<%
	} else if(avg >= 80) {
%>
		<%=name %>님은 B 학점 입니다.
<%
	} else if(avg >= 70) {
%>
		<%=name %>님은 C 학점 입니다.
<%
	} else {
%>
		<%=name %>님은 F 학점 입니다.
<%
	}
%>
	<br>
	위의 작업이 귀찮음. 출력할 구문이 간단하다면 내장객체 out(PrintWrite)을 사용<br>
<%
	if(avg >= 90) {
		out.println(name + "님은 A학점 입니다");
	} else if(avg >= 80) {
		out.println(name + "님은 B학점 입니다");
	} else if(avg >= 70) {
		out.println(name + "님은 C학점 입니다");
	} else {
		out.println(name + "님은 F학점 입니다");
	}
%>
</body>
</html>





