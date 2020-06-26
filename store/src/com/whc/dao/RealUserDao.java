package com.whc.dao;

import com.whc.entity.RealUser;

import java.util.ArrayList;

public interface RealUserDao {
    boolean addUser(RealUser realUser);

    ArrayList<RealUser> queryAll();

    ArrayList<RealUser> query(String value);

    boolean delUser(String id);

    boolean updateUser(RealUser realUser);

    RealUser queryByName(String name);

    boolean updatePassword(String name, String newPassword);

    RealUser queryById(int id);

    int queryPageCount(String name);
    int verify(String name,String password);

    ArrayList<RealUser> queryByPage(int currentPage, String name);
}

