<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: yinhaoyu
  Date: 2020/4/7
  Time: 20:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    if ("1".equals(request.getAttribute("flag"))) {
        session.removeAttribute("goods");
    } else {
        ArrayList list = (ArrayList) session.getAttribute("goods");
        if (list != null) {
            for (Object o : list) {
                out.println(o + "<br/>");
            }
        }
    }
%>
<a href="Buy.jsp">继续购物</a>
<a href="Pay.jsp?flag=1">清空购物车</a>
</body>
</html>
