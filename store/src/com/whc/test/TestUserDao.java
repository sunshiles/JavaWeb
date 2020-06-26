package com.whc.test;

import com.whc.dao.impl.ProductDaoImpl;
import com.whc.entity.Product;

import java.util.ArrayList;

public class TestUserDao {
    public static void main(String[] args) {
        String userName = "admin";
        int currentPage = 2;
        ProductDaoImpl productDao = new ProductDaoImpl();
        ArrayList<Product> products = productDao.queryByPagePro(1, "%");
        for (Product pro :
                products) {
            System.out.println(pro.getId());


        }
    }
}
