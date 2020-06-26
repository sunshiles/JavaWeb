package com.whc.dao.impl;

import com.whc.conn.DBConn;
import com.whc.dao.ProductDao;
import com.whc.entity.Product;
import com.whc.entity.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProductDaoImpl implements ProductDao {
    private Connection con = null;
    private PreparedStatement preparedStatement = null;
    private ResultSet resultSet = null;
    private boolean isTrue = true;
    User user = new User();
    Product product = new Product();
    public final int PAGE_SIZE = 5;

    @Override
    public ArrayList<Product> queryByPagePro(int currentPage, String productName) {
        con = DBConn.getConnection();
        ArrayList<Product> products = new ArrayList<>();
        //执行查询语句
        String sql = "select * from product_info where name like ? limit ?,?;";
        try {
            preparedStatement = con.prepareStatement(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            preparedStatement.setString(1, "%" + productName + "%");
            preparedStatement.setInt(2, (currentPage - 1) * PAGE_SIZE);
            preparedStatement.setInt(3, PAGE_SIZE);
        } catch (SQLException e) {
            System.out.println("sql语句赋值错误");
            e.printStackTrace();
        }
        try {
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Product product = new Product();
                product.setId(resultSet.getInt("id"));
                product.setCode(resultSet.getString("code"));
                product.setProductName(resultSet.getString("name"));
                product.setBrand(resultSet.getString("brand"));
                product.setIntroduce(resultSet.getString("intro"));
                product.setNumber(resultSet.getInt("num"));
                product.setPrice(resultSet.getDouble("price"));
                product.setSale(resultSet.getDouble("sale"));
                product.setStatus(resultSet.getInt("status"));
                product.setType(resultSet.getString("type"));
                product.setPicture(resultSet.getString("pic"));
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConn.close(con, preparedStatement, resultSet);
        }
        return products;
    }

    @Override
    public Product queryById(int id) {
        con = DBConn.getConnection();
        //执行查询语句
        String sql = "select * from product_info where id = ?;";
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
                product.setId(resultSet.getInt("id"));
                product.setCode(resultSet.getString("code"));
                product.setProductName(resultSet.getString("name"));
                product.setBrand(resultSet.getString("brand"));
                product.setIntroduce(resultSet.getString("intro"));
                product.setNumber(resultSet.getInt("num"));
                product.setPrice(resultSet.getDouble("price"));
                product.setSale(resultSet.getDouble("sale"));
                product.setStatus(resultSet.getInt("status"));
                product.setType(resultSet.getString("type"));
                product.setPicture(resultSet.getString("pic"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConn.close(con, preparedStatement, resultSet);
        }
        return product;
    }


    @Override
    public int queryPageCount(String productName) {
        int n = 0;
        con = DBConn.getConnection();
        //执行查询语句
        String sql = "select count(*) from product_info where name like ?;";
        try {
            preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, "%" + productName + "%");
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
    public boolean delProduct(String id) {
        con = DBConn.getConnection();
        String sql = "DELETE FROM product_info where id = ? ;";
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
            System.out.println("商品删除成功");
            isTrue = true;
        } else {
            System.out.println("商品删除错误");
            isTrue = false;
        }
        DBConn.close(con, preparedStatement);
        return isTrue;
    }

    @Override
    public boolean updateProduct(Product product) {
        con = DBConn.getConnection();
        String sql = "update product_info set name = ?,code =?,type =?,brand =?,pic =?,num =?,price =?,sale =?,intro =?,status =? where id = ? ;";
        try {
            preparedStatement = con.prepareStatement(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            preparedStatement.setString(1,product.getProductName());
            preparedStatement.setString(2,product.getCode());
            preparedStatement.setString(3,product.getType());
            preparedStatement.setString(4,product.getBrand());
            preparedStatement.setString(5,product.getPicture());
            preparedStatement.setInt(6,product.getNumber());
            preparedStatement.setDouble(7,product.getPrice());
            preparedStatement.setDouble(8,product.getSale());
            preparedStatement.setString(9,product.getIntroduce());
            preparedStatement.setInt(10,product.getStatus());
            preparedStatement.setInt(11,product.getId());
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

    public boolean addProduct(String productName, String code, String brand,String intro,int number, double price, double sale, int status, String img, String type) {
        con = DBConn.getConnection();
        //执行查询语句
        String sql = "insert into product_info(name, code, type, brand, pic, num, price, sale, intro, status) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
        try {
            preparedStatement = con.prepareStatement(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            preparedStatement.setString(1,productName);
            preparedStatement.setString(2,code);
            preparedStatement.setString(3,type);
            preparedStatement.setString(4,brand);
            preparedStatement.setString(5,img);
            preparedStatement.setInt(6,number);
            preparedStatement.setDouble(7,price);
            preparedStatement.setDouble(8,sale);
            preparedStatement.setString(9,intro);
            preparedStatement.setInt(10,status);

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
    public ArrayList<Product> queryAll() {
        con = DBConn.getConnection();
        ArrayList<Product> products = new ArrayList<>();
        //执行查询语句
        String sql = "select * from product_info;";
        try {
            preparedStatement = con.prepareStatement(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        try {
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Product product = new Product();
                product.setId(resultSet.getInt("id"));
                product.setCode(resultSet.getString("code"));
                product.setProductName(resultSet.getString("name"));
                product.setBrand(resultSet.getString("brand"));
                product.setIntroduce(resultSet.getString("intro"));
                product.setNumber(resultSet.getInt("num"));
                product.setPrice(resultSet.getDouble("price"));
                product.setSale(resultSet.getDouble("sale"));
                product.setStatus(resultSet.getInt("status"));
                product.setType(resultSet.getString("type"));
                product.setPicture(resultSet.getString("pic"));
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConn.close(con, preparedStatement, resultSet);
        }
        return products;
    }

}
