package com.whc.dao;

import com.whc.entity.Order;
import com.whc.entity.RealUser;

import java.util.ArrayList;

public interface OrderDao {
    boolean addUser(RealUser realUser);

    ArrayList<RealUser> queryAll();

    ArrayList<RealUser> query(String value);

    boolean delUser(String id);

    boolean updateUser(RealUser realUser);

    RealUser queryByName(String name);

    boolean updatePassword(String name, String newPassword);

    RealUser queryById(int id);

    int queryPageCount(String name);

    ArrayList<Order> queryByPage(int currentPage, String name);
}

