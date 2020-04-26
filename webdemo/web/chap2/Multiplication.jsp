<%--
  Created by IntelliJ IDEA.
  User: yinhaoyu
  Date: 2020/3/17
  Time: 12:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<title>Title</title>
</head>
<body>
<%
    int sum = 0;
    for (int left = 1; left < 10; left++) {
        for (int right = 1; right <= left; right++) {
            sum = left * right;
%>
<%=right%> * <%=left%> = <%=sum%>
<%
    }
%>
<br>
<%
    }
%>
<a href="../index.jsp">返回首页</a>
</body>
</html>
