package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 访问应用根路径时重定向到前台首页（不依赖 Spring 映射与 artifact 是否包含 Controller）。
 */
public class RootRedirectFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        String cp = req.getContextPath();
        String uri = req.getRequestURI();
        if (uri.equals(cp) || uri.equals(cp + "/")) {
            resp.sendRedirect(resp.encodeRedirectURL(cp + "/front/index.html"));
            return;
        }
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
    }
}
