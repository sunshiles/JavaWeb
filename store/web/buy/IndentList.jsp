<%@ page import="com.whc.entity.IndentDetail" %>
<%@ page import="com.whc.entity.Order" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.whc.entity.RealUser" %>
<%@ page import="com.whc.entity.Indent" %>
<%@ page import="com.whc.dao.IndentDao" %><%--
  Created by IntelliJ IDEA.
  User: yinhaoyu
  Date: 2020/6/23
  Time: 9:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    RealUser user = (RealUser) session.getAttribute("realUser");
    ArrayList<Indent> indents =(ArrayList<Indent>)request.getAttribute("indents");
    System.out.println(indents.size());
    for(Indent indent:indents){ %>
<table border="1">

    <tr>
        <th scope="col" colspan="4">
            会员名字：<span style="font-size: 12px;color: blue;"><%=indent.getUserName() %></span>&nbsp;
            会员的地址：<span style="font-size: 12px;color: blue;"><%= indent.getAddress()%></span>&nbsp;

        </th>
        <th scope="col" colspan="4">
            订单编号：<span style="font-size: 12px;color: blue;"><%=indent.getId() %></span>&nbsp;
            状态：<span style="font-size: 12px;color: blue;"><%=indent.getStatus() %></span>&nbsp;
            订单时间：<span style="font-size: 12px;color: blue;"><%=indent.getOrdertime() %></span>&nbsp;
            收货人：<span style="font-size: 12px;color: blue;"><%=indent.getUserName() %></span>&nbsp;
            <%if(indent.getStatus().equals("已发货")){ %>
            <span style="font-size: 12px;color: red;"><a href="OrderServlet?flag=receive&id=<%=indent.getId() %>">确认收货</a></span>
            <%} %>
        </th>
    </tr>
    <tr>
        <td class="row" align="center" >商品名称</td>
        <td class="row" >商品图片</td>
        <td class="row">商品价格</td>
        <td class="row" >商品数量</td>
    </tr>
    <%for(IndentDetail od : indent.getDetailList()){
    %>
    <tr>
        <td class="row" ><%=od.getpName() %></td>
        <td class="row" ><img src="<%=od.getPic()%>" width="75" height="50" /></td>
        <td class="row"><%=od.getPrice() %></td>
        <td class="row"><%=od.getNum() %></td>
    </tr>
    <%}
    }%>
</table>
<a href="../index.jsp" class="a_btn_buy">继续购物</a>
</body>
</html>
