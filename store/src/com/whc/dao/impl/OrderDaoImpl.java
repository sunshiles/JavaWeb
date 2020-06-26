package com.whc.dao.impl;

import com.whc.conn.DBConn;
import com.whc.dao.OrderDao;
import com.whc.entity.Order;
import com.whc.entity.RealUser;
import com.whc.entity.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class OrderDaoImpl implements OrderDao {

    private Connection con = null;
    private PreparedStatement preparedStatement = null;
    private ResultSet resultSet = null;
    private boolean isTrue = true;
    RealUser realUser = new RealUser();
    public final int PAGE_SIZE = 5;

    @Override
    public boolean addUser(RealUser realUser) {
        con = DBConn.getConnection();
        //执行查询语句
        String sql = "insert into user_info(userName, password,realName,sex,address,question,answer,email,favorate,score,status,regDate) values(?,?,?,?,?,?,?,?,?,?,?,?);";
        try {
            preparedStatement = con.prepareStatement(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            preparedStatement.setString(1, realUser.getUserName());
            preparedStatement.setString(2, realUser.getPassword());
            preparedStatement.setString(3, realUser.getRealName());
            preparedStatement.setString(4, realUser.getSex());
            preparedStatement.setString(5, realUser.getAddress());
            preparedStatement.setString(6, realUser.getQuestion());
            preparedStatement.setString(7, realUser.getAnswer());
            preparedStatement.setString(8, realUser.getEmail());
            preparedStatement.setString(9, realUser.getFavorate());
            preparedStatement.setInt(10, realUser.getScore());
            preparedStatement.setInt(11, realUser.getStatus());
            preparedStatement.setString(12, realUser.getRegDate());
        } catch (SQLException e) {
            System.out.println("sql语句赋值错误");
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
            System.out.println("用户添加错误");
            isTrue = false;
        }
        DBConn.close(con, preparedStatement);
        return isTrue;
    }

    /**
     * 查询所有的用户
     *
     * @return
     */
    @Override
    public ArrayList<RealUser> queryAll() {
        con = DBConn.getConnection();
        ArrayList<RealUser> realUsers = new ArrayList<>();
        //执行查询语句
        String sql = "select * from admin_info;";
        try {
            preparedStatement = con.prepareStatement(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        try {
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                RealUser realUser = new RealUser();
                realUser.setId(resultSet.getInt("id"));
                realUser.setUserName(resultSet.getString("name"));
                realUser.setPassword(resultSet.getString("pwd"));
                realUsers.add(realUser);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConn.close(con, preparedStatement, resultSet);
        }
        return realUsers;
    }

    /**
     * 查询用户
     *
     * @param value
     * @return
     */
    public ArrayList<RealUser> query(String value) {
        String name = value;
        con = DBConn.getConnection();
        ArrayList<RealUser> realUsers = new ArrayList<>();
        //执行查询语句
        String sql = "select * from admin_info WHERE name = ? ;";
        try {
            preparedStatement = con.prepareStatement(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            preparedStatement.setString(1, name);
        } catch (SQLException e) {
            System.out.println("sql语句赋值错误");
            e.printStackTrace();
        }
        try {
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                RealUser realUser = new RealUser();
                realUser.setId(resultSet.getInt("id"));
                realUser.setUserName(resultSet.getString("name"));
                realUser.setPassword(resultSet.getString("pwd"));
                realUsers.add(realUser);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConn.close(con, preparedStatement, resultSet);
        }
        return realUsers;
    }

    public boolean delUser(String id) {
        con = DBConn.getConnection();
        String sql = "DELETE FROM order_info where id = ? ;";
        try {
            preparedStatement = con.prepareStatement(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            preparedStatement.setString(1, id);
        } catch (SQLException e) {
            System.out.println("sql语句赋值错误");
            e.printStackTrace();
        }
        int result = 0;
        try {
            result = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (result > 0) {
            System.out.println("用户删除成功");
            isTrue = true;
        } else {
            System.out.println("用户删除错误");
            isTrue = false;
        }
        DBConn.close(con, preparedStatement);
        return isTrue;
    }

    @Override
    public boolean updateUser(RealUser realUser) {
        return false;
    }

    public boolean updateUser(User user) {
        con = DBConn.getConnection();
        String sql = "update admin_info set name = ?,pwd =? where id = ? ;";
        try {
            preparedStatement = con.prepareStatement(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            preparedStatement.setString(1, user.getUserName());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setInt(3, user.getId());
        } catch (SQLException e) {
            System.out.println("sql语句赋值错误");
            e.printStackTrace();
        }
        int result = 0;
        try {
            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (result > 0) {
            System.out.println("用户更新成功");
            isTrue = true;
        } else {
            System.out.println("用户更新错误");
            isTrue = false;
        }
        DBConn.close(con, preparedStatement);
        return isTrue;
    }

    @Override
    public RealUser queryByName(String name) {
        con = DBConn.getConnection();
        //执行查询语句
        String sql = "select * from admin_info where name = ?;";
        try {
            preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, name);
        } catch (SQLException e) {
            System.out.println("sql语句赋值错误");
            e.printStackTrace();
        }
        try {
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                String username = resultSet.getString("name");
                String password = resultSet.getString("pwd");
                realUser.setUserName(username);
                realUser.setPassword(password);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConn.close(con, preparedStatement, resultSet);
        }
        return realUser;
    }

    @Override
    public boolean updatePassword(String name, String newPassword) {
        con = DBConn.getConnection();
        String sql = "update admin_info set pwd =? where name = ? ;";
        try {
            preparedStatement = con.prepareStatement(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            preparedStatement.setString(1, newPassword);
            preparedStatement.setString(2, name);
        } catch (SQLException e) {
            System.out.println("sql语句赋值错误");
            e.printStackTrace();
        }
        int result = 0;
        try {
            result = preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (result > 0) {
            System.out.println("用户更新密码成功");
            isTrue = true;
        } else {
            System.out.println("用户更新密码错误");
            isTrue = false;
        }
        DBConn.close(con, preparedStatement);
        return isTrue;
    }

    @Override
    public RealUser queryById(int id) {
        con = DBConn.getConnection();
        //执行查询语句
        String sql = "select * from order_info where id = ?;";
        try {
            preparedStatement = con.prepareStatement(sql);
            preparedStatement.setInt(1, id);
        } catch (SQLException e) {
            System.out.println("sql语句赋值错误");
            e.printStackTrace();
        }
        try {
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                id = resultSet.getInt("id");
                String username = resultSet.getString("name");
                String password = resultSet.getString("pwd");
                realUser.setId(id);
                realUser.setUserName(username);
                realUser.setPassword(password);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConn.close(con, preparedStatement, resultSet);
        }
        return realUser;
    }

    @Override
    public int queryPageCount(String name) {
        int n = 0;
        con = DBConn.getConnection();
        //执行查询语句
        String sql = "select count(*) from order_info where userId like ?;";
        try {
            preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, "%" + name + "%");
        } catch (SQLException e) {
            System.out.println("sql语句赋值错误");
            e.printStackTrace();
        }
        try {
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                n = (resultSet.getInt(1) + PAGE_SIZE - 1) / PAGE_SIZE;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConn.close(con, preparedStatement, resultSet);
        }
        return n;
    }

    @Override
    public ArrayList<Order> queryByPage(int currentPage, String name) {
        con = DBConn.getConnection();
        ArrayList<Order> orders = new ArrayList<>();
        //执行查询语句
        String sql = "select * from order_info where  CAST(userId as CHAR) like ? limit ?,?;";
        System.out.println(sql);
        try {
            preparedStatement = con.prepareStatement(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            preparedStatement.setString(1, "%" + name + "%");
            preparedStatement.setInt(2, (currentPage - 1) * PAGE_SIZE);
            preparedStatement.setInt(3, PAGE_SIZE);
        } catch (SQLException e) {
            System.out.println("sql语句赋值错误");
            e.printStackTrace();
        }
        try {
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Order order = new Order();
                order.setOrderTime(resultSet.getString(4));
                order.setUserId(resultSet.getInt(2));
                order.setId(resultSet.getInt(1));
                order.setStatus(resultSet.getString(3));
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConn.close(con, preparedStatement, resultSet);
        }
        return orders;
    }
}

