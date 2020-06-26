package com.whc.dao;

import com.whc.entity.User;

import java.util.ArrayList;

public interface UserDao {
    boolean login(String name, String password);

    boolean addUser(String name, String password);

    ArrayList<User> queryAll();

    ArrayList<User> query(String value);

    boolean delUser(String id);

    boolean updateUser(User user);

    User queryByName(String name);

    boolean updatePassword(String name, String newPassword);

    User queryById(int id);

    int queryPageCount(String name);

    ArrayList<User> queryByPage(int currentPage, String name);


}
