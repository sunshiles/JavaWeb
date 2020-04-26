<%--
  Created by IntelliJ IDEA.
  User: yinhaoyu
  Date: 2020/4/7
  Time: 10:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String name = (String) request.getAttribute("name");
    String sessionName = (String) session.getAttribute("sessionName");
    if (sessionName == null) {
        response.sendRedirect("Register.jsp");
    }
%>
<%=name%>登录商城！<br>
<%=sessionName%>登录商城！<br>
<a href="LoginOut.jsp">退出</a>
</body>
</html>
