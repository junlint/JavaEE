package com.jun.listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener
public class OnlineListener implements HttpSessionListener {


    private Integer onlineNum=0;
    @Override
    public void sessionCreated(HttpSessionEvent se) {
        onlineNum++;
        se.getSession().getServletContext().setAttribute("onlineNum", onlineNum);
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        onlineNum--;
        se.getSession().getServletContext().setAttribute("onlineNum", onlineNum);
    }
}
