package com.jun.testcookie;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;

@WebServlet("/tc04")
public class TestCookie04 extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name="姓名";
        String value="虚照";

        name=URLEncoder.encode(name);
        value= URLEncoder.encode(value);

        Cookie c=new Cookie(name,value);

        resp.addCookie(c);
    }
}
