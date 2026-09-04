package com.jun.dao;

import com.jun.pojo.User;

import java.sql.*;

import static java.lang.Class.forName;

public class UserDao {

    public User selectOne(String uname, String pwd)
    {
        User user=null;
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;



        //1.加载驱动
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");
            conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/tesx?useUnicode=true&characterEncoding=utf-8&useSSL=false&serverTimezone=GMT%2B8&allowPublicKeyRetrieval=true","root","Zjyq162659!");
            ps=conn.prepareStatement("select * from t_user where uname = ? and pwd = ? ");

            ps.setString(1,uname);
            ps.setString(2,pwd);

            rs=ps.executeQuery();

            if(rs.next())
            {
                int uid=rs.getInt("uid");
                String username=rs.getString("uname");
                String password=rs.getString("pwd");
                user=new User(uid,username,password);
            }







        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally{
            try {
                rs.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            try {
                ps.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            try {
                conn.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        }


        return user;
    }
}
