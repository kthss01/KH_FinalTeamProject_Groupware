package com.kh.spring.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReservationFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
//		String servletUrl = ((HttpServletRequest)request).getRequestURI();
//		System.out.println(servletUrl);
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse =(HttpServletResponse) response;
		System.out.println(httpRequest.getRequestURI());
		httpResponse.sendRedirect(httpRequest.getContextPath() + "/reservation.rez");
//		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		
	}

}
