<%--
  Created by IntelliJ IDEA.
  User: yinhaoyu
  Date: 2020/4/7
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
    session.invalidate();
%>
<jsp:include page="Register.jsp"></jsp:include>
</body>
</html>
