package com.whc.dao;

import com.whc.entity.Product;

import java.util.ArrayList;

public interface ProductDao {
    ArrayList<Product> queryByPagePro(int currentPage, String productName);
    Product queryById(int id);
    int queryPageCount(String name);
    boolean delProduct(String id);
    boolean updateProduct(Product product);
    ArrayList<Product> queryAll() ;
    boolean addProduct
            (String productName, String code, String brand, String intro, int number, double price, double sale, int status, String img, String type);
}