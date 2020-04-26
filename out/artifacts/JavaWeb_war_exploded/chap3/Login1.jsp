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
<jsp:include page="top.jsp" flush="true"/>
<form>
    <label>账户:</label>
    <label>
        <input type="text">
    </label><br><br>
    <label>密码:</label>
    <label>
        <input type="password">
    </label><br>
    <input type="submit" class="submit">
    <input type="button" value="取消" class="off">
</form>
<jsp:include page="bottom.jsp" flush="true" />
<a href="../index.jsp">返回首页</a>
</body>
</html>