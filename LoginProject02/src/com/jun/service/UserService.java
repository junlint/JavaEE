package com.jun.service;

import com.jun.pojo.User;

public interface UserService {

    public abstract User selectOne(String uname,String pwd);
}
