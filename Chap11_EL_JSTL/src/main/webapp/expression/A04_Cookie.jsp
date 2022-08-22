<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie Expression</title>
<link rel="stylesheet" href="https://unpkg.com/bootstrap@4.3.1/dist/css/bootstrap.min.css">
</head>
<body>
<%!
	Cookie cnt = new Cookie("cnt", "1");
	Cookie ck1 = new Cookie("name", "놀부");
	Cookie ck2 = new Cookie("product", "tv-789-456");
%>
<%
	response.addCookie(ck1);
	response.addCookie(ck2);
	response.addCookie(cnt);
	
	if(request.getCookies() != null) {
		for(Cookie ck : request.getCookies()) {
			if(ck.getName().equals("cnt")) {
				int cntValue = Integer.parseInt(ck.getValue());
				cntValue++;
				Cookie cnt = new Cookie("cnt", cntValue+"");
				response.addCookie(cnt);
			}
		}
	}
	
%>
	<div class="card-body">
		<h3>Cookie Value</h3>
		
		<div>
			name: ${cookie.name.value }<br>
			product: ${cookie.product.value }<br>
			cnt: ${cookie.cnt.value }번째 방문입니다.<br>
		</div>
		<br>
		
		<h3>initParam</h3>
		<div>
			<br>
		</div>
		<br>
		
		<h3>pageContext</h3>
		<div>
			requestURI: <br>
			remoteAddr: <br>
		</div>
		
	</div>
	
</body>
</html>