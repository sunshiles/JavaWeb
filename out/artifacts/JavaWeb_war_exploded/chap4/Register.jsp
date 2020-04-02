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
<%
    //获取cookie信息
    Cookie[] cookies = request.getCookies();
    String name = "";
    String password = "";
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if ("name".equals(cookie.getName())) {
                name = cookie.getValue();
            }
            if ("password".equals(cookie.getName())) {
                password = cookie.getValue();
            }
        }
    }
%>
<%--可以在action属性中直接添加Check.jsp?name=admin&password=123，可以把name和
password值直接传递给Check.jsp,缺点是不安全--%>
<form action="Check.jsp" method="post">
    用户名：<input type="text" name="name" value="<%=name%>"><br>
    密码：<input type="password" name="password" value="<%=password%>"><br>
    性别：<input type="radio" value="男" name="sex">男
    <input type="radio" value="女" name="sex">女<br>
    爱好：<input type="checkbox" name="hobby" value="打球">打球
    <input type="checkbox" name="hobby" value="读书">读书<br>
    <select name="politicsStatus">
        <option value="党员">党员</option>
        <option value="共青团员">共青团员</option>
    </select>
    //设置隐藏域
    <input type="hidden" name="price" value="179"><br>
    <input type="submit">
    <input type="button" value="取消"><br>
    <a href="../index.jsp">返回首页</a>
</form>
</body>
</html>
