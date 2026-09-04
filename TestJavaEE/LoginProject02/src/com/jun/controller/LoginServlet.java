package com.jun.controller;

import com.jun.pojo.User;
import com.jun.service.UserService;
import com.jun.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
    UserService userService=new UserServiceImpl();


    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");

        String uname=req.getParameter("uname");
        String pwd=req.getParameter("pwd");

        System.out.println(uname);
        System.out.println(pwd);

        User user=userService.selectOne(uname,pwd);

        if(user!=null)
        {
            req.getSession().setAttribute("user",user);
            resp.sendRedirect(req.getContextPath()+"/index.jsp");
        }else
        {
            req.setAttribute("failmsg","登录失败");
            req.getRequestDispatcher("/login.jsp").forward(req,resp);
        }



    }
}
