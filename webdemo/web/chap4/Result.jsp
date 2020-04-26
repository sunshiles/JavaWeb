<%--
  Created by IntelliJ IDEA.
  User: yinhaoyu
  Date: 2020/3/30
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>
<body>
<%
    String nameDemo = (String) request.getAttribute("nameDemo");
    String name = request.getParameter("name");
    String password = request.getParameter("password");
    String sex = request.getParameter("sex");
    String[] hobby = request.getParameterValues("hobby");
    String politicsStatus = request.getParameter("politicsStatus");
    String price = request.getParameter("price");
    String sessionName = (String) session.getAttribute("sessionName");
%>
欢迎<%=sessionName%>登录商城！<a href="SessionAllTest.jsp">测试session</a><br>
用户注册的信息：<br>
测试request.getAttribute：<%=nameDemo%><br>
用户名：<%=name%><br>
密码：<%=password%><br>
性别：<%=sex%><br>
爱好：<%
    String sum = "";
    for (String s : hobby) {
        sum += s + " ";
    }
%>
<%=sum%><br>
政治面貌：<%=politicsStatus%><br>
价格：<%=price%><br>
<a href="../index.jsp">返回首页</a>
</body>
</html>
