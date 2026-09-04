package com.jun.download;


import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

@WebServlet("/downloadServlet")
public class DownloadServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");


        String filename=req.getParameter("filename");

        String path=req.getServletContext().getRealPath("/download/");

        File file=new File(path+filename);
        System.out.println("真实路径是：" + path);

        if(file.exists())
        {
            resp.setContentType("application/octet-stream");

            resp.setHeader("Content-Disposition","attachment;filename="+filename);

            FileInputStream fis=new FileInputStream(file);

            ServletOutputStream os=resp.getOutputStream();

            int n=fis.read();
            while(n!=-1)
            {
                os.write(n);
                n=fis.read();
            }
        }
        else{
            resp.getWriter().println("文件不存在，下载失败！！！");
        }


    }
}
