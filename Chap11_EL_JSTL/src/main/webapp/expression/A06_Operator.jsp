<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL Operator</title>
<link rel="stylesheet" href="https://unpkg.com/bootstrap@4.3.1/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="card-body">
		<h3>Operator</h3>
		
		<div>
			EL 내부에서는 연산자만 사용 가능<br>
			
			X = ${param.x }, Y = ${param.y }<br>
			X + Y = ${param.x + param.y}<br>
			X - Y = ${param.x - param.y}<br>
			X * Y = ${param.x * param.y}<br>
			X / Y = ${param.x / param.y}<br>
			X % Y = ${param.x % param.y}<br>
			X &lt; Y = ${param.x > param.y} / ${param.x lt param.y}<br>
			X &gt; Y = ${param.x < param.y} / ${param.x gt param.y}<br>
			X == Y = ${param.x == param.y} / ${param.x eq param.y}<br>
			X != Y = ${param.x != param.y} / ${param.x ne param.y}<br>
			X, Y 모두 양수? = ${param.x > 10 && param.y > 10} / ${param.x > 10 and param.y > 10}<br>
			3항 연산자: ${param.x == param.y ? "같음" : "틀림" }<br>
			<br>
			
			<br>
			Empty: ${empty param.x }<br>
			${empty param.name ? "unknown" : param.name }
			
		</div>
		
	</div>
</body>
</html>