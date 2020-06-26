package com.whc.entity;

public class IndentDetail {
    private static final long serialVersionUID = 1L;
    private int oid;
    private int pid;
    private String pName;
    private double price;
    private double sale;
    private String pic;
    private int num;
    public IndentDetail() {}
    public IndentDetail(int oid, int pid, String pName, double price,
                       double sale, String pic, int num) {
        this.oid = oid;
        this.pid = pid;
        this.pName = pName;
        this.price = price;
        this.sale = sale;
        this.pic = pic;
        this.num = num;
    }
    public int getOid() {
        return oid;
    }
    public void setOid(int oid) {
        this.oid = oid;
    }
    public int getPid() {
        return pid;
    }
    public void setPid(int pid) {
        this.pid = pid;
    }
    public String getpName() {
        return pName;
    }
    public void setpName(String pName) {
        this.pName = pName;
    }
    public double getPrice() {
        return price;
    }
    public void setPrice(double price) {
        this.price = price;
    }
    public double getSale() {
        return sale;
    }
    public void setSale(double sale) {
        this.sale = sale;
    }
    public String getPic() {
        return pic;
    }
    public void setPic(String pic) {
        this.pic = pic;
    }
    public int getNum() {
        return num;
    }
    public void setNum(int num) {
        this.num = num;
    }
}
