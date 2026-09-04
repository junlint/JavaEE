package com.jun.testrequest;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/sr03")
public class ServletRequest03 extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String uname=req.getParameter("uname");
        System.out.println("浏览器传过来的数据uname的值:"+uname);
        req.setAttribute("age","18");
        String age=(String)req.getAttribute("age");

        req.getRequestDispatcher("sr04").forward(req,resp);

        System.out.println("----------sr03");
    }
}
