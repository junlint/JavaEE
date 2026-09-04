package com.jun.servlet;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/sl06")
public class Servlet06 extends HttpServlet {

    private static final long serialversionUID=1L;

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String key=req.getParameter("key");
        if(key!=null&&"logout".equals(key))
        {
            req.getSession().invalidate();
            return ;
        }

        HttpSession s=req.getSession();

        Integer num=(Integer)s.getServletContext().getAttribute("onlineNum");

        resp.setContentType("text/html;charset=utf-8");
        resp.getWriter().write("在线人数:"+num+"<h2><a href='sl06?key=logout'>退出</a></h2>");

    }
}
