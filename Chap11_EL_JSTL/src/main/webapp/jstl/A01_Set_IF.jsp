<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Set And IF</title>
<link rel="stylesheet" href="https://unpkg.com/bootstrap@4.3.1/dist/css/bootstrap.min.css">
</head>
<body>
	
	<div class="card-body">
		<h3>SET</h3>
		
		JSTL(Java Stardard Tag Library)은 기본 기능이 아니다.<br>
		따라서 필요한 JAR 파일을 로드해야 한다 => 원래는 WEB-INT => lib에 해당 jar파일을 배치<br>
		이 작업을 Maven(메이븐)으로 대체. 라이브러리는 maven repository에서 검색<br>

		사용하기 전에 taglib를 먼저 등록해야 한다<br>
		<br>
		
		<h3>변수 선언 및 사용</h3>
		Num1: ${num1 }<br>
		<br>
		<!-- 변수 선언. 선언된 변수는 기본적으로 pageScope에 저장된다 -->
		<c:set var="num1" value="100" />
		<c:set var="num2" value="200" scope="request"/>
		<c:set var="result" value="${num1 + num2}" />
		
		${num1 } + ${num2 } = ${num1 + num2 }<br>
		${num1 } + ${num2 } = ${result }<br>
		<br>
		
		<!-- VO 객체를 태그를 이용해 선언. 표준 태그라 한다 
			PersonVO vo = new PersonVO();
			vo.setName("홍길동");
			vo.setAge(30);
		-->
		<jsp:useBean id="vo" class="com.company.el.PersonVO" />
		<jsp:setProperty property="name" value="홍길동" name="vo"/>
		<jsp:setProperty property="age" value="30" name="vo"/>
		
		VO: ${vo.name } / ${vo.age }<br> 
		<br>
		
		
		<h3>변수 삭제</h3>
		<c:set var="num3" value="300" />
		Num3: ${num3 }<br>
		
		<c:remove var="num3"/>
		Num3: ${num3 }<br>
		<br>
		<br>
		
		<h1>IF</h1>
		단순 if만 지원한다. if~else 구문은 choose로 구현<br>
		
		<c:if test="${num1 > num2 }">
			${num1 }이 ${num2 }보다 크다.<br>
		</c:if>
		
		<c:if test="${num1 < num2 }">
			${num2 }이 ${num1 }보다 크다.<br>
		</c:if>
		
		<c:if test="${num1 == num2 }">
			${num1 }이 ${num2 }가 같다.<br>
		</c:if>
		<br>
		
		<h1>Choose</h1>
		조건을 하나로 묶는다. Java의 switch 구문과 비슷
		
		<c:choose>
			<c:when test="${num1 > num2 }">
				${num1 }이 ${num2 }보다 크다.<br>
			</c:when>
			<c:when test="${num1 < num2 }">
				${num2 }이 ${num1 }보다 크다.<br>
			</c:when>
			<c:otherwise>
				${num2 }과 ${num1 }이 같다<br>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>




