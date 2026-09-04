package com.jun.testservletcontext;


import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/tt01")
public class TestServletContext01 extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.setContentType("text/html");
        resp.setCharacterEncoding("UTF-8");


//        ServletContext servletContext=req.getServletContext();

        //通过sessino对象获取
//        ServletContext servletContext1=req.getSession().getServletContext();
//
        //通过servletConfig对象获取，在Servlet标准中提供了ServletConfig方法；
//        ServletConfig servletConfig=getServletConfig();
//        ServletContext s1=servletConfig.getServletContext();

        ServletContext servletContext=getServletContext();

        String realPath=servletContext.getRealPath("/");

        String serverInfo=servletContext.getServerInfo();

        resp.getWriter().print(realPath);
        resp.getWriter().print(serverInfo);
        servletContext.setAttribute("name","xing");

    }
}
