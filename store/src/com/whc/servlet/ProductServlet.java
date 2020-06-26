package com.whc.servlet;

import com.jspsmart.upload.*;
import com.whc.dao.ProductDao;
import com.whc.entity.Product;
import com.whc.factory.DaoFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        String operate = request.getParameter("operate");
        PrintWriter out = response.getWriter();
        /**
         * ---------------------------商品管理控制层-------------------------------
         */
        if ("queryAll".equals(operate)) {
            ProductDao productDao = DaoFactory.getProductDao();
            ArrayList<Product> products = productDao.queryAll();
            request.setAttribute("products", products);
            request.getRequestDispatcher("admin/listUser.jsp").forward(request, response);
        }
        if ("queryProByPage".equals(operate)) {
            int currentPage = 1;
            String productName = "";
            if (request.getParameter("productName") != null) {
                productName = request.getParameter("productName");
            }
            String currentPageString = request.getParameter("currentPage");
            if (currentPageString != null && !currentPageString.isEmpty()) {
                currentPage = Integer.parseInt(currentPageString);
            }
            ProductDao productDao = DaoFactory.getProductDao();
            ArrayList<Product> products = productDao.queryByPagePro(currentPage, productName);
            int pageCount = productDao.queryPageCount(productName);
            request.setAttribute("products", products);
            request.setAttribute("pageCount", pageCount);
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("productName", productName);
            request.getRequestDispatcher("admin/listProduct.jsp").forward(request, response);
        }
        if ("del".equals(operate)) {
            String id = request.getParameter("id");
            int currentPage = 1;
            String username = "%";
            ProductDao delProduct = DaoFactory.getProductDao();
            boolean isTrue = delProduct.delProduct(id);
            System.out.println(isTrue);
            if (isTrue) {
                ProductDao productDao = DaoFactory.getProductDao();
                ArrayList<Product> products = productDao.queryByPagePro(currentPage, username);
                int pageCount = productDao.queryPageCount(username);
                request.setAttribute("products", products);
                request.setAttribute("currentPage", currentPage);
                request.setAttribute("pageCount", pageCount);
                request.getRequestDispatcher("admin/listProduct.jsp").forward(request, response);
            } else {
                response.sendRedirect("admin/failure.jsp");
            }

        }
        if ("update".equals(operate)) {
            String productName;
            SmartUpload su = new SmartUpload();
            su.initialize(getServletConfig(), request, response);
            su.setAllowedFilesList("png,JPG,jpg,PNG");
            try {
                su.upload();
            } catch (SmartUploadException e) {
                e.printStackTrace();
            }
            Files files = su.getFiles();
            String imgUrl = null;
            if (files.getCount() > 0) {
                for (int i = 0; i < files.getCount(); i++) {
                    File file = files.getFile(i);
                    String ext = file.getFileExt();
                    String name = "/upload/" + file.getFileName().substring(0, file.getFileName().indexOf(ext) - 1) + System.currentTimeMillis() + "." + ext;
                    imgUrl = ".." + name;
                    System.out.println(imgUrl + "123");
                    if (!file.isMissing()) {
                        try {
                            file.saveAs(name, File.SAVEAS_VIRTUAL);
                            System.out.println(file.getFileName());
                        } catch (SmartUploadException e) {
                            e.printStackTrace();

                        }
                    }
                }
            }
            Request myRequest = su.getRequest();
            productName = myRequest.getParameter("productName");
            String code = myRequest.getParameter("code");
            String id = request.getParameter("id");
            int idInt = Integer.parseInt(id);
            String number = myRequest.getParameter("number");
            int numberInt = Integer.parseInt(number);
            String price = myRequest.getParameter("price");
            double priceDouble = Double.parseDouble(price);
            String sale = myRequest.getParameter("sale");
            double saleDouble = Double.parseDouble(sale);
            String brand = myRequest.getParameter("brand");
            String introduce = myRequest.getParameter("intro");
            String status = myRequest.getParameter("status");
            int statusInt = Integer.parseInt(status);
            String type = myRequest.getParameter("type");
            ProductDao productDao = DaoFactory.getProductDao();
            Product product = new Product();
            product.setId(idInt);
            product.setProductName(productName);
            product.setBrand(brand);
            product.setType(type);
            product.setCode(code);
            product.setIntroduce(introduce);
            product.setNumber(numberInt);
            product.setPrice(priceDouble);
            product.setSale(saleDouble);
            product.setStatus(statusInt);
            product.setPicture(imgUrl);
            productDao.updateProduct(product);
            int currentPage = 1;
            productName = "%";
            ArrayList<Product> products = productDao.queryByPagePro(currentPage, productName);
            int pageCount = productDao.queryPageCount(productName);
            request.setAttribute("products", products);
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("pageCount", pageCount);
            request.getRequestDispatcher("admin/listProduct.jsp").forward(request, response);
        }
        if ("queryById".equals(operate)) {
            String id = request.getParameter("id");
            int id1 = Integer.parseInt(id);
            ProductDao productDao = DaoFactory.getProductDao();
            Product product = productDao.queryById(id1);
            request.setAttribute("product", product);
            if (request.getContextPath().contains("admin")) {
                request.getRequestDispatcher("admin/updateProduct.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("details.jsp").forward(request, response);
            }
        }
        if ("addProduct".equals(operate)) {
            SmartUpload su = new SmartUpload();
            su.initialize(getServletConfig(), request, response);
            su.setAllowedFilesList("png,JPG,jpg,PNG");
            try {
                su.upload();
            } catch (SmartUploadException e) {
                e.printStackTrace();
            }
            Files files = su.getFiles();
            String imgUrl = null;
            if (files.getCount() > 0) {
                for (int i = 0; i < files.getCount(); i++) {
                    File file = files.getFile(i);
                    String ext = file.getFileExt();
                    String name = "/upload/" + file.getFileName().substring(0, file.getFileName().indexOf(ext) - 1) + System.currentTimeMillis() + "." + ext;
                    imgUrl = ".." + name;
                    System.out.println(imgUrl + "123");
                    if (!file.isMissing()) {
                        try {
                            file.saveAs(name, File.SAVEAS_VIRTUAL);
                            System.out.println(file.getFileName());
                        } catch (SmartUploadException e) {
                            e.printStackTrace();

                        }
                    }
                }
            }
            Request myRequest = su.getRequest();
            String productName = myRequest.getParameter("productName");
//            String img = myRequest.getParameter("img");
            String code = myRequest.getParameter("code");
            String number = myRequest.getParameter("number");
            int numberInt = Integer.parseInt(number);
            String price = myRequest.getParameter("price");
            double priceDouble = Double.parseDouble(price);
            String sale = myRequest.getParameter("sale");
            double saleDouble = Double.parseDouble(sale);
            String brand = myRequest.getParameter("brand");
            String introduce = myRequest.getParameter("intro");
            String status = myRequest.getParameter("status");
            int statusInt = Integer.parseInt(status);
            String type = myRequest.getParameter("type");
            ProductDao productDao = DaoFactory.getProductDao();
//            Product product = new Product();
            boolean isTrue = productDao.addProduct(productName, code, brand
                    , introduce, numberInt, priceDouble, saleDouble, statusInt, imgUrl, type);
            if (isTrue) {
                out.printf("success");
            } else {
                out.print("失败");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.service(req, resp);
    }

    @Override
    public void destroy() {
        super.destroy();
    }

    @Override
    public void init() throws ServletException {
        super.init();
    }
}
