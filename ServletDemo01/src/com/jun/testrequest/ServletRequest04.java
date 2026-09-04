package com.jun.testrequest;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/sr04")
public class ServletRequest04 extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uname=req.getParameter("uname");
        String age=(String)req.getAttribute("age");
        System.out.println("servlet04---age:"+age);
        System.out.println("上一个servlet传过来的数据uname的值:"+uname);
    }
}
