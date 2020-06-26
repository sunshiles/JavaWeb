<%@ page import="com.whc.dao.UserDao" %>
<%@ page import="com.whc.factory.DaoFactory" %>
<%@ page import="com.whc.entity.User" %>
<%--
  Created by IntelliJ IDEA.
  User: yinhaoyu
  Date: 2020/4/15
  Time: 22:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String userName = request.getParameter("name");
    String password = request.getParameter("password");
    UserDao userDao = DaoFactory.getUserDao();
    User user = new User();
    user.setUserName(userName);
    user.setPassword(password);
    boolean isTrue = userDao.login(user.getUserName(), user.getPassword());
    if (isTrue) {
        //第一步创建cookie对象
        Cookie cookie1 = new Cookie("name", user.getUserName());
        Cookie cookie2 = new Cookie("password", user.getPassword());
        //第二步设置cookie的有效期
        cookie1.setMaxAge(60 * 60 * 24);
        cookie2.setMaxAge(60 * 60 * 24);
        //第三步向客户端添加cookie信息
        response.addCookie(cookie1);
        response.addCookie(cookie2);
        session.setMaxInactiveInterval(60 * 60 * 24);
        //设置session.setAttribute()
        session.setAttribute("sessionName", user.getUserName());
%>
<jsp:forward page="index.jsp"></jsp:forward>
<%
    } else {
        response.sendRedirect("failure.jsp");
    }
%>
</body>
</html>
