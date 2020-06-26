package com.whc.dao.impl;

import com.whc.conn.DBConn;
import com.whc.dao.UserDao;
import com.whc.entity.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserDaoImpl implements UserDao {
    private Connection con = null;
    private PreparedStatement preparedStatement = null;
    private ResultSet resultSet = null;
    private boolean isTrue = true;
    User user = new User();
    public final int PAGE_SIZE = 5;

    /**
     * 登录方法
     *
     * @param name
     * @param password
     * @return
     */
    @Override
    public boolean login(String name, String password) {
        con = DBConn.getConnection();
        //执行查询语句
        String sql = "select * from admin_info where name = ? and pwd = ?;";
        try {
            preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, password);
        } catch (SQLException e) {
            System.out.println("sql语句赋值错误");
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
            DBConn.close(con, preparedStatement, resultSet);
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
    @Override
    public boolean addUser(String name, String password) {
        con = DBConn.getConnection();
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
    public ArrayList<User> queryAll() {
        con = DBConn.getConnection();
        ArrayList<User> users = new ArrayList<>();
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
                User user = new User();
                user.setId(resultSet.getInt("id"));
                user.setUserName(resultSet.getString("name"));
                user.setPassword(resultSet.getString("pwd"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConn.close(con, preparedStatement, resultSet);
        }
        return users;
    }

    /**
     * 查询用户
     *
     * @param value
     * @return
     */
    public ArrayList<User> query(String value) {
        String name = value;
        con = DBConn.getConnection();
        ArrayList<User> users = new ArrayList<>();
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
                User user = new User();
                user.setId(resultSet.getInt("id"));
                user.setUserName(resultSet.getString("name"));
                user.setPassword(resultSet.getString("pwd"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConn.close(con, preparedStatement, resultSet);
        }
        return users;
    }

    public boolean delUser(String id) {
        con = DBConn.getConnection();
        String sql = "DELETE FROM admin_info where id = ? ;";
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
    public User queryByName(String name) {
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
                user.setUserName(username);
                user.setPassword(password);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConn.close(con, preparedStatement, resultSet);
        }
        return user;
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
    public User queryById(int id) {
        con = DBConn.getConnection();
        //执行查询语句
        String sql = "select * from admin_info where id = ?;";
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
                user.setId(id);
                user.setUserName(username);
                user.setPassword(password);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConn.close(con, preparedStatement, resultSet);
        }
        return user;
    }

    @Override
    public int queryPageCount(String name) {
        int n = 0;
        con = DBConn.getConnection();
        //执行查询语句
        String sql = "select count(*) from admin_info where name like ?;";
        try {
            preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1,"%"+name+"%");
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
    public ArrayList<User> queryByPage(int currentPage,String name) {
        con = DBConn.getConnection();
        ArrayList<User> users = new ArrayList<>();
        //执行查询语句
        String sql = "select * from admin_info where name like ? limit ?,?;";
        try {
            preparedStatement = con.prepareStatement(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            preparedStatement.setString(1,"%"+name+"%");
            preparedStatement.setInt(2, (currentPage-1)*PAGE_SIZE);
            preparedStatement.setInt(3, PAGE_SIZE);
        } catch (SQLException e) {
            System.out.println("sql语句赋值错误");
            e.printStackTrace();
        }
        try {
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                User user = new User();
                user.setId(resultSet.getInt("id"));
                user.setUserName(resultSet.getString("name"));
                user.setPassword(resultSet.getString("pwd"));
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConn.close(con, preparedStatement, resultSet);
        }
        return users;
    }
}

