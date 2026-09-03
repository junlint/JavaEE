package com.jun.service.impl;

import com.jun.dao.UserDao;
import com.jun.dao.impl.UserDaoImpl;
import com.jun.pojo.User;
import com.jun.service.UserService;

public class UserServiceImpl implements UserService {
    UserDao u=new UserDaoImpl();
    public User selectOne(String uname,String pwd)
    {
        return u.selectOne(uname,pwd);
    }
}
