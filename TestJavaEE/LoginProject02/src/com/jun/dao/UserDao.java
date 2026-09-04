package com.jun.dao;

import com.jun.pojo.User;

public interface UserDao {
    public abstract User selectOne(String uname, String pwd);
}
