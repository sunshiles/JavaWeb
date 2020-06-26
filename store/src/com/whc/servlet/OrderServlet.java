package com.whc.servlet;

import com.whc.dao.OrderDao;
import com.whc.dao.RealUserDao;
import com.whc.dao.UserDao;
import com.whc.entity.Order;
import com.whc.entity.RealUser;
import com.whc.entity.User;
import com.whc.factory.DaoFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        String operate = request.getParameter("operate");
//        String keywords = request.getParameter("keywords");
        PrintWriter out = response.getWriter();

        if ("add".equals(operate)) {
//            String id = request.getParameter("id");
//            int idInt = Integer.parseInt(id);
            String name = request.getParameter("name");
            String password = request.getParameter("password1");
            String realName = request.getParameter("realName");
            String sex = request.getParameter("sex");
            String address = request.getParameter("address");
            String question = request.getParameter("question");
            String answer = request.getParameter("answer");
            String email = request.getParameter("email");
            String favorate = request.getParameter("favorate");
            String score = request.getParameter("score");
            int scoreInt = Integer.parseInt(score);
            String status = request.getParameter("status");
            int statusInt = Integer.parseInt(status);
            RealUserDao realUserDao = DaoFactory.getRealUserDao();
            RealUser realUser = new RealUser();
            realUser.setUserName(name);
            realUser.setPassword(password);
            realUser.setRealName(realName);
            realUser.setScore(scoreInt);
            realUser.setFavorate(favorate);
            realUser.setStatus(statusInt);
            realUser.setEmail(email);
            realUser.setAddress(address);
            realUser.setAnswer(answer);
            realUser.setQuestion(question);
            realUser.setSex(sex);
//            realUser.setId(idInt);
            boolean isTrue = realUserDao.addUser(realUser);
            if (isTrue) {
                out.printf("success");
            } else {
                out.print("失败");
            }
        }
        if ("del".equals(operate)) {
            int currentPage = 1;
            String username = "%";
            String id = request.getParameter("id");
            OrderDao orderDao = DaoFactory.getOrderDao();
            boolean isTrue = orderDao.delUser(id);
            if (isTrue) {
                ArrayList<Order> orders = orderDao.queryByPage(currentPage, username);
                int pageCount = orderDao.queryPageCount(username);
                request.setAttribute("orders", orders);
                request.setAttribute("currentPage", currentPage);
                request.setAttribute("pageCount", pageCount);
                request.getRequestDispatcher("admin/listOrder.jsp").forward(request, response);
            } else {
                response.sendRedirect("admin/failure.jsp");
            }

        }
        if ("update".equals(operate)) {
            int currentPage = 1;
            String username = "%";
            String password = request.getParameter("password1");
            String name = request.getParameter("name");
            String id = request.getParameter("id");
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
            String id;
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
            OrderDao orderDao = DaoFactory.getOrderDao();
            ArrayList<Order> orders = orderDao.queryByPage(currentPage, username);
            int pageCount = orderDao.queryPageCount(username);
            request.setAttribute("orders", orders);
            request.setAttribute("pageCount", pageCount);
            request.setAttribute("currentPage", currentPage);
            request.setAttribute("username", username);
            request.getRequestDispatcher("admin/listOrder.jsp").forward(request, response);
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
