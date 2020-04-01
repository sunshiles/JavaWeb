<%--
  Created by IntelliJ IDEA.
  User: yinhaoyu
  Date: 2020/3/31
  Time: 16:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setAttribute("nameDemo","testName");
    request.setCharacterEncoding("UTF-8");
    String name = request.getParameter("name");
    String password = request.getParameter("password");
    if ("admin".equals(name) && "123".equals(password)) {
%>
<jsp:forward page="Result.jsp"></jsp:forward>
<%
    }else {
        response.sendRedirect("Failure.jsp");
    }
%>
</body>
</html>
