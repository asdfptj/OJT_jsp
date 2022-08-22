<%@page import="java.util.Date"%>
<%@page import="java.util.Locale"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Format Number</title>
<link rel="stylesheet" href="https://unpkg.com/bootstrap@4.3.1/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="card-body">
		<h3>Format Number</h3>

		<c:set var="num" value="1234567.89567" />
		
		, 구분: <fmt:formatNumber value="${num }" groupingUsed="true" /><br>

		<!-- 소수점 앞의 #은 정의한 숫자와 상관없이 전체가 표시
			소수점 이하는 표시한 수만큼 반올림되어서 표시
			단 #을 이용해 패턴을 만들 수 있다
		 -->
		# 표기: <fmt:formatNumber value="${num }" pattern="#.##" /><br>
		# 표기: <fmt:formatNumber value="${num }" pattern="#,###.##" /><br>
		<!-- 별로 의미 없음. 하나의 패턴만 완성되면 된다 -->
		# 표기: <fmt:formatNumber value="${num }" pattern="###,###,###.##" /><br>

		<!-- 자리수의 값이 없으면 0으로 채운다는 점이 #과 다르다 -->
		0 표기: <fmt:formatNumber value="${num }" pattern="0.00" /><br>
		0 표기: <fmt:formatNumber value="${num }" pattern="0,000.0000000" /><br>
		0 표기: <fmt:formatNumber value="${num }" pattern="000,000,000.0000000" /><br>

		#, 0 표기: <fmt:formatNumber value="${num }" pattern="#,###.0000000" /><br>
		<br>
		
		<!-- value 값에 100을 곱하고 %를 붙여 출력한다 -->
		% 표기: <fmt:formatNumber type="percent" value="0.2" /> <br>
		% 표기: <fmt:formatNumber type="percent" value="${num }" /><br>
		<br>
		
		currency 표기: <fmt:formatNumber type="currency" value="${num }" /><br>
		currency 표기: <fmt:formatNumber type="currency" value="${num }" currencySymbol="$" /><br>
		currency 표기: <fmt:formatNumber type="currency" value="${num }" currencyCode="USD" /><br>
		<br>
		<br>
		
		<h3>setLocale</h3> 		<!-- 국가코드_언어 ex) en_us -->
		
		<c:set var="today" value="<%=new Date() %>" />
		
		대한민국: <fmt:setLocale value="ko_kr"/>
			금액: <fmt:formatNumber type="currency" value="${num }" /><br>
			날짜: <fmt:formatDate value="${today }" pattern="YYYY-MM-dd EEEE a HH:mm:ss"/>
		<br> 
		<br>
			
		미국: <fmt:setLocale value="en_us"/><br> 
		
		금액: <fmt:formatNumber type="currency" value="${num }" /><br>
		날짜: <fmt:formatDate value="${today }" pattern="YYYY-MM-dd EEEE a HH:mm:ss"/>
		<br>
			
		대만: <fmt:setLocale value="zh_tw"/><br> 
		
		금액: <fmt:formatNumber type="currency" value="${num }" /><br>
		날짜: <fmt:formatDate value="${today }" pattern="YYYY-MM-dd EEEE a HH:mm:ss"/>
		
	</div>
	
	<div class="card-body">
		<%
			for(Locale locale : Locale.getAvailableLocales()) {
				out.println("getCountry: " + locale.getCountry() + "<br>");
				out.println("getLanguage: " + locale.getLanguage() + "<br>");
				out.println("getDisplayName" + locale.getDisplayName() + "<br>");
				out.println("getDisplayLanguage: " + locale.getDisplayLanguage() + "<br>");
				out.println("getDisplayCountry: " + locale.getDisplayCountry() + "<br>");
				out.println("<br>");
			}
			
		%>
	</div>
</body>
</html>