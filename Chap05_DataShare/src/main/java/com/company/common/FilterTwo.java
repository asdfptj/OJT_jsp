package com.company.common;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class FilterTwo implements Filter {
	
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("서버에 올라갈때 1번만 실행된다. FilterTwo");
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// 서블릿이나 JSP에 접근하기 전에 실행해야 할 명령
		System.out.println("request 요청이 있을때 마다 실행된다 IN. FilterTwo");
		
		chain.doFilter(request, response);
		
		// 서블릿이나 JSP 실행이 끝나고 브라우저에 응답하기 전에 실행해야 할 명령
		System.out.println("request 요청이 있을때 마다 실행된다 OUT. FilterTwo");
	}

	public void destroy() {
		System.out.println("서버에 종료될때 1번만 실행된다. FilterTwo");
	}

}
