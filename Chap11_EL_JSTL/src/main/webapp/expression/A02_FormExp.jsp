<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Form Expression</title>
<link rel="stylesheet" href="https://unpkg.com/bootstrap@4.3.1/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="card-body">
		<h3>Form Value Expression</h3>
	
		<div>
			받은 값을 변수에 대입이 아니라 바로 출력만 할 상황이라면 EL을 이용<br>
			Name: ${param.name }<br>
			Id: ${param.id }<br>
			Password: ${param.password }<br>
			Date: ${param.date }<br>
			Comment: <br>
			Baseball: ${param.baseball }<br>
			
			선택한 값 중 처음 1개만 출력된다<br>
			Four: ${param.four }<br>
			Four: ${paramValues.four[0] } /
					${paramValues.four[1] } /
					${paramValues.four[2] } /
					${paramValues.four[3] } /
					${paramValues.four[4] }<br>
			
			Base: <br>
			Five: <br>
		</div>
	</div>
	
</body>
</html>