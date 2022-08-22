<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GetData</title>
<link rel="stylesheet" href="https://unpkg.com/bootstrap@4.3.1/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="card-body">
		
		<h3>Get Data</h3>
		
		<div>
			Array: ${name[0] } / ${name[1] } / ${name[2] } / ${name[10] }<br>
			ArrayList: ${fruit[0] } / ${fruit[1] } / ${fruit[2] } / ${fruit[10] }<br>
			Map: ${map.get("one") } / ${map.get("two") } / ${map.get("three") } / ${map.get("abc") }<br>
			<br>
			VO 객체는 getter method를 참조한다<br>
			getter method의 get을 생략하고 다음 문자를 소문자로 변경 후 참조. () 없이 참조<br>
			private String name => public String getName(){ } => EL에서는 name<br>
			
			VO: ${vo.address } / ${vo.name } / ${vo.age } 
		</div>
		
	</div>
</body>
</html>