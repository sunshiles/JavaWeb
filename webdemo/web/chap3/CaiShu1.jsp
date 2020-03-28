<%@ page import="java.util.Random" %><%--
  Created by IntelliJ IDEA.
  User: yinhaoyu
  Date: 2020/3/17
  Time: 10:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="error.jsp" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form name="tijiao" onsubmit="return check()">
    输入值：<input type="text" name="number">
    <input type="submit" value="提交">
</form>
<%!
    int random = (int) (Math.random() * 100);
    int m = 0;
%>
<%
    String t = request.getParameter("number");
    int y = -1;
    if (t != null && !"".equals(t)) {
        y = Integer.parseInt(t);
        m++;
    }
    if (m < 5) {
        if (y == -1) {
        } else if (y > random) {
%>
sorry,输入的数过大,错了<%=m%>次
<%
} else if (y < random) {
%>
sorry,输入的数过小,错了<%=m%>次
<%
} else {
    random = (int) (Math.random() * 100);
%>
一个猜了<%=m%>次，正确是否<a href="CaiShu1.jsp">继续</a>
<%
    }
} else {
    random = (int) (Math.random() * 100);
    m = 0;
%>
游戏失败,是否<a href="CaiShu1.jsp">继续</a>
<%
    }
%>
</body>
</html>
