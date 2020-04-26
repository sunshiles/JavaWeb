<%--
  Created by IntelliJ IDEA.
  User: yinhaoyu
  Date: 2020/3/17
  Time: 9:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%! int jiecheng(int a){
    int s = 1;
    for(int i = 1; i < a+1;i++){
        s =s*i;
    }
    return s;
}
%>
<form name="tijiao" onsubmit="return check()">
    输入值：<input type="text" name="number">
    <input type="submit" value="提交">
</form>
<%
    int x = 0;
    String   t = request.getParameter("number");
    int y = 0;
    if (t!=null && !"".equals(t)){
        y = Integer.parseInt(t);
    }
    x = jiecheng(y);
%>
<%=y%>的阶乘为：<%=x%><br>
<a href="../index.jsp">返回首页</a>
</body>
</html>
