package com.jun.testrequest;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;

@WebServlet("/sr01")
public class ServletRequest01 extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        StringBuffer url=req.getRequestURL();
        System.out.println("客户端请请求时的完整URL路径:"+url);
        String uri=req.getRequestURI();
        System.out.println("客户端请求的资源部分:"+uri);

        String queryString=req.getQueryString();
        System.out.println("请求的参数:"+queryString);

        String method=req.getMethod();
        System.out.println("请求方式:"+method);

        String protocol=req.getProtocol();
        System.out.println("请求协议"+protocol);

        String contextPath=req.getContextPath();
        System.out.println("获取项目站点名:"+contextPath);

        System.out.println("-----------------------");

        String uname=req.getParameter("uname");
        System.out.println("指定的uname参数为："+uname);

        String pwd=req.getParameter("pwd");
        System.out.println("指定的pwd参数为:"+pwd);

        String[] hobbies=req.getParameterValues("hobby");
        System.out.println("指定的hobby参数为:"+ Arrays.toString(hobbies));

    }
}
