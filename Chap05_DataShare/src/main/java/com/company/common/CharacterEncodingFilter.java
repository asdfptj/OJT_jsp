package com.company.common;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class CharacterEncodingFilter implements Filter {

	private String encoding = "UTF-8";
	
	public void init(FilterConfig config) throws ServletException {
		encoding = config.getInitParameter("encoding");
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// POST로 넘어가는 모든 문자셋을 미리 지정한다.
		// doPost 또는 JSP 파일에서 문자 세팅을 할 필요가 없다
		request.setCharacterEncoding(encoding);
		
		// 이런 값도 세팅 가능
		request.setAttribute("name", "놀부");
		
		chain.doFilter(request, response);
		
	}
	
	public void destroy() {
	}

	

}
