<%--
  Created by IntelliJ IDEA.
  User: yinhaoyu
  Date: 2020/3/17
  Time: 8:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    int s = 1;
    for(int i = 1; i < 11;i++){
        s =s*i;
    }
%>
<b>10的阶乘为：</b><%=s %>
<a href="../index.jsp">返回首页</a>
</body>
</html>
