package com.whc.conn;

import java.sql.*;

public class DBConn {
    public static final String URL = "jdbc:mysql://localhost:3306/db_shop?serverTimezone=GMT";
    public static final String USER = "root";
    public static final String DB_PWD = "root";

    public static Connection getConnection() {
        Connection con = null;
        //注册驱动
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("驱动注册失败");
            e.printStackTrace();
        }
        try {
            con = DriverManager.getConnection(URL, USER, DB_PWD);
        } catch (SQLException e) {
            System.out.println("DriverManager.getConnection()驱动连接失败");
            e.printStackTrace();
        }
        return con;
    }

    /**
     * 关闭数据库查询连接
     */
    public static void close(Connection con, PreparedStatement preparedStatement, ResultSet resultSet) {
        if (preparedStatement != null) {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        try {
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * 关闭数据库更新连接
     */
    public static void close(Connection con, PreparedStatement preparedStatement) {
        try {
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
