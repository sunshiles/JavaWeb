<%--
  Created by IntelliJ IDEA.
  User: yinhaoyu
  Date: 2020/4/7
  Time: 9:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String sessionId = session.getId();
    out.print("sessionId为："+sessionId);
%>
<a href="../index.jsp">返回首页</a>
</body>
</html>
