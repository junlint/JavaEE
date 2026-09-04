package com.jun.testcookie;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLDecoder;


@WebServlet("/tc02")
public class TestCookie02 extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");


//        Cookie cookie=new Cookie("name1","lili");
//        resp.addCookie(cookie);
//
//        Cookie c1=new Cookie("name2","啊哈");
//        resp.addCookie(c1);
//
//        Cookie c2=new Cookie("name3","虚照");
//        resp.addCookie(c2);


        Cookie[] cs=req.getCookies();

        if(cs!=null&&cs.length>0)
        {
            for(Cookie c:cs)
            {

                String name = URLDecoder.decode(c.getName());
                String value = URLDecoder.decode(c.getValue());
                System.out.println(name);
                System.out.println(value);
            }
        }
    }
}
