<%--
  Created by IntelliJ IDEA.
  User: yinhaoyu
  Date: 2020/3/24
  Time: 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    int score = 50;
    if (score > 60) {
%>
<jsp:forward page="good.jsp">
    <jsp:param name="name" value="tom"/>
    <jsp:param name="score" value="<%=score%>"/>
</jsp:forward>
<%
} else {
%>
<jsp:forward page="better.jsp">
    <jsp:param name="name" value="tom"/>
    <jsp:param name="score" value="<%=score%>"/>
</jsp:forward>
<%
    }
%>
</body>
</html>
