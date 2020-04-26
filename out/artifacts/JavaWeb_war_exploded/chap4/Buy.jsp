<%--
  Created by IntelliJ IDEA.
  User: yinhaoyu
  Date: 2020/4/8
  Time: 14:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>My JSP 'buy.jsp' starting page</title>
</head>
<body>

<table>
    <tr>
        <td>商品名称</td>
        <td>商品单价</td>
        <td>购买</td>
    </tr>
    <form action="AddCar.jsp" method="post">
        <tr>
            <td>手机</td>
            <td>2000</td>
            <td><input type="submit" name="buy" value="购买"/></td>
        </tr>
        <input type="hidden" name="goodName" value="手机"/>
        <input type="hidden" name="price" value="2000"/>
    </form>

    <form action="AddCar.jsp" method="post">
        <tr>
            <td>iPad</td>
            <td>2000</td>
            <td><input type="submit" name="buy" value="购买"/></td>
        </tr>
        <input type="hidden" name="goodName" value="iPad"/>
        <input type="hidden" name="price" value="2000"/>
    </form>

    <form action="AddCar.jsp" method="post">
        <tr>
            <td>笔记本</td>
            <td>2000</td>
            <td><input type="submit" name="buy" value="购买"/></td>
        </tr>
        <input type="hidden" name="goodName" value="笔记本"/>
        <input type="hidden" name="price" value="2000"/>
    </form>

    <form action="AddCar.jsp" method="post">
        <tr>
            <td>硬盘</td>
            <td>2000</td>
            <td><input type="submit" name="buy" value="购买"/></td>
        </tr>
        <input type="hidden" name="goodName" value="硬盘"/>
        <input type="hidden" name="price" value="2000"/>
    </form>
</table>
<a href="Pay.jsp">查看购物车</a>
</body>
</html>
