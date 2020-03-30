<%--
  Created by IntelliJ IDEA.
  User: yinhaoyu
  Date: 2020/3/30
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="BeZhuCe.jsp" method="post">
    姓名：<input type="text" name="name"><br>
    密码：<input type="password" name="password"><br>
    性别：<input type="radio" value="男" name="sex">男
    <input type="radio" value="女" name="sex">女<br>
    <input type="submit">
    <input type="button" value="取消">
</form>
</body>
</html>
