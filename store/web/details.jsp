<%@ page import="com.whc.dao.ProductDao" %>
<%@ page import="com.whc.entity.Product" %>
<%@ page import="com.whc.factory.DaoFactory" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>详情页</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/details.css">
</head>

<body>
<!-- --------------引入jquery文件------------- -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
<!-- ----头部 注册栏 搜索栏 导航栏---- -->
<section class="header"></section>
<!-- 引入头部文件 -->
<jsp:include page="public_html/header.jsp"/>

<!-- ------------商品详情------------- -->
<%
    ProductDao productDao = DaoFactory.getProductDao();
    String id = request.getParameter("id");
    int idInt = Integer.parseInt(id);
    Product product = productDao.queryById(idInt);
%>
<form method="post" action="CartServlet?operate=add" class="details width1090 clear">
    <div class="source">
        <a href="javascript:;">首页</a>
        <span>></span>
        <a href="javascript:;">家电数码</a>
        <span>></span>
        <a href="javascript:;">生活家电</a>
    </div>
    <div class="sp_content">
        <div class="sp_box">
            <!-- ------------商品内容左边-------------- -->
            <div class="sp_l">
                <div class="sp_img">
                    <div class="sp_big_img clear">
                        <a href="javascript:;">
                            <div class="glass">
                                <div id="spic">
                                    <img src="<%=request.getContextPath()+product.getPicture().substring(2)%>" id="smallpic">
                                    <div class="sf" id="sf"></div>
                                </div>
                                <div class="bf" id="bf">
                                    <div class="bf_out">
                                        <div class="bf_in">
                                            <img src="<%=request.getContextPath()+product.getPicture().substring(2)%>" id="bpic">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="sp_sm_img">
                        <div class="show_img">
                            <ul class="img_list clear">

                            </ul>
                        </div>
                        <div class="lr_btn">
                            <a href="javascript:;" class="btn l_btn">L</a>
                            <a href="javascript:;" class="btn r_btn">R</a>
                        </div>
                    </div>
                </div>
                <div class="number">
                    <div class="num">编号：<em id="numsid"></em></div>
                    <div class="collect">
                        <i></i> 收藏商品
                    </div>
                </div>
            </div>
            <!-- ------------商品内容中间-------------- -->
            <div class="sp_m">
                <div class="info">
                    <h1 class="title1">
                            <span>
                                <em class="eml">[</em>
                                <strong class="sm_tit"><%=product.getProductName()%></strong>
                                <em class="emr">]</em>
                            </span>
                        <strong class="tit"></strong>

                    </h1>
                    <h2 class="title2">
                        微博热门推荐产品，美护大神Goss大叔强烈推荐单品！性价比很高的眼部精华，去水肿效果令人惊艳！改善眼部细纹、紧致提亮眼周、消除眼部浮肿；无色素、无香精、无激素。</h2>
                    <div class="price">
                        <div class="price_info clear">
                            <span class="happy">原价</span>
                            <div class="money">
                                <em>￥</em>
                                <span class="price_now"><%=product.getPrice()%></span>
                            </div>
                        </div>
                        <div class="price_info clear">
                            <span class="happy">促销价</span>
                            <div class="money">
                                <em>￥</em>
                                <span class="price_now"><%=product.getSale()%></span>
                            </div>
                        </div>
                    </div>
                    <div class="freight">
                        <span class="freight_info">类型</span>
                        <span class="postage"><%=product.getType()%></span>
                    </div><div class="freight">
                        <span class="freight_info">品牌</span>
                        <span class="postage"><%=product.getBrand()%></span>
                    </div><div class="freight">
                        <span class="freight_info">运费</span>
                        <span class="postage">包邮</span>
                    </div>
                    <div class="sp_info">
                        <div class="color title">
                            <span>颜色</span>
                            <ul>
                                <li>
                                    <a href="javascript:;">默认</a>
                                    <b></b>
                                </li>
                            </ul>
                        </div>
                        <div class="size title">
                            <span>尺码</span>
                            <ul>
                                <li>
                                    <a href="javascript:;">默认</a>
                                    <b></b>
                                </li>
                            </ul>
                        </div>
                        <div class="number title">
                            <span>数量</span>
                            <div class="add_sub">
                                <a href="javascript:;" class="btn_reduce">-</a>
                                <input value="1" class="text" name="goodNumber">
                                <a href="javascript:;" class="btn_add">+</a>
                            </div>
                        </div>
                        <a class="buy">
                            <input type="submit" class="code_buy" value="添加到购物车">
                            <div class="two_code_buy">
                                <p>该商品支持微信扫码购买哦！</p>
                                <div class="buy_img">
                                    <img src="https://ecimg.happigo.com/data/upload/shop/store/1/291/WxLite_247791.png">
                                </div>
                            </div>
                        </a>
                        <div class="cheap">
                            <div>直播商品在线实付满199减10元</div>
                        </div>
                    </div>
                </div>
            </div>
            <input type="hidden" name="goodId" value="<%=product.getId()%>">
            <input type="hidden" name="goodPrice" value="<%=product.getPrice()%>">
            <input type="hidden" name="goodCode" value="<%=product.getCode()%>">
            <input type="hidden" name="goodName" value="<%=product.getProductName()%>">
            <input type="hidden" name="goodType" value="<%=product.getType()%>">
            <input type="hidden" name="goodPicture" value="<%=product.getPicture()%>">
            <!-- ------------商品内容右边-------------- -->
            <div class="sp_r">
                <div class="sp_r_info">
                    <p class="bg_img">
                        <img src="https://ecimg.happigo.com/data/upload/shop/store/1/291/WxLite_247791.png">
                        <b></b>
                    </p>
                    <p>
                        <span class="span_info">微信扫码订购</span>
                        <span class="span_info">在线支付满199减10</span>
                    </p>
                </div>
            </div>
        </div>
    </div>
</form>
<!-- ----底部---- -->
<jsp:include page="public_html/footer.jsp"/>
<!-- ----右边固定栏---- -->
<section class="fixed_right"></section>
<script>
    $('.fixed_right').load('public_html/right_fixed.html');
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
<script src="script/thirdplugins/jquery.cookie.js"></script>
<script src="script/js/details.js"></script>
</body>

</html>