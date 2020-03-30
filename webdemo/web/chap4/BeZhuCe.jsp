<%--
  Created by IntelliJ IDEA.
  User: yinhaoyu
  Date: 2020/3/30
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String name=request.getParameter("name");
    String password=request.getParameter("password");
    String sex=request.getParameter("sex");
%>
姓名：<%=name%><br>
密码：<%=password%><br>
性别：<%=sex%>
</body>
</html>
