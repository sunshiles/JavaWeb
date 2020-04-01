<%--
  Created by IntelliJ IDEA.
  User: yinhaoyu
  Date: 2020/3/31
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="show_time" style="">
    <script>
        //这里就一句话就可以显示时间，但不是我想要的最理想结果
        const show_time = document.getElementById("show_time");
        show_time.innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());
    </script>
</div>
<%
    response.addHeader("refresh", "1");
%>
</body>
</html>
