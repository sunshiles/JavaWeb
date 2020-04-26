<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: yinhaoyu
  Date: 2020/4/7
  Time: 20:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String goodName = request.getParameter("goodName");
    String price = request.getParameter("price");
    ArrayList<String> cart = null;
    if (goodName != null) {
        if (session.getAttribute("goods") == null) {
            cart = new ArrayList<String>();
        } else {
            cart = (ArrayList<String>) session.getAttribute("goods");
        }
        cart.add(goodName);
        session.setAttribute("goods", cart);
    }
    response.sendRedirect("Buy.jsp");
%>
</body>
</html>
