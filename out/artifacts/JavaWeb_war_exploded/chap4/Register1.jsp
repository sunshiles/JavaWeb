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
<form action="GetHeader.jsp" method="post">
    用户名：<input type="text" name="name"><br>
    密码：<input type="password" name="password"><br>
    性别：<input type="radio" value="男" name="sex">男
    <input type="radio" value="女" name="sex">女<br>
    爱好：<input type="checkbox" name="hobby" value="打球">打球
    <input type="checkbox" name="hobby" value="读书">读书<br>
    <select name="zzmm">
        <option value="党员">党员</option>
        <option value="共青团员">共青团员</option>
    </select>
    <input type="hidden" name="price" value="179"><br>
    <input type="submit">
    <input type="button" value="取消"><br>
    <a href="../index.jsp">返回首页</a>

</form>
</body>
</html>
