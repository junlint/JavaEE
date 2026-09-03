package com.jun.testservletcontext;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/tt02")
public class TestServletContext02  extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServletContext context=getServletContext();

        String name=(String)context.getAttribute("name");
        System.out.println(name);
        context.removeAttribute("name");

        name=(String)context.getAttribute("name");
        System.out.println(name);
    }
}
