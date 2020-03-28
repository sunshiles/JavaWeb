<%--
  Created by IntelliJ IDEA.
  User: yinhaoyu
  Date: 2020/3/24
  Time: 16:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head> 
    <title>Title</title>
</head>
<body>
<%
    String admin = request.getParameter("admin");
    String password = request.getParameter("password");
    if ("admin".equals(admin) && "123456".equals(password)) {
        request.getRequestDispatcher("success.jsp").forward(request, response);
    } else {
        response.sendRedirect("failure.jsp");
    }
%>
</body>
</html>
