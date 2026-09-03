package com.jun.filter;


import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

@WebFilter("/sl01")
public class AFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("A过滤器初始化");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        System.out.println("A过滤器执行-过滤请求");

        filterChain.doFilter(servletRequest,servletResponse);

        System.out.println("A过滤器执行-过滤响应");
    }

    @Override
    public void destroy() {
        System.out.println("A过滤器销毁");
    }


}
