package com.whc.servlet;

import com.whc.entity.Cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        String operate = request.getParameter("operate");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        if ("buy".equals(operate)) {
            ArrayList<Cart> carts = (ArrayList<Cart>) session.getAttribute("carts");
            int id = Integer.parseInt(request.getParameter("id"));
            for (Cart cart :
                    carts) {
                if (cart.getId() == id) {
                    cart.setNumber(cart.getNumber() + 1);
                    break;
                }

            }
            response.sendRedirect("cart.jsp");
        }
        if ("del".equals(operate)) {
            session.removeAttribute("carts");
            response.sendRedirect("cart.jsp");
        }
        if ("remove".equals(operate)) {
            ArrayList<Cart> carts = (ArrayList<Cart>) session.getAttribute("carts");
            int id = Integer.parseInt(request.getParameter("id"));
            for (Cart cart :
                    carts) {
                if (cart.getId() == id && cart.getNumber() != 0) {
                    cart.setNumber(cart.getNumber() - 1);
                    break;
                }
            }
            response.sendRedirect("cart.jsp");
        }
        if ("add".equals(operate)) {
            int id = Integer.parseInt(request.getParameter("goodId"));
            double price = Double.parseDouble(request.getParameter("goodPrice"));
            int number = Integer.parseInt(request.getParameter("goodNumber"));
            String code = request.getParameter("goodCode");
            String type = request.getParameter("goodType");
            String name = request.getParameter("goodName");
            String picture = request.getParameter("goodPicture");
            Cart cart = new Cart();
            cart.setCode(code);
            cart.setPicture(code);
            cart.setId(id);
            cart.setPrice(price);
            cart.setName(name);
            cart.setNumber(number);
            cart.setType(type);
            cart.setPicture(picture);
            ArrayList<Cart> carts = (ArrayList<Cart>) session.getAttribute("carts");
            if (carts == null) {
                carts = new ArrayList<>();
                carts.add(cart);
            } else {
                boolean t = true;
                for (Cart c :
                        carts) {
                    if (c.getId() == cart.getId()) {
                        c.setNumber(c.getNumber() + cart.getNumber());
                        t = false;
                        break;
                    }
                }
                if (t) {
                    carts.add(cart);
                }
            }
            session.setAttribute("carts", carts);
            response.sendRedirect("cart.jsp");
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
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
