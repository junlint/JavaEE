package com.jun.filter;


import com.jun.pojo.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter("/*")
public class LoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        String uri = request.getRequestURI();

        if(uri.contains("login.jsp"))
        {
            filterChain.doFilter(request, response);
            return ;
        }

        if(uri.contains("/images"))
        {
            filterChain.doFilter(request, response);
            return ;
        }

        if(uri.contains("/loginServlet"))
        {
            filterChain.doFilter(request, response);
            return ;
        }

        User user=(User)request.getSession().getAttribute("user");

        if(user!=null)
        {
            filterChain.doFilter(request, response);
            return ;
        }


        response.sendRedirect("login.jsp");

    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }


}
