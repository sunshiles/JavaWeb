package com.whc.entity;

import java.util.ArrayList;

public class Indent {
    //private static final long serialVersionUID = 1L;
    private int id;
    private int userId;
    private String userName;
    private String address;
    private String status;
    private String ordertime;
    //多个对象关联(集合)，可以加载多个相关表的记录,封装成实体对象。
    private ArrayList<IndentDetail> detailList = new ArrayList<IndentDetail>();
    public Indent() {}
    public Indent(int id, int userId, String userName, String address,
                 String status, String ordertime, ArrayList<IndentDetail> detailList) {
        this.id = id;
        this.userId = userId;
        this.userName = userName;
        this.address = address;
        this.status = status;
        this.ordertime = ordertime;
        this.detailList = detailList;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public int getUserId() {
        return userId;
    }
    public void setUserId(int userId) {
        this.userId = userId;
    }
    public String getUserName() {
        return userName;
    }
    public void setUserName(String userName) {
        this.userName = userName;
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    public String getOrdertime() {
        return ordertime;
    }
    public void setOrdertime(String ordertime) {
        this.ordertime = ordertime;
    }
    public ArrayList<IndentDetail> getDetailList() {
        return detailList;
    }
    public void setDeailList(ArrayList<IndentDetail> detailList) {
        this.detailList = detailList;
    }
}
