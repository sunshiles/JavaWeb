package com.whc.dao;

import javax.servlet.http.Cookie;
import java.sql.*;

public class UserDao {
    String url = "jdbc:mysql://localhost:3306/db_shop?serverTimezone=GMT";
    String user = "root";
    String db_pwd = "root";
    Connection con = null;
    ResultSet resultSet = null;
    Statement statement = null;

    public UserDao() {
        //注册驱动
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("注册失败");
            e.printStackTrace();
        }
    }

    public boolean login(String name, String password) throws SQLException {
        //创建连接
        boolean isTrue = true;
        try {
            con = DriverManager.getConnection(url, user, db_pwd);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        try {
            statement = con.createStatement();
        } catch (SQLException e) {
            e.printStackTrace();
        }
//            执行查询语句
        String sql = "select * from admin_info where name=? and pwd = ?;";
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        try {
            resultSet = preparedStatement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
//            打印查询出来的东西
        if (resultSet.next()) {
            isTrue = true;
        } else {
            isTrue = false;
        }
        return isTrue;
    }

    public boolean addUser(String name, String password) {
        boolean isTrue = true;
        //创建连接
        try {
            con = DriverManager.getConnection(url, user, db_pwd);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            statement = con.createStatement();
        } catch (SQLException e) {
            e.printStackTrace();
        }
//            执行查询语句
        String sql = "insert into admin_info(name, pwd) values(?, ?);";
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = con.prepareStatement(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, password);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        int result = 0;
        try {
            result = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
//            打印查询出来的东西
        if (result > 0) {
            try {
                preparedStatement.close();
                statement.close();
                con.close();
                System.out.println("用户添加成功");
                isTrue = true;
            } catch (SQLException e) {
                e.printStackTrace();
            }

        } else {
            System.out.println("错误");
            isTrue = false;
        }
        return isTrue;
    }

    public void close() {
        try {
            resultSet.close();
            statement.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
