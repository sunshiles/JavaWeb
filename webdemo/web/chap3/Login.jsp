<%--
  Created by IntelliJ IDEA.
  User: yinhaoyu
  Date: 2020/3/24
  Time: 8:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        form {
            margin: 100px auto 0;
            width: 300px;
            height: 200px;
        }

        .submit {
            margin: 20px 50px;
        }

        .off {
            margin: auto;
        }
    </style>
</head>
<body>
<%@include file="top.jsp" %>
<form action="doZhuti.jsp" method="post">
    账户:<input type="text" name="admin">
    <br><br>
    密码:<input type="password" name="password">
    <br>
    <input type="submit">
    <input type="button" value="取消" class="off">
</form>
<a href="../index.jsp">返回首页</a>
<%@include file="bottom.jsp" %>
</body>
</html>
