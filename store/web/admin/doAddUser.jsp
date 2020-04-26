<%@ page import="java.sql.*" %>
<%@ page import="com.whc.dao.UserDao" %>
<%--
Created by IntelliJ IDEA.
User: yinhaoyu
Date: 2020/4/21
Time: 15:50
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String name = request.getParameter("name");
    String password = request.getParameter("password1");
    UserDao userDao = new UserDao();
    boolean isTrue = userDao.addUser(name, password);
    if (isTrue) {
        out.print("success");
    } else {
        out.print("失败");
    }
%>
</body>
</html>
