package com.jun.testcookie;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/tc05")
public class TestCookie05 extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cookie c=new Cookie("name001","xing");
        c.setPath("/");
        Cookie c1=new Cookie("name002","xing&liuying");
        c1.setPath("/s2");
        Cookie c2=new Cookie("name003","xing&zhigengniao");
        c2.setPath("/s1");
        Cookie c3=new Cookie("name004","xing&qiong");
        c3.setPath("/s2/tc04");
        resp.addCookie(c);
        resp.addCookie(c1);
        resp.addCookie(c2);
        resp.addCookie(c3);
    }
}
