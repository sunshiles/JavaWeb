<%--
  Created by IntelliJ IDEA.
  User: yinhaoyu
  Date: 2020/4/13
  Time: 14:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    int count = 1;
    if (application.getAttribute("count") == null) {
        application.setAttribute("count", 1);
    } else {
        count = (Integer)application.getAttribute("count");
        if (session.isNew()) {
            application.setAttribute("count", ++count);
        }
    }
    out.print("访问人数："+count);
%>
</body>
</html>
