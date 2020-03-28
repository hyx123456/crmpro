package com.ujiuye.crmpro.common.filter;


import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        //localhost:8080/crmpro/login.jsp
        String currentURL = request.getRequestURI();
        ////localhost:8080/crmpro/
        String ctxPath = request.getContextPath();

        // 除掉项目名称时访问页面当前路径
        String targetURL = currentURL.substring(ctxPath.length());
        HttpSession session = request.getSession(false);
        // 对当前页面进行判断，如果当前页面不为登录页面
        if (!("/login.jsp".equals(targetURL))) {

            // 在不为登陆页面时，再进行判断，如果不是登陆页面也没有session则跳转到登录页面，
            if (session == null || session.getAttribute("LOGIN") == null) {
                response.sendRedirect("/login.jsp");
                return;
            } else {
                // 这里表示正确，放行
                filterChain.doFilter(request, response);
                return;
            }
        } else {
            // 这里表示如果当前页面是登陆页面，放行
            filterChain.doFilter(request, response);
            return;
        }

    }

    @Override
    public void destroy() {

    }
}
