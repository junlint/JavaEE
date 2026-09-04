package com.jun.servlet;


import com.jun.dao.UserDao;
import com.jun.pojo.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");

        String uname=req.getParameter("uname");
        String pwd=req.getParameter("pwd");

        UserDao userDao=new UserDao();

        User user=userDao.selectOne(uname,pwd);

        System.out.println(user);

        if ( user != null )
        {
            resp.sendRedirect(req.getContextPath()+"/index.jsp");
        }else{
            req.setAttribute("failmsg","登录失败！");
            req.getRequestDispatcher("/login.jsp").forward(req,resp);
        }




        System.out.println(uname);
        System.out.println(pwd);
    }
}
