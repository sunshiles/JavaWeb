package com.whc.dao;

import com.whc.conn.DBConn;

import java.sql.*;

public class UserDao {
    private PreparedStatement preparedStatement = null;
    private ResultSet resultSet = null;
    private boolean isTrue = true;
    /**
     * 登录方法
     * @param name
     * @param password
     * @return
     */
    public boolean login(String name, String password) {
        Connection con = DBConn.getConnection();
        //执行查询语句
        String sql = "select * from admin_info where name=? and pwd = ?;";
        try {
            preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        try {
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                isTrue = true;
            } else {
                isTrue = false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConn.close(con,preparedStatement,resultSet);
        }
        return isTrue;
    }

    /**
     * 添加用户
     *
     * @param name
     * @param password
     * @return
     */
    public boolean addUser(String name, String password) {
        Connection con = DBConn.getConnection();
        //执行查询语句
        String sql = "insert into admin_info(name, pwd) values(?, ?);";
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
            System.out.println("用户添加成功");
            isTrue = true;
        } else {
            System.out.println("错误");
            isTrue = false;
        }
        DBConn.close(con,preparedStatement);
        return isTrue;
    }


}
