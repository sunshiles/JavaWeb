<%@ page import="java.util.ArrayList" %>
<%@ page import="com.whc.entity.Cart" %>
<%@ page import="com.whc.entity.RealUser" %>
<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>快乐购商城</title>
    <meta name="keywords" content="快乐购商城">
    <meta name="description" content="快乐购商城">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/cart.css">
</head>

<body>
<!-- --------------引入jquery文件------------- -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
<!-- --------------网页头部------------- -->
<%
    RealUser realUser = null;
    if (session.getAttribute("realUser") != null) {
        realUser = (RealUser) session.getAttribute("realUser");
    }
%>
<div class="header_top clear">
    <div class="width1200">
        <div class="h_t_l">
            <div>
                <span>欢迎您！</span>
                <a href="javascript:;" target="_blank" class="a_login">web
                </a>
                <a href="http://10.31.163.17/second/projectname/src/login.html" target="_blank" class="a_reg">[退出]</a>
            </div>
        </div>
        <div class="h_t_r">
            <ul>
                <li><a href="javascript:;">合作招商</a></li>
                <li><a href="javascript:;">订单查询</a></li>
                <li><a href="javascript:;">我的快乐购</a></li>
                <li>
                    <a href="javascript:;">
                        <i></i>
                        <span>400-705-1111</span>
                    </a>
                </li>
                <li>
                    <a href="javascript:;">下载快乐购app</a>
                </li>
                <li>
                    <a href="javascript:;">
                        客服中心
                        <b></b>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>
<!-- ----------------购物车上半部分------------------ -->
<div class="cart_top">
    <div class="box_center width1200 clear">
        <div class="logo">
            <a href="javascript:;"><img src="https://ecimg.happigo.com/resource/web/images/logo.jpg"></a>
        </div>
        <div class="plan">
            <div></div>
        </div>
    </div>
</div>
<!-- ----------------购物车中间部分------------------ -->
<div class="cart_mid">
    <div class="width1200 clear">
        <form method="POST">
            <div class="shop">
                <div class="shop_title">
                    <div class="cart_checkbox car_check">
                        <lable>
                            <input type="checkbox" checked="checked" class="all_sel">
                            <span>全选</span>
                        </lable>
                        <span class="col sum">商品编号</span>
                        <span class="shop_name">商品</span>
                    </div>
                    <div class="col unit_price">单价(元)</div>
                    <div class="col quantity">数量</div>
                    <%--                    <div class="col unit_price">总价</div>--%>
                    <div class="col del">商品类型</div>
                </div>
                <div class="shop_list">
                    <div class="shop_h2">
                            <span class="shop_all car_check">
                                <input type="checkbox" checked="checked" class="all_sel">
                            </span>
                        <span class="self-support">
                                <span>自营</span>
                            </span>
                        <a href="javascript:;" class="shopname">快乐购商城</a>
                        <div class="shopcheap clear">在线支付满129.00包邮</div>
                    </div>
                    <%
                        ArrayList<Cart> carts = (ArrayList<Cart>) session.getAttribute("carts");
                        double total = 0;
                        if (carts == null || carts.size() == 0) { %>
                    <div class="car_no_goods">
                        <img src="img/footer_ewm_02.png"/>
                        <div class="no_goods">
                            <p class="no_goods_t">购物车为空</p>
                            <p><a href="index.jsp">立即购买</a></p>
                        </div>
                    </div>
                    <%
                    } else {
                        for (Cart cart : carts) {
                            total += (cart.getNumber() * cart.getPrice());
                    %>
                    <div class="item_list" style="">
                        <div class="item_form">
                            <div class="info s_sum">
                                <p><%=cart.getCode()%>
                                </p>
                            </div>
                            <div class="info s_sel car_check">
                                <input type="checkbox" checked="checked">
                            </div>
                            <div class="info s_info">
                                <div class="box_img">
                                    <a href="javascript:;"><img
                                            src="<%=request.getContextPath()+cart.getPicture().substring(2)%>"></a>
                                </div>
                                <div class="box_name">
                                    <div class="box_titl"><a href="javascript:;"><%=cart.getName()%>
                                    </a></div>
                                    <div></div>
                                </div>
                            </div>
                            <div class="info s_price">
                                <p><%=cart.getPrice()%>
                                </p>
                            </div>
                            <div class="info s_num">
                                <a href="CartServlet?operate=remove&id=<%=cart.getId()%>" class="redu">-</a>
                                <input type="text" value="<%=cart.getNumber()%>">
                                <a href="CartServlet?operate=buy&id=<%=cart.getId()%>" class="add">+</a>
                            </div>
                            <%--                            <div class="info s_sum">--%>
                            <%--                                <strong>￥--%>
                            <%--                                    <em></em>--%>
                            <%--                                </strong>--%>
                            <%--                            </div>--%>
                            <div class="info s_del">
                                <a href="javascript:;"><%=cart.getType()%>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                        }
                    }
                %>
                <div class="shop_price">
                    <div class="out">
                        <div class="width1200 clear">
                            <div class="sel_all car_check">
                                <lable>
                                    <input type="checkbox" checked="ckecked" class="all_sel">
                                    <span>全选</span>
                                </lable>
                            </div>
                            <div class="sel_ok">
                                <div class="sel_ok_num">
                                    已选商品<span><em></em></span>件
                                </div>
                                <div class="sel_price">
                                    <p class="sel_type">
                                        商品总价（不含运费）
                                        <span>￥<em><%=total%></em></span>
                                    </p>
                                </div>
                                <div class="btn_buy" style="margin-right: 10px">
                                    <a href="CartServlet?operate=del" class="a_btn_buy">清空</a>
                                </div>
                                <div class="btn_buy" style="margin-right: 10px">
                                    <a href="index.jsp" class="a_btn_buy">继续购物</a>
                                </div>
                                <div class="btn_buy">
                                    <a href="buy/checkout.jsp" class="a_btn_buy">去结算</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

<!-- ----底部---- -->
<section class="footer"></section>
<script>
    $('.footer').load('public_html/footer.html');
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
<script src="script/thirdplugins/jquery.cookie.js" type="text/javascript" charset="utf-8"></script>
<%--<script src="script/js/cart.js" type="text/javascript" charset="utf-8"></script>--%>
</body>

</html>