package com.jun.testresponse;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/red03")
public class ServletResponse03 extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        String uname=req.getParameter("uname");
        System.out.println("前台传递过来的数据uname:"+uname);

        resp.sendRedirect("http://www.baidu.com");

        System.out.println("--重定向后打印的内容--");

    }
}
