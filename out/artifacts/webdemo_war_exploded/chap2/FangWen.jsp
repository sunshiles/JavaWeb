<%--
  Created by IntelliJ IDEA.
  User: yinhaoyu
  Date: 2020/3/17
  Time: 8:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%!
    int a = 0;
%>
<%
    int b =0;
    a++;
    b++;
%>
你是第<%=a%>个访问本网站的人<br>
你是第<%=b%>个访问本网站的人<br>
<a href="../index.jsp">返回首页</a>
</body>
</html>
