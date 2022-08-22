package com.company.part05;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// Annotation을 이용한 서블릿 컨테이너에 등록
// web.xmp 등록 대신 Annotation을 이용
// 지정한 이름 /A03Annotation이 브라우저에서 요청하는 주소(파일명)이 되고 
// 요청을 받으면 하단의 클래스(서블릿)이 매칭되서 실행된다

// **지정한 url 이름이 중복되면 서버 부팅이 안된다(서버 에러 발생)
@WebServlet("/def")
public class A03Annotation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		out.println("<h1>A03 Annotation</h1>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
