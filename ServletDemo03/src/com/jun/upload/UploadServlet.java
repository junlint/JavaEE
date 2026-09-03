package com.jun.upload;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;


@MultipartConfig
@WebServlet("/uploadServlet")
public class UploadServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String uname=req.getParameter("filename");


        Part part=req.getPart("uploadfile");

        String fileName=part.getSubmittedFileName();

        System.out.println(req.getServletContext().getRealPath("/")+fileName);
        part.write(req.getServletContext().getRealPath("/")+fileName);
    }
}
