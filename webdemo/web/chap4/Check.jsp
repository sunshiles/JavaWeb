<%@ page import="javax.naming.Name" %><%--
  Created by IntelliJ IDEA.
  User: yinhaoyu
  Date: 2020/3/31
  Time: 16:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    //传递属性到请求头
    request.setAttribute("nameDemo", "testName");
    request.setCharacterEncoding("UTF-8");
    String name = request.getParameter("name");
    String password = request.getParameter("password");
    if ("admin".equals(name) && "123".equals(password)) {
        //第一步创建cookie对象
        Cookie cookie1 = new Cookie("name", name);
        Cookie cookie2 = new Cookie("password", password);
        //第二步设置cookie的有效期
        cookie1.setMaxAge(60 * 60 * 24);
        cookie2.setMaxAge(60 * 60 * 24);
        //第三步向客户端添加cookie信息
        response.addCookie(cookie1);
        response.addCookie(cookie2);
        //设置session.setAttribute()
        session.setAttribute("sessionName",name);
%>
<jsp:forward page="Result.jsp"></jsp:forward>
<%
    } else {
        response.sendRedirect("Failure.jsp");
    }
%>
</body>
</html>
