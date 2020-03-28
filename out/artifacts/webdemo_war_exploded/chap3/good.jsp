<%--
  Created by IntelliJ IDEA.
  User: yinhaoyu
  Date: 2020/3/24
  Time: 10:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<% String name = request.getParameter("name");
String score = request.getParameter("score");
%>
<%=name%>成绩很好！<br>
你的成绩是：<%=score%>
</body>
</html>
