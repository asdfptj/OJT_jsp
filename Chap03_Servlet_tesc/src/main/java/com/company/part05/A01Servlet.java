package com.company.part05;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.filters.ExpiresFilter.XHttpServletResponse;

// html 파일을 만들어서 전달하는 목적으로 생성 (백단 동적 페이지 작성)
// web.xml에 이 파일을 웹 브라우저가 어떤 이름으로 요청하면 이 페이지 실행될지를 등록해 주어야 한다
//		또는 어노테이션을 이용할 수도 있다
// 이렇게 등록되는 곳을 우리는 서블릿 컨테이너라고 한다(서블릭과 JSP 파일이 관리된다)
// 서블릿 => 서블릿 컨테이너에 등록이 필수
// JSP => 서블릿 컨테이너에 자동 등록 (등록이 필요 없음)
public class A01Servlet extends HttpServlet {
	
	public void init() {
		System.out.println("서블릿이 처음 로드될때 1번만 실행됨");
	}
	
	public void service(HttpServletRequest reqest, HttpServletResponse response) {
		System.out.println("이 페이지를 요청할 때 마다 실행됨");
	}
	
	public void destroy() {
		System.out.println("서블릿 서버에서 내려갈때 1번만 실행됨"); 
	}
}







