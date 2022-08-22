<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// page
	pageContext.setAttribute("name", "Page Context");
	pageContext.setAttribute("add", "부산시");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://unpkg.com/bootstrap@4.3.1/dist/css/bootstrap.min.css">
</head>
<body>

	<div class="card-body">
		<!-- page => request => session => application -->
		<h3>Expression Language</h3>

		<div>
			page: 이름이 중복되면 어떤 스코프에서 꺼낼 것인가를 지정해야 한다.<br>
			Name: ${name }<br>
			Add: ${add }
		</div>
		<br>

		<div>
			Session<br>
			Name: ${sessionScope.name }<br>
			ID: ${id }<br>
			VO객체의 값은 getter 메서드만 참조한다. 일반 변수는 참조 불가<br>
			참조할 때는 get을 생략하고 get 다음 글자를 소문자로 변환하여 참조한다<br>
			VO: ${sessionScope.person.name } / ${sessionScope.person.age } / ${sessionScope.person.address }
		</div>
		<br>

		<div>
			Request<br>
			Name: ${requestScope.name }<br>
			ID: ${dept }<br>
			VO: ${person.name } / ${person.age } / ${person.address }
		</div>
		<br>

		<div>
			Context<br>
			Name: ${applicationScope.name }<br>
			Address: ${address }<br>
			VO: ${applicationScope.person.name } / 
				${applicationScope.person.age } / 
				${applicationScope.person.address }
		</div>
	</div>

</body>

</html>