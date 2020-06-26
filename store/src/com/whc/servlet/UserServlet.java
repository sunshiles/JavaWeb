package com.whc.servlet;

import com.whc.dao.UserDao;
import com.whc.entity.User;
import com.whc.factory.DaoFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        String operate = request.getParameter("operate");
        String id = request.getParameter("id");
//        String keywords = request.getParameter("keywords");
        PrintWriter out = response.getWriter();

        if ("login".equals(operate)) {
            HttpSession session = request.getSession(true);
            String username = request.getParameter("name");
            String password = request.getParameter("password");
            //进行登录验证
            boolean isTrue;
            UserDao userDao = DaoFactory.getUserDao();
            isTrue = userDao.login(username, password);
            if (isTrue) {
                //第一步创建Cookie对象
                Cookie cookie1 = new Cookie("username", username);
                Cookie cookie2 = new Cookie("password", password);
                //第二步设置Cookie的有效期，以秒为单位
                cookie1.setMaxAge(24 * 60 * 60);
                cookie2.setMaxAge(24 * 60 * 60);
                //向客户端写cookie
                response.addCookie(cookie1);
                response.addCookie(cookie2);
                session.setMaxInactiveInterval(60 * 5);
                session.setAttribute("username", username);
                request.getRequestDispatcher("admin/index.jsp").forward(request, response);
            } else {
                response.sendRedirect("admin/failure.jsp");
            }
        }
        if ("add".equals(operate)) {
            System.out.println("1........");
            String userName = request.getParameter("name");
            String password = request.getParameter("password1");
            UserDao userDao = DaoFactory.getUserDao();
            User user = new User();
            user.setUserName(userName);
            user.setPassword(password);
            boolean isTrue = userDao.addUser(user.getUserName(), user.getPassword());
            if (isTrue) {
                out.printf("success");
            } else {
                out.print("失败");
            }
        }
//        if ("queryAll".equals(operate)) {
//            UserDao userDao = DaoFactory.getUserDao();
//            ArrayList<User> users = userDao.queryAll();
//            request.setAttribute("users", users);
//            request.getRequestDispatcher("admin/listUser.jsp").forward(request, response);
//        }
//        if ("query".equals(operate)) {
//            UserDao userDao = DaoFactory.getUserDao();
//            ArrayList<User> users = userDao.query(keywords);
//            request.setAttribute("users", users);
//            request.getRequestDispatcher("admin/listUser.jsp").forward(request, response);
//        }
        if ("del".equals(operate)) {
            System.out.println("2........");

            int currentPage = 1;
            String username = "%";
            UserDao delUser = DaoFactory.getUserDao();
            boolean isTrue = delUser.delUser(id);
            if (isTrue) {
                UserDao userDao = DaoFactory.getUserDao();
                ArrayList<User> users = userDao.queryByPage(currentPage, username);
                int pageCount = userDao.queryPageCount(username);
                request.setAttribute("users", users);
                request.setAttribute("currentPage", currentPage);
                request.setAttribute("pageCount", pageCount);
                request.getRequestDispatcher("admin/listUser.jsp").forward(request, response);
            } else {
                response.sendRedirect("admin/failure.jsp");
            }

        }
        if ("update".equals(operate)) {
            System.out.println("3........");

            int currentPage = 1;
            String username = "%";
            String password = request.getParameter("password1");
            String name = request.getParameter("name");
            id = request.getParameter("id");
            int id1 = Integer.parseInt(id);
            UserDao userDao = DaoFactory.getUserDao();
            User user = new User();
            user.setId(id1);
            user.setUserName(name);
            user.setPassword(password);
            userDao.updateUser(user);
            ArrayList<User> users = userDao.queryByPage(currentPage, username);
            int pageCount = userDao.queryPageCount(username);
            request.setAttribute("users", users);
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("pageCount", pageCount);
            request.getRequestDispatcher("admin/listUser.jsp").forward(request, response);
        }
        if ("queryByName".equals(operate)) {
            System.out.println("4........");

            String userName = request.getParameter("username");
            String username = request.getParameter("userName");
            String password = request.getParameter("password");
            UserDao userDao = DaoFactory.getUserDao();
            User user = userDao.queryByName(userName);
            User user1 = userDao.queryByName(username);
            if (userName != null && username == null && user.getUserName().equals(userName)) {
                String message = "该用户已存在";
                out.print(message);
            }
            if (password != null && !user1.getPassword().equals(password)) {
                String message = "密码错误";
                out.print(message);
            }
        }
        if ("newPassword".equals(operate)) {
            System.out.println("5........");

//            HttpSession session = request.getSession(true);
//            String userName = (String) session.getAttribute("name");
            String userName = request.getParameter("username");
            String newPassword = request.getParameter("newPassword");
            UserDao userDao = DaoFactory.getUserDao();
            boolean isTrue = userDao.updatePassword(userName, newPassword);
            if (isTrue) {
                out.print("用户更新密码成功");
            } else {
                response.sendRedirect("admin/failure.jsp");
            }
        }
        if ("queryById".equals(operate)) {
            System.out.println("6........");

            id = request.getParameter("id");
            int id1 = Integer.parseInt(id);
            UserDao userDao = DaoFactory.getUserDao();
            User user = userDao.queryById(id1);
            request.setAttribute("user", user);
            request.getRequestDispatcher("admin/updateUser.jsp").forward(request, response);
        }
        if ("queryByPage".equals(operate)) {
            int currentPage = 1;
            String username = "";
            if (request.getParameter("username") != null) {
                username = request.getParameter("username");
            }
            String currentPageString = request.getParameter("currentPage");
            if (currentPageString != null && !currentPageString.isEmpty()) {
                currentPage = Integer.parseInt(currentPageString);
            }
            UserDao userDao = DaoFactory.getUserDao();
            ArrayList<User> users = userDao.queryByPage(currentPage, username);
            int pageCount = userDao.queryPageCount(username);
            request.setAttribute("users", users);
            request.setAttribute("pageCount", pageCount);
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("username", username);
            request.getRequestDispatcher("admin/listUser.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.service(request, response);
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
